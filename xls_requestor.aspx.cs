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

public partial class xls_requestor : System.Web.UI.Page
{
    protected dsUserTableAdapters.dtSiteletsTableAdapter dtSiteletsTA = new dsUserTableAdapters.dtSiteletsTableAdapter();
    protected dsUser.dtSiteletsDataTable dtSiteletsDT = new dsUser.dtSiteletsDataTable();
    protected string strSitelets = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            dsReportTableAdapters.dtUsersByRequestorTableAdapter dtUsersByRequestorTA = new dsReportTableAdapters.dtUsersByRequestorTableAdapter();
            dsReport.dtUsersByRequestorDataTable dtUsersByRequestorDT = new dsReport.dtUsersByRequestorDataTable();
            dtUsersByRequestorDT = dtUsersByRequestorTA.GetUsersByRequestor(Convert.ToInt32(Request.QueryString["id"].ToString()));

            for (int i = 0; i < dtUsersByRequestorDT.Rows.Count; i++)
            {
                if (!(dtUsersByRequestorDT.Rows[i]["UserLevel"] is DBNull))
                {

                    switch (dtUsersByRequestorDT[i].UserLevel)
                    {
                        case "A": dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                        case "B": dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                        case "C":
                            if (!(dtUsersByRequestorDT.Rows[i]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByRequestorDT[i].AllowedYear)
                                {
                                    dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                }
                                else
                                {
                                    dtUsersByRequestorDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                }
                            }
                            else
                            {
                                dtUsersByRequestorDT[i].Status = "<b>Unknown</b>";
                            }

                            break;
                        case "D":
                            if (!(dtUsersByRequestorDT.Rows[i]["FromDate"] is DBNull) && !(dtUsersByRequestorDT.Rows[i]["ToDate"] is DBNull))
                            {
                                if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtUsersByRequestorDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByRequestorDT[i].ToDate))
                                {
                                    dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                }
                                else
                                {
                                    dtUsersByRequestorDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                }
                            }
                            else
                            {
                                dtUsersByRequestorDT[i].Status = "<b>Unknown</b>";
                            }
                            break;
                        default: break;
                    }
                }
            }
            
            
            gvUsers.DataSource = dtUsersByRequestorDT;
            gvUsers.DataBind();

            dsCompanyTableAdapters.dtRequestorLastNameTableAdapter dtRequestorLastNameTA = new dsCompanyTableAdapters.dtRequestorLastNameTableAdapter();
            dsCompany.dtRequestorLastNameDataTable dtRequestorLastNameDT = new dsCompany.dtRequestorLastNameDataTable();
            dtRequestorLastNameDT = dtRequestorLastNameTA.GetRequestorLastNameByID(Convert.ToInt32(Request.QueryString["id"].ToString()));


            Response.Clear();
            Response.ClearHeaders();//For HTTPS
            Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

            //Response.AddHeader("content-disposition", "attachment; filename=SpifeAssociates"+Convert.ToDateTime(AssociatesDT.Rows[0]["downloaddate"].ToString()).ToShortDateString()+".xls");
            Response.AddHeader("content-disposition", "attachment; filename=" + dtRequestorLastNameDT[0].lastname + "_user_list.xls");
            Response.Charset = "";
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //
            //Response.AddHeader("Content-Type", "application/vnd.ms-excel");
            Response.ContentType = "application/vnd.xls";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

            gvUsers.RenderControl(htmlWrite);

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
