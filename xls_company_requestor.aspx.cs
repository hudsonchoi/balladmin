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

public partial class xls_company_requestor : System.Web.UI.Page
{
    protected dsCompanyTableAdapters.dtSiteletsTableAdapter dtSiteletsTA = new dsCompanyTableAdapters.dtSiteletsTableAdapter();
    protected dsCompany.dtSiteletsDataTable dtSiteletsDT = new dsCompany.dtSiteletsDataTable();
    protected string strSitelets = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            dsReportTableAdapters.dtCompaniesByRequestorTableAdapter dtCompaniesByRequestorTA = new dsReportTableAdapters.dtCompaniesByRequestorTableAdapter();
            dsReport.dtCompaniesByRequestorDataTable dtCompaniesByRequestorDT = new dsReport.dtCompaniesByRequestorDataTable();
            dtCompaniesByRequestorDT = dtCompaniesByRequestorTA.GetCompaniesByRequestor(Convert.ToInt32(Request.QueryString["id"].ToString()));
            
            //Status Code
            for (int i = 0; i < dtCompaniesByRequestorDT.Rows.Count; i++)
            {
                if (!(dtCompaniesByRequestorDT.Rows[i]["UserLevel"] is DBNull))
                {

                    switch (dtCompaniesByRequestorDT[i].UserLevel)
                    {
                        case "A": dtCompaniesByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                        case "B": dtCompaniesByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                        case "C":
                            if (!(dtCompaniesByRequestorDT.Rows[i]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtCompaniesByRequestorDT[i].AllowedYear)
                                {
                                    dtCompaniesByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                }
                                else
                                {
                                    dtCompaniesByRequestorDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                }
                            }
                            else
                            {
                                dtCompaniesByRequestorDT[i].Status = "<b>Unknown</b>";
                            }

                            break;
                        case "D":
                            if (!(dtCompaniesByRequestorDT.Rows[i]["FromDate"] is DBNull) && !(dtCompaniesByRequestorDT.Rows[i]["ToDate"] is DBNull))
                            {
                                if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtCompaniesByRequestorDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtCompaniesByRequestorDT[i].ToDate))
                                {
                                    dtCompaniesByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                }
                                else
                                {
                                    dtCompaniesByRequestorDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                }
                            }
                            else
                            {
                                dtCompaniesByRequestorDT[i].Status = "<b>Unknown</b>";
                            }
                            break;
                        default: break;
                    }
                }
            }
            
            
            
            gvCompany.DataSource = dtCompaniesByRequestorDT;
            gvCompany.DataBind();

            dsCompanyTableAdapters.dtRequestorLastNameTableAdapter dtRequestorLastNameTA = new dsCompanyTableAdapters.dtRequestorLastNameTableAdapter();
            dsCompany.dtRequestorLastNameDataTable dtRequestorLastNameDT = new dsCompany.dtRequestorLastNameDataTable();
            dtRequestorLastNameDT = dtRequestorLastNameTA.GetRequestorLastNameByID(Convert.ToInt32(Request.QueryString["id"].ToString()));

            Response.Clear();
            Response.ClearHeaders();//For HTTPS
            Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

            //Response.AddHeader("content-disposition", "attachment; filename=SpifeAssociates"+Convert.ToDateTime(AssociatesDT.Rows[0]["downloaddate"].ToString()).ToShortDateString()+".xls");
            Response.AddHeader("content-disposition", "attachment; filename=" + dtRequestorLastNameDT[0].lastname + "_company_list.xls");
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
        else
        {
            Response.Redirect("./");
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    protected void gvCompany_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[8].Text = "BINGO!";
            strSitelets = string.Empty;
            dtSiteletsDT = dtSiteletsTA.GetSiteletNamesByCID(Convert.ToInt32(e.Row.Cells[9].Text));
            for (int i = 0; i < dtSiteletsDT.Rows.Count; i++)
            {
                if (i > 0)
                {
                    strSitelets += ", ";
                }
                strSitelets += dtSiteletsDT[i].description;
            }
            e.Row.Cells[9].Text = strSitelets;

        }
         
    }
}
