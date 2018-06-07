using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class xls_company_admin : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        dsReportTableAdapters.dtCompaniesOfAdminTableAdapter dtCompaniesOfAdminTA = new dsReportTableAdapters.dtCompaniesOfAdminTableAdapter();
        dsReport.dtCompaniesOfAdminDataTable dtCompaniesOfAdminDT = new dsReport.dtCompaniesOfAdminDataTable();
        dtCompaniesOfAdminDT = dtCompaniesOfAdminTA.GetCompaniesOfAdmin();
        gvCompany.DataSource = dtCompaniesOfAdminDT;
        gvCompany.DataBind();

        Response.Clear();
        Response.ClearHeaders();//For HTTPS
        Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

        //Response.AddHeader("content-disposition", "attachment; filename=SpifeAssociates"+Convert.ToDateTime(AssociatesDT.Rows[0]["downloaddate"].ToString()).ToShortDateString()+".xls");
        Response.AddHeader("content-disposition", "attachment; filename=admin_company_list.xls");
        Response.Charset = "";
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //
        //Response.AddHeader("Content-Type", "application/vnd.ms-excel");
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        gvCompany.RenderControl(htmlWrite);

        /*
        sqlDataAdapter1.Fill(dsDownload1, "users");
        if (!Page.IsPostBack)
        {
            dgDownload.DataSource = dsDownload1;
            dgDownload.DataBind();
        }
        dgDownload.RenderControl(htmlWrite);
         */
        Response.Write(stringWrite.ToString());
        Response.End();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }

}
