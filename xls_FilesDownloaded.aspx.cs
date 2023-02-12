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

public partial class xls_FilesDownloaded : System.Web.UI.Page
{

    public int iCount;
    private string strSection;
    protected void Page_Load(object sender, EventArgs e)
    {
        Server.ScriptTimeout = 180;

        //dsReportTableAdapters.uspCMCLoginReportByDatesTableAdapter uspCMCLoginReportByDatesTA = new dsReportTableAdapters.uspCMCLoginReportByDatesTableAdapter();
        //dsReport.uspCMCLoginReportByDatesDataTable uspCMCLoginReportByDatesDT = uspCMCLoginReportByDatesTA.GetUspCMCLoginReportByDates(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
        //gvUsers.DataSource = uspCMCLoginReportByDatesDT;
        //gvUsers.Columns[17].Visible = true;


        //if (Convert.ToInt32(Request.QueryString["siteletID"]) == 1)//Club Arts - treat it seperately as it has year info and opening day in the section
        //{
        //    dsReportTableAdapters.uspClubArtsFilesDownloadedTableAdapter uspClubArtsFilesDownloadedTA = new dsReportTableAdapters.uspClubArtsFilesDownloadedTableAdapter();
        //    dsReport.uspClubArtsFilesDownloadedDataTable uspClubArtsFilesDownloadedDT =
        //    uspClubArtsFilesDownloadedTA.GetUspClubArtsFilesDownloaded("mlb", "opening", Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()).AddDays(1));
        //    iCount = uspClubArtsFilesDownloadedDT.Count;
        //    gvUsers.DataSource = uspClubArtsFilesDownloadedDT;
        //}
        //else
        //{
            switch (Convert.ToInt32(Request.QueryString["siteletID"]))
            {
                case 1:
                    strSection = "mlb";
                    break;
                case 2:
                    strSection = "spring";
                    break;
                case 3:
                    strSection = "alls";
                    break;
                case 4:
                    strSection = "world";
                    break;
                case 5:
                    strSection = "coop";
                    break;
                case 6:
                    strSection = "mascot";
                    break;
                case 7:
                    strSection = "minor";
                    break;
                case 8:
                    strSection = "trend";
                    break;
                case 9://No Tracking on Design Service
                    break;
                case 10:
                    strSection = "marketing";
                    break;
                case 11:
                    strSection = "restricted";
                    break;
                case 12:
                    strSection = "opening";
                    break;
                case 13:
                    strSection = "mascotbabies";
                    break;
                case 15:
                    strSection = "playball";
                    break;
                case 16:
                    strSection = "sponsors";
                    break;
                case 17:
                    strSection = "london";
                    break;
                case 18:
                    strSection = "restricted2";
                    break;
                case 19:
                    strSection = "restricted3";
                    break;
                case 20:
                    strSection = "mlblogovault";
                    break;
                case 21:
                    strSection = "restricted4";
                    break;
                case 22:
                    strSection = "allscp";
                    break;
                case 23:
                    strSection = "openingcp";
                    break;
                case 24:
                    strSection = "springcp";
                    break;
                case 25:
                    strSection = "worldcp";
                    break;

        }

        //dsReportTableAdapters.uspFilesDownloadedTableAdapter uspFilesDownloadedTA = new dsReportTableAdapters.uspFilesDownloadedTableAdapter();
        //dsReport.uspFilesDownloadedDataTable uspFilesDownloadedDT = uspFilesDownloadedTA.GetUspFilesDownloaded(strSection, Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()).AddDays(1));
        //iCount = uspFilesDownloadedDT.Count;
        //gvUsers.DataSource = uspFilesDownloadedDT;
        DataTable dtFilesDownloaded = AdminDAL.GetFileTracking(strSection, Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
            iCount = dtFilesDownloaded.Rows.Count;
            gvUsers.DataSource = dtFilesDownloaded;

        //}
        //gvUsers.DataBind();







        gvUsers.Caption = "Traffic Report (Files Downloaded) :: " + Request.QueryString["sitelet"] + " :: From " + Request.QueryString["from"].ToString() + " To " + Request.QueryString["to"].ToString();

        gvUsers.DataBind();

        Response.Clear();
        Response.ClearHeaders();//For HTTPS
        Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

        //Response.AddHeader("content-disposition", "attachment; filename=SpifeAssociates"+Convert.ToDateTime(AssociatesDT.Rows[0]["downloaddate"].ToString()).ToShortDateString()+".xls");

        Response.AddHeader("content-disposition", "attachment; filename=FilesDownloaded_" + Request.QueryString["sitelet"] + ".xls");
        
        Response.Charset = "";
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        gvUsers.RenderControl(htmlWrite);

        Response.Write(stringWrite.ToString());
        Response.End();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}
