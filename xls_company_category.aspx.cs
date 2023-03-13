using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class xls_company_category : System.Web.UI.Page
{
    protected dsCompanyTableAdapters.dtSiteletsTableAdapter dtSiteletsTA = new dsCompanyTableAdapters.dtSiteletsTableAdapter();
    protected dsCompany.dtSiteletsDataTable dtSiteletsDT = new dsCompany.dtSiteletsDataTable();
    protected string strSitelets = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["category"] != null)
        {

            dsReportTableAdapters.dtCompaniesByCategoryTableAdapter dtCompaniesByCategoryTA = new dsReportTableAdapters.dtCompaniesByCategoryTableAdapter();
            dsReport.dtCompaniesByCategoryDataTable dtCompaniesByCategoryDT = new dsReport.dtCompaniesByCategoryDataTable();
            dtCompaniesByCategoryDT = dtCompaniesByCategoryTA.GetCompaniesByCategory(Request.QueryString["category"].ToString());

            for (int i = 0; i < dtCompaniesByCategoryDT.Rows.Count; i++)
            {
                if (!(dtCompaniesByCategoryDT.Rows[i]["UserLevel"] is DBNull))
                {

                    switch (dtCompaniesByCategoryDT[i].UserLevel)
                    {
                        case "A":
                            if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                            {
                                dtCompaniesByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                dtCompaniesByCategoryDT[i].Delete();
                            }
                            break;
                        case "B":
                            if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                            {
                                dtCompaniesByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                dtCompaniesByCategoryDT[i].Delete();
                            }
                            break;
                        case "C":
                            if (!(dtCompaniesByCategoryDT.Rows[i]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                                {
                                    if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtCompaniesByCategoryDT[i].AllowedYear)
                                    {
                                        dtCompaniesByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                    }
                                    else
                                    {
                                        dtCompaniesByCategoryDT[i].Delete();
                                    }
                                }
                                else
                                {
                                    if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtCompaniesByCategoryDT[i].AllowedYear)
                                    {
                                        dtCompaniesByCategoryDT[i].Delete();
                                    }
                                    else
                                    {
                                        dtCompaniesByCategoryDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                    }
                                }

                            }
                            else
                            {
                                dtCompaniesByCategoryDT[i].Status = "<b>Unknown</b>";
                            }

                            break;
                        case "D":
                            if (!(dtCompaniesByCategoryDT.Rows[i]["FromDate"] is DBNull) && !(dtCompaniesByCategoryDT.Rows[i]["ToDate"] is DBNull))
                            {
                                if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                                {
                                    if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtCompaniesByCategoryDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtCompaniesByCategoryDT[i].ToDate))
                                    {
                                        dtCompaniesByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                    }
                                    else
                                    {
                                        dtCompaniesByCategoryDT[i].Delete();
                                    }
                                }
                                else
                                {
                                    if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtCompaniesByCategoryDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtCompaniesByCategoryDT[i].ToDate))
                                    {
                                        dtCompaniesByCategoryDT[i].Delete();
                                    }
                                    else
                                    {
                                        dtCompaniesByCategoryDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                    }
                                }
                            }
                            else
                            {
                                dtCompaniesByCategoryDT[i].Status = "<b>Unknown</b>";
                            }
                            break;
                        default: //Including 'Blocked'
                            if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                            {
                                dtCompaniesByCategoryDT[i].Delete();
                            }
                            else
                            {
                                dtCompaniesByCategoryDT[i].Status = "<b><font color=\"red\">Blocked</font></b>";
                            }
                            break;
                    }
                }
            }

            dtCompaniesByCategoryDT.AcceptChanges();
            gvCompany.DataSource = dtCompaniesByCategoryDT;
            gvCompany.DataBind();

            Response.Clear();
            Response.ClearHeaders();//For HTTPS
            Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

            var fileName = string.Empty;
            if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
            {
                fileName = Request.QueryString["category"] + "_active_company_list.xls";
            }
            else
            {
                fileName = Request.QueryString["category"] + "_inactive_company_list.xls";
            }

            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

            gvCompany.RenderControl(htmlWrite);
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