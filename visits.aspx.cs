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

public partial class visits : System.Web.UI.Page
{
    public string strToday;
    public string strOneMonthAgo;
    public string strTheLastDay;
    public string strTheFirstDay;
    public int iCount;
    public int iSiteletID;
    private DateTime startDate;
    private DateTime endDate;
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
            ltrBreadCrumb.Text = " :: Traffic Report (Visits)";

        }
        else
        {
            Page.Validate();
            if (Page.IsValid)
            {

                if ((Request.Form["calendarPopup1$textBox"] != null) && (Request.Form["calendarPopup2$textBox"] != null))
                {
                    startDate = DateTime.Parse(Request.Form["calendarPopup1$textBox"]);
                    ViewState["startDate"] = startDate.ToShortDateString();
                    endDate = DateTime.Parse(Request.Form["calendarPopup2$textBox"]);
                    ViewState["endDate"] = endDate.ToShortDateString();

                    dsReportTableAdapters.uspCountVisitsTableAdapter uspCountVisitsTA = new dsReportTableAdapters.uspCountVisitsTableAdapter();
                    dsReport.uspCountVisitsDataTable uspCountVisitsDT = uspCountVisitsTA.GetUspCountVisits(startDate, endDate.AddDays(1));

                    gvVisits.DataSource = uspCountVisitsDT;
                    gvVisits.DataBind();

                    ltrBreadCrumb2.Text = " :: Club Marketing Center - From " + startDate.ToShortDateString() + " To " + endDate.ToShortDateString();
                    siteletTable.Visible = false;
                    resultDiv.Visible = true;
                }



            }


            ltrBreadCrumb.Text = " :: <a href=\"visits.aspx\">Traffic Report (Visits)</a>";


        }
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

    protected void lbXLS_Click(object sender, EventArgs e)
    {
        Response.Redirect("xls_visits.aspx?from=" + ViewState["startDate"] + "&to=" + ViewState["endDate"]);
    }

}
