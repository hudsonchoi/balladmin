using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class xls_category : System.Web.UI.Page
{
    protected dsUserTableAdapters.dtSiteletsTableAdapter dtSiteletsTA = new dsUserTableAdapters.dtSiteletsTableAdapter();
    protected dsUser.dtSiteletsDataTable dtSiteletsDT = new dsUser.dtSiteletsDataTable();
    protected string strSitelets = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["category"] != null)
        {
            dsReportTableAdapters.dtUsersByCategoryTableAdapter dtUsersByCategoryTA = new dsReportTableAdapters.dtUsersByCategoryTableAdapter();
            dsReport.dtUsersByCategoryDataTable dtUsersByCategoryDT = new dsReport.dtUsersByCategoryDataTable();
            dtUsersByCategoryDT = dtUsersByCategoryTA.GetUsersByCategory(Request.QueryString["category"].ToString());

            for (int i = 0; i < dtUsersByCategoryDT.Rows.Count; i++)
            {
                if (!(dtUsersByCategoryDT.Rows[i]["UserLevel"] is DBNull))
                {

                    switch (dtUsersByCategoryDT[i].UserLevel)
                    {
                        case "A":
                            if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                            {
                                dtUsersByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Delete();
                            }
                            break;
                        case "B":
                            if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                            {
                                dtUsersByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Delete();
                            }
                            break;
                        case "C":
                            if (!(dtUsersByCategoryDT.Rows[i]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                                {
                                    if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByCategoryDT[i].AllowedYear)
                                    {
                                        dtUsersByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                    }
                                    else
                                    {
                                        dtUsersByCategoryDT[i].Delete();
                                    }
                                }
                                else
                                {
                                    if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByCategoryDT[i].AllowedYear)
                                    {
                                        dtUsersByCategoryDT[i].Delete();
                                    }
                                    else
                                    {
                                        dtUsersByCategoryDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                    }
                                }

                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Status = "<b>Unknown</b>";
                            }

                            break;
                        case "D":
                            if (!(dtUsersByCategoryDT.Rows[i]["FromDate"] is DBNull) && !(dtUsersByCategoryDT.Rows[i]["ToDate"] is DBNull))
                            {
                                if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                                {
                                    if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtUsersByCategoryDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByCategoryDT[i].ToDate))
                                    {
                                        dtUsersByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                    }
                                    else
                                    {
                                        dtUsersByCategoryDT[i].Delete();
                                    }
                                }
                                else
                                {
                                    if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtUsersByCategoryDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByCategoryDT[i].ToDate))
                                    {
                                        dtUsersByCategoryDT[i].Delete();
                                    }
                                    else
                                    {
                                        dtUsersByCategoryDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                    }
                                }
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Status = "<b>Unknown</b>";
                            }
                            break;
                        default: //Including 'Blocked'
                            if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
                            {
                                dtUsersByCategoryDT[i].Delete();
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Status = "<b><font color=\"red\">Blocked</font></b>";
                            }
                            break;
                    }
                }
            }

            dtUsersByCategoryDT.AcceptChanges();
            gvUsers.DataSource = dtUsersByCategoryDT;
            gvUsers.DataBind();

            Response.Clear();
            Response.ClearHeaders();//For HTTPS
            Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

            var fileName = string.Empty;
            if (Convert.ToBoolean(Request.QueryString["active"].ToString()))
            {
                fileName = Request.QueryString["category"] + "_active_user_list.xls";
            }
            else
            {
                fileName = Request.QueryString["category"] + "_inactive_user_list.xls";
            }

            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

            gvUsers.RenderControl(htmlWrite);
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
    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[8].Text = "BINGO!";
            strSitelets = string.Empty;
            dtSiteletsDT = dtSiteletsTA.GetSiteletNamesByUID(Convert.ToInt32(e.Row.Cells[9].Text));
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