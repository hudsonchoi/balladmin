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

public partial class xls_visits : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DateTime startDate = DateTime.Parse(Request.QueryString["from"].ToString());
        DateTime endDate = DateTime.Parse(Request.QueryString["to"].ToString());

        dsReportTableAdapters.uspCountVisitsTableAdapter uspCountVisitsTA = new dsReportTableAdapters.uspCountVisitsTableAdapter();
        dsReport.uspCountVisitsDataTable uspCountVisitsDT = uspCountVisitsTA.GetUspCountVisits(startDate, endDate.AddDays(1));

        gvVisits.DataSource = uspCountVisitsDT;
        gvVisits.Caption = "Traffic Report (Visits) :: Club Marketing Center - From " + Request.QueryString["from"] + " To " + Request.QueryString["to"].ToString();
        gvVisits.DataBind();

        Response.Clear();
        Response.ClearHeaders();//For HTTPS
        Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

        //Response.AddHeader("content-disposition", "attachment; filename=SpifeAssociates"+Convert.ToDateTime(AssociatesDT.Rows[0]["downloaddate"].ToString()).ToShortDateString()+".xls");

        Response.AddHeader("content-disposition", "attachment; filename=Visits_CMC.xls");

        Response.Charset = "";
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        gvVisits.RenderControl(htmlWrite);

        Response.Write(stringWrite.ToString());
        Response.End();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}
