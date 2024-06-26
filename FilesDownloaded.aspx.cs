﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class FilesDownloaded : System.Web.UI.Page
{
    public string strToday;
    public string strOneMonthAgo;
    public string strTheLastDay;
    public string strTheFirstDay;
    public int iCount;
    public int iSiteletID;
    private string strSection;

    protected void Page_Load(object sender, EventArgs e)
    {
        Server.ScriptTimeout = 180;
        //Enable the last month checkbox
        cbLastMonth.Attributes.Add("onclick", "SetLastMonth()");
        strToday = DateTime.Now.ToShortDateString();
        strOneMonthAgo = DateTime.Now.AddMonths(-1).ToShortDateString();
        strTheLastDay = GetLastDayOfMonth(DateTime.Now.AddMonths(-1)).ToShortDateString();
        strTheFirstDay = GetFirstDayOfMonth(DateTime.Now.AddMonths(-1)).ToShortDateString();


        string strTemp = string.Empty;
        if (!Page.IsPostBack)
        {
            calendarPopup1.SelectedDate = Convert.ToDateTime(calendarPopup1.SelectedDate.ToShortDateString()).AddMonths(-1);
            ltrBreadCrumb.Text = " :: Traffic Report (Files Downloaded)";
        }
        else
        {
            Page.Validate();
            if (Page.IsValid)
            {
                if (Request.Form["calendarPopup1$textBox"] != null)
                {
                    Session["from"] = Request.Form["calendarPopup1$textBox"];
                }
                if (Request.Form["calendarPopup2$textBox"] != null)
                {
                    Session["to"] = Request.Form["calendarPopup2$textBox"];
                }
                if (ddlSitelet.SelectedItem.Text != null)
                {
                    Session["sitelet"] = ddlSitelet.SelectedItem.Text;
                }

                //if (Convert.ToInt32(ddlSitelet.SelectedItem.Value) == 1)//Club Arts - treat it seperately as it has year info and opening day in the section
                //{
                //    dsReportTableAdapters.uspClubArtsFilesDownloadedTableAdapter uspClubArtsFilesDownloadedTA = new dsReportTableAdapters.uspClubArtsFilesDownloadedTableAdapter();
                //    dsReport.uspClubArtsFilesDownloadedDataTable uspClubArtsFilesDownloadedDT =
                //        uspClubArtsFilesDownloadedTA.GetUspClubArtsFilesDownloaded("mlb", "opening", Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                //    iCount = uspClubArtsFilesDownloadedDT.Count;
                //    gvUsers.DataSource = uspClubArtsFilesDownloadedDT;
                //}
                //else
                //{
                     switch (Convert.ToInt32(ddlSitelet.SelectedItem.Value))
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
                         case 14:
                            strSection = "pressbox";
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
                            strSection = "allsem";
                            break;
                         case 23:
                            strSection = "openingem";
                            break;
                         case 24:
                            strSection = "springem";
                            break;
                        case 25:
                            strSection = "worldem";
                            break;
                        case 26:
                            strSection = "restricted5";
                            break;
                }

                     DataTable dtFilesDownloaded = AdminDAL.GetFileTracking(strSection, Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                     iCount = dtFilesDownloaded.Rows.Count;
                     gvUsers.DataSource = dtFilesDownloaded;
                    
                //}
                gvUsers.DataBind();


                lblResult.Text = "Number of files: <b>" + iCount + "</b>";
                ltrBreadCrumb2.Text = " :: " + Session["sitelet"] + " - From " + Session["from"] + " To " + Session["to"];
                siteletTable.Visible = false;
                resultDiv.Visible = true;



            }


            ltrBreadCrumb.Text = " :: <a href=\"FilesDownloaded.aspx\">Traffic Report (Files Downloaded)</a>";
            
            iSiteletID = Convert.ToInt32(ddlSitelet.SelectedItem.Value);

        }
    }
    protected void ddlSitelet_DataBound(object sender, EventArgs e)
    {
        string listItemText = "Select One";
        string listItemValue = "0";
        ddlSitelet.Items.Insert(0, new ListItem(listItemText, listItemValue));

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }


    private DateTime GetFirstDayOfMonth(DateTime dtDate)
    {
        DateTime dtFrom = dtDate;
        dtFrom = dtFrom.AddDays(-(dtFrom.Day - 1));
        return dtFrom;
    }

    private DateTime GetLastDayOfMonth(DateTime dtDate)
    {
        DateTime dtTo = dtDate;
        dtTo = dtTo.AddMonths(1);
        dtTo = dtTo.AddDays(-(dtTo.Day));
        return dtTo;
    }


    private DateTime GetFirstDayOfMonth(int iMonth)
    {
        DateTime dtFrom = new DateTime(DateTime.Now.Year, iMonth, 1);
        dtFrom = dtFrom.AddDays(-(dtFrom.Day - 1));
        return dtFrom;
    }

    protected void cvSitelet_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (ddlSitelet.SelectedIndex == 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void lbXLS_Click(object sender, EventArgs e)
    {
        if (Request.QueryString.ToString() == "not")
        {
            Response.Redirect("xls_FilesDownloaded.aspx?sitelet=" + Server.UrlEncode(Session["sitelet"].ToString()) + "&siteletID=" + iSiteletID + "&from=" + Session["from"] + "&to=" + Session["to"] + "&not=yes");
        }
        else
        {
            Response.Redirect("xls_FilesDownloaded.aspx?sitelet=" + Server.UrlEncode(Session["sitelet"].ToString()) + "&siteletID=" + iSiteletID + "&from=" + Session["from"] + "&to=" + Session["to"]);
        }
    }

    protected DataView SortDataTable(DataTable dataTable, bool isPageIndexChanging)
    {

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            if (GridViewSortExpression != string.Empty)
            {
                if (isPageIndexChanging)
                {
                    dataView.Sort = string.Format("{0} {1}", GridViewSortExpression, GridViewSortDirection);
                }
                else
                {
                    dataView.Sort = string.Format("{0} {1}", GridViewSortExpression, GetSortDirection());
                }
            }
            return dataView;
        }
        else
        {
            return new DataView();
        }

    }

    protected void gvUsers_Sorting(object sender, GridViewSortEventArgs e)
    {
        GridViewSortExpression = e.SortExpression;
        int pageIndex = gvUsers.PageIndex;
        gvUsers.DataSource = SortDataTable(gvUsers.DataSource as DataTable, false);
        gvUsers.DataBind();
        gvUsers.PageIndex = pageIndex;
    }
    private string GridViewSortDirection
    {
        get { return ViewState["SortDirection"] as string ?? "ASC"; }
        set { ViewState["SortDirection"] = value; }
    }



    private string GridViewSortExpression
    {
        get { return ViewState["SortExpression"] as string ?? string.Empty; }
        set { ViewState["SortExpression"] = value; }
    }

    private string GetSortDirection()
    {
        switch (GridViewSortDirection)
        {
            case "ASC":
                GridViewSortDirection = "DESC";
                break;
            case "DESC":
                GridViewSortDirection = "ASC";
                break;
        }
        return GridViewSortDirection;
    }


}
