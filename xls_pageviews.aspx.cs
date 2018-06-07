using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class xls_pageviews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DateTime startDate = DateTime.Parse(Request.QueryString["from"].ToString());
        DateTime endDate = DateTime.Parse(Request.QueryString["to"].ToString());

        DataTable dt = new DataTable();
        DataColumn dc1 = new DataColumn("Page");
        dt.Columns.Add(dc1);

        DateTime currentDate = startDate;
        while (currentDate <= endDate)
        {
            dt.Columns.Add(new DataColumn(currentDate.ToShortDateString()));
            currentDate = currentDate.AddDays(1);
        }

        dsReportTableAdapters.uspPagesTableAdapter uspPagesTA = new dsReportTableAdapters.uspPagesTableAdapter();
        dsReport.uspPagesDataTable uspPagesDT = uspPagesTA.GetUspPages(10);

        dsReportTableAdapters.uspCountPageViewsTableAdapter uspCountPageViewsTA = new dsReportTableAdapters.uspCountPageViewsTableAdapter();

        foreach (DataRow thisRow in uspPagesDT.Rows)
        {
            DataRow dr = dt.NewRow();
            dr["Page"] = thisRow["description"];
            currentDate = startDate;
            while (currentDate <= endDate)
            {
                dsReport.uspCountPageViewsDataTable uspCountPageViewsDT = uspCountPageViewsTA.GetUspCountPageViews(Convert.ToInt32(thisRow["page_id"]), currentDate, currentDate.AddDays(1));
                dr[currentDate.ToShortDateString()] = uspCountPageViewsDT.Rows[0]["pageviews"];
                //dr[currentDate.ToShortDateString()] = "BINGO!";
                currentDate = currentDate.AddDays(1);
            }
            dt.Rows.Add(dr);

        }

        gvPageViews.DataSource = dt;
        gvPageViews.Caption = "Traffic Report (Page Views) :: Club Marketing Center - From " + Request.QueryString["from"] + " To " + Request.QueryString["to"].ToString();
        gvPageViews.DataBind();

        Response.Clear();
        Response.ClearHeaders();//For HTTPS
        Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

        //Response.AddHeader("content-disposition", "attachment; filename=SpifeAssociates"+Convert.ToDateTime(AssociatesDT.Rows[0]["downloaddate"].ToString()).ToShortDateString()+".xls");

        Response.AddHeader("content-disposition", "attachment; filename=PageViews_CMC.xls");

        Response.Charset = "";
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        gvPageViews.RenderControl(htmlWrite);

        Response.Write(stringWrite.ToString());
        Response.End();
       
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}
