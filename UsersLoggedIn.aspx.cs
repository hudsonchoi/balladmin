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

public partial class UsersLoggedIn : System.Web.UI.Page
{
    public string strToday;
    public string strOneMonthAgo;
    public string strTheLastDay;
    public string strTheFirstDay;
    public int iCount;
    public int iSiteletID;

    protected void Page_Load(object sender, EventArgs e)
    {

       

        //Take care of the calendar
        cbLastMonth.Attributes.Add("onclick", "SetLastMonth()");
        strToday = DateTime.Now.ToShortDateString();
        strOneMonthAgo = DateTime.Now.AddMonths(-1).ToShortDateString();
        strTheLastDay = GetLastDayOfMonth(DateTime.Now.AddMonths(-1)).ToShortDateString();
        strTheFirstDay = GetFirstDayOfMonth(DateTime.Now.AddMonths(-1)).ToShortDateString();

        //bodyID.Attributes.Add("onload", "CheckCMC()");
        ddlSitelet.Attributes.Add("onChange", "CheckCMC()");

        string strTemp = string.Empty;
        if (!Page.IsPostBack)
        {
            calendarPopup1.SelectedDate = Convert.ToDateTime(calendarPopup1.SelectedDate.ToShortDateString()).AddMonths(-1);

            if (Request.QueryString.ToString() == "not")
            {
                ltrBreadCrumb.Text = " :: Traffic Report (Users Not Logged In)";
            }
            else
            {
                ltrBreadCrumb.Text = " :: Traffic Report (Users Logged In)";
            }

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
                if (Request.QueryString.ToString() == "not")//Users not logged in
                {
                    switch (Convert.ToInt32(ddlSitelet.SelectedItem.Value))
                    {
                        case 1:
                            dsReportTableAdapters.uspClubArtsNotLoginReportTableAdapter uspClubArtsNotTA = new dsReportTableAdapters.uspClubArtsNotLoginReportTableAdapter();
                            dsReport.uspClubArtsNotLoginReportDataTable uspClubArtsNotDT = uspClubArtsNotTA.GetUspClubArtsNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspClubArtsNotDT.Count;
                            gvUsers.DataSource = uspClubArtsNotDT;
                            gvUsers.Columns[8].Visible = true;
                            break;
                        case 2:
                            dsReportTableAdapters.uspSpringNotLoginReportTableAdapter uspSpringNotTA = new dsReportTableAdapters.uspSpringNotLoginReportTableAdapter();
                            dsReport.uspSpringNotLoginReportDataTable uspSpringNotDT = uspSpringNotTA.GetUspSpringNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspSpringNotDT.Count;
                            gvUsers.DataSource = uspSpringNotDT;
                            gvUsers.Columns[9].Visible = true;
                            break;
                        case 3:
                            dsReportTableAdapters.uspAllsNotLoginReportTableAdapter uspAllsNotTA = new dsReportTableAdapters.uspAllsNotLoginReportTableAdapter();
                            dsReport.uspAllsNotLoginReportDataTable uspAllsNotDT = uspAllsNotTA.GetUspAllsNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspAllsNotDT.Count;
                            gvUsers.DataSource = uspAllsNotDT;
                            gvUsers.Columns[10].Visible = true;
                            break;
                        case 4:
                            dsReportTableAdapters.uspWorldNotLoginReportTableAdapter uspWorldNotTA = new dsReportTableAdapters.uspWorldNotLoginReportTableAdapter();
                            dsReport.uspWorldNotLoginReportDataTable uspWorldNotDT = uspWorldNotTA.GetUspWorldNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspWorldNotDT.Count;
                            gvUsers.DataSource = uspWorldNotDT;
                            gvUsers.Columns[11].Visible = true;
                            break;
                        case 5:
                            dsReportTableAdapters.uspCoopNotLoginReportTableAdapter uspCoopNotTA = new dsReportTableAdapters.uspCoopNotLoginReportTableAdapter();
                            dsReport.uspCoopNotLoginReportDataTable uspCoopNotDT = uspCoopNotTA.GetUspCoopNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspCoopNotDT.Count;
                            gvUsers.DataSource = uspCoopNotDT;
                            gvUsers.Columns[12].Visible = true;
                            break;
                        case 6:
                            dsReportTableAdapters.uspMascotNotLoginReportTableAdapter uspMascotNotTA = new dsReportTableAdapters.uspMascotNotLoginReportTableAdapter();
                            dsReport.uspMascotNotLoginReportDataTable uspMascotNotDT = uspMascotNotTA.GetUspMascotNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspMascotNotDT.Count;
                            gvUsers.DataSource = uspMascotNotDT;
                            gvUsers.Columns[13].Visible = true;
                            break;
                        case 7:
                            dsReportTableAdapters.uspMinorNotLoginReportTableAdapter uspMinorNotTA = new dsReportTableAdapters.uspMinorNotLoginReportTableAdapter();
                            dsReport.uspMinorNotLoginReportDataTable uspMinorNotDT = uspMinorNotTA.GetUspMinorNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspMinorNotDT.Count;
                            gvUsers.DataSource = uspMinorNotDT;
                            gvUsers.Columns[14].Visible = true;
                            break;
                        case 8:
                            dsReportTableAdapters.uspThemeArtNotLoginReportTableAdapter uspThemeArtNotTA = new dsReportTableAdapters.uspThemeArtNotLoginReportTableAdapter();
                            dsReport.uspThemeArtNotLoginReportDataTable uspThemeArtNotDT = uspThemeArtNotTA.GetUspThemeArtNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspThemeArtNotDT.Count;
                            gvUsers.DataSource = uspThemeArtNotDT;
                            gvUsers.Columns[15].Visible = true;
                            break;
                        case 9:
                            dsReportTableAdapters.uspDesignNotLoginReportTableAdapter uspDesignNotTA = new dsReportTableAdapters.uspDesignNotLoginReportTableAdapter();
                            dsReport.uspDesignNotLoginReportDataTable uspDesignNotDT = uspDesignNotTA.GetUspDesignNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspDesignNotDT.Count;
                            gvUsers.DataSource = uspDesignNotDT;
                            gvUsers.Columns[16].Visible = true;
                            break;
                        case 10:
                            //dsReportTableAdapters.uspCMCNotLoginReportByDatesTableAdapter uspCMCNotLoginReportByDatesTA = new dsReportTableAdapters.uspCMCNotLoginReportByDatesTableAdapter();
                            //dsReport.uspCMCNotLoginReportByDatesDataTable uspCMCNotLoginReportByDatesDT = uspCMCNotLoginReportByDatesTA.GetUspCMCNotLoginReportByDates(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            //iCount = uspCMCNotLoginReportByDatesDT.Rows.Count;
                            //gvUsers.DataSource = uspCMCNotLoginReportByDatesDT;
                            //gvUsers.Columns[17].Visible = true;
                            //break;
                            dsReportTableAdapters.uspCMCPageNotLoginsTableAdapter uspCMCPageNotLoginsTA = new dsReportTableAdapters.uspCMCPageNotLoginsTableAdapter();
                            dsReport.uspCMCPageNotLoginsDataTable uspCMCPageNotLoginsDT = new dsReport.uspCMCPageNotLoginsDataTable();
                            //dsReport.uspCMCPageNotLoginsDataTable uspCMCPageNotLoginsDT = uspCMCPageNotLoginsTA.GetUspCMCPageNotLogins(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]), 6);
                            
                            
                            for (int i = 0; i < cblPages.Items.Count; i++)
                            {
                                if (cblPages.Items[i].Selected)
                                {
                                    dsReport.uspCMCPageNotLoginsDataTable thisDT = uspCMCPageNotLoginsTA.GetUspCMCPageNotLogins(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1), Convert.ToInt32(cblPages.Items[i].Value));

                                    foreach (DataRow dr in thisDT.Rows)
                                    {
                                        uspCMCPageNotLoginsDT.ImportRow(dr);
                                    }
                                }
                            }
                            

                            //dsReportTableAdapters.uspCMCPageNotLoginsTableAdapter uspCMCPageNotLoginsTA = new dsReportTableAdapters.uspCMCPageNotLoginsTableAdapter();
                            //dsReport.uspCMCPageNotLoginsDataTable uspCMCPageNotLoginsDT = uspCMCPageNotLoginsTA.GetUspCMCPageNotLogins(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]), 6);

                            iCount = uspCMCPageNotLoginsDT.Count;
                            Session["uspCMCPageNotLoginsDT"] = uspCMCPageNotLoginsDT;
                            gvUsers.DataSource = uspCMCPageNotLoginsDT;
                            gvUsers.Columns[17].Visible = true;
                            gvUsers.Columns[18].HeaderText = "Page (not logged into)";
                            gvUsers.Columns[18].Visible = true;
                            break;
                        case 11:
                            dsReportTableAdapters.uspRestrictedNotLoginReportTableAdapter uspRestrictedNotLoginReportTA = new dsReportTableAdapters.uspRestrictedNotLoginReportTableAdapter();
                            dsReport.uspRestrictedNotLoginReportDataTable uspRestrictedNotLoginReportDT = uspRestrictedNotLoginReportTA.GetUspRestrictedNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspRestrictedNotLoginReportDT.Count;
                            gvUsers.DataSource = uspRestrictedNotLoginReportDT;
                            gvUsers.Columns[19].Visible = true;
                            break;
                        case 12:
                            dsReportTableAdapters.uspOpeningNotLoginReportTableAdapter uspOpeningNotLoginReportTA = new dsReportTableAdapters.uspOpeningNotLoginReportTableAdapter();
                            dsReport.uspOpeningNotLoginReportDataTable uspOpeningNotLoginReportDT = uspOpeningNotLoginReportTA.GetUspOpeningNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspOpeningNotLoginReportDT.Count;
                            gvUsers.DataSource = uspOpeningNotLoginReportDT;
                            gvUsers.Columns[20].Visible = true;
                            break;
                        case 13:
                            dsReportTableAdapters.uspMascotBabiesNotLoginReportTableAdapter uspMascotBabiesNotLoginReportTA = new dsReportTableAdapters.uspMascotBabiesNotLoginReportTableAdapter();
                            dsReport.uspMascotBabiesNotLoginReportDataTable uspMascotBabiesNotLoginReportDT = uspMascotBabiesNotLoginReportTA.GetUspMascotBabiesNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspMascotBabiesNotLoginReportDT.Count;
                            gvUsers.DataSource = uspMascotBabiesNotLoginReportDT;
                            gvUsers.Columns[21].Visible = true;
                            break;
                        case 14:
                            dsReportTableAdapters.uspPressBoxNotLoginReportTableAdapter uspPressBoxNotLoginReportTA = new dsReportTableAdapters.uspPressBoxNotLoginReportTableAdapter();
                            dsReport.uspPressBoxNotLoginReportDataTable uspPressBoxNotLoginReportDT = uspPressBoxNotLoginReportTA.GetUspPressBoxNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspPressBoxNotLoginReportDT.Count;
                            gvUsers.DataSource = uspPressBoxNotLoginReportDT;
                            gvUsers.Columns[22].Visible = true;
                            break;
                        case 15:
                            dsReportTableAdapters.uspPlayballNotLoginReportTableAdapter uspPlayballNotLoginReportTA = new dsReportTableAdapters.uspPlayballNotLoginReportTableAdapter();
                            dsReport.uspPlayballNotLoginReportDataTable uspPlayballNotLoginReportDT = uspPlayballNotLoginReportTA.GetUspPlayballNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspPlayballNotLoginReportDT.Count;
                            gvUsers.DataSource = uspPlayballNotLoginReportDT;
                            gvUsers.Columns[23].Visible = true;
                            break;
                        case 16:
                            dsReportTableAdapters.uspSponsorsNotLoginReportTableAdapter uspSponsorsNotLoginReportTA = new dsReportTableAdapters.uspSponsorsNotLoginReportTableAdapter();
                            dsReport.uspSponsorsNotLoginReportDataTable uspSponsorsNotLoginReportDT = uspSponsorsNotLoginReportTA.GetUspSponsorsNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspSponsorsNotLoginReportDT.Count;
                            gvUsers.DataSource = uspSponsorsNotLoginReportDT;
                            gvUsers.Columns[24].Visible = true;
                            break;
                        case 17:
                            dsReportTableAdapters.uspLondonNotLoginReportTableAdapter uspLondonNotLoginReportTA = new dsReportTableAdapters.uspLondonNotLoginReportTableAdapter();
                            dsReport.uspLondonNotLoginReportDataTable uspLondonNotLoginReportDT = uspLondonNotLoginReportTA.GetUspLondonNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspLondonNotLoginReportDT.Count;
                            gvUsers.DataSource = uspLondonNotLoginReportDT;
                            gvUsers.Columns[25].Visible = true;
                            break;
                        case 18:
                            dsReportTableAdapters.uspRestricted2NotLoginReportTableAdapter uspRestricted2NotLoginReportTA = new dsReportTableAdapters.uspRestricted2NotLoginReportTableAdapter();
                            dsReport.uspRestricted2NotLoginReportDataTable uspRestricted2NotLoginReportDT = uspRestricted2NotLoginReportTA.GetUspRestricted2NotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspRestricted2NotLoginReportDT.Count;
                            gvUsers.DataSource = uspRestricted2NotLoginReportDT;
                            gvUsers.Columns[26].Visible = true;
                            break;
                        case 19:
                            dsReportTableAdapters.uspRestricted3NotLoginReportTableAdapter uspRestricted3NotLoginReportTA = new dsReportTableAdapters.uspRestricted3NotLoginReportTableAdapter();
                            dsReport.uspRestricted3NotLoginReportDataTable uspRestricted3NotLoginReportDT = uspRestricted3NotLoginReportTA.GetUspRestricted3NotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspRestricted3NotLoginReportDT.Count;
                            gvUsers.DataSource = uspRestricted3NotLoginReportDT;
                            gvUsers.Columns[27].Visible = true;
                            break;
                        case 20:
                            dsReportTableAdapters.uspMLBLogoVaultNotLoginReportTableAdapter uspMLBLogoVaultNotLoginReportTA = new dsReportTableAdapters.uspMLBLogoVaultNotLoginReportTableAdapter();
                            dsReport.uspMLBLogoVaultNotLoginReportDataTable uspMLBLogoVaultNotLoginReportDT = uspMLBLogoVaultNotLoginReportTA.GetUspMLBLogoVaultNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspMLBLogoVaultNotLoginReportDT.Count;
                            gvUsers.DataSource = uspMLBLogoVaultNotLoginReportDT;
                            gvUsers.Columns[28].Visible = true;
                            break;
                        case 21:
                            dsReportTableAdapters.uspAllsCPNotLoginReportTableAdapter uspAllsCPNotLoginReportTA = new dsReportTableAdapters.uspAllsCPNotLoginReportTableAdapter();
                            dsReport.uspAllsCPNotLoginReportDataTable uspAllsCPNotLoginReportDT = uspAllsCPNotLoginReportTA.GetUspAllsCPNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspAllsCPNotLoginReportDT.Count;
                            gvUsers.DataSource = uspAllsCPNotLoginReportDT;
                            gvUsers.Columns[29].Visible = true;
                            break;
                        case 22:
                            dsReportTableAdapters.uspOpeningCPNotLoginReportTableAdapter uspOpeningCPNotLoginReportTA = new dsReportTableAdapters.uspOpeningCPNotLoginReportTableAdapter();
                            dsReport.uspOpeningCPNotLoginReportDataTable uspOpeningCPNotLoginReportDT = uspOpeningCPNotLoginReportTA.GetUspOpeningCPNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspOpeningCPNotLoginReportDT.Count;
                            gvUsers.DataSource = uspOpeningCPNotLoginReportDT;
                            gvUsers.Columns[30].Visible = true;
                            break;
                        case 23:
                            dsReportTableAdapters.uspSpringCPNotLoginReportTableAdapter uspSpringCPNotLoginReportTA = new dsReportTableAdapters.uspSpringCPNotLoginReportTableAdapter();
                            dsReport.uspSpringCPNotLoginReportDataTable uspSpringCPNotLoginReportDT = uspSpringCPNotLoginReportTA.GetUspSpringCPNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspSpringCPNotLoginReportDT.Count;
                            gvUsers.DataSource = uspSpringCPNotLoginReportDT;
                            gvUsers.Columns[31].Visible = true;
                            break;
                    }
                    
                }
                else
                {
                    switch (Convert.ToInt32(ddlSitelet.SelectedItem.Value))
                    {
                        case 1:
                            dsReportTableAdapters.uspClubArtsLoginReportTableAdapter uspClubArtsLoginReportTA = new dsReportTableAdapters.uspClubArtsLoginReportTableAdapter();
                            dsReport.uspClubArtsLoginReportDataTable uspClubArtsLoginReportDT = uspClubArtsLoginReportTA.GetUspClubArtsLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspClubArtsLoginReportDT.Count;
                            gvUsers.DataSource = uspClubArtsLoginReportDT;
                            gvUsers.Columns[8].Visible = true;
                            break;
                        case 2:
                            dsReportTableAdapters.uspSpringLoginReportTableAdapter uspSpringLoginReportTA = new dsReportTableAdapters.uspSpringLoginReportTableAdapter();
                            dsReport.uspSpringLoginReportDataTable uspSpringLoginReportDT = uspSpringLoginReportTA.GetUspSpringLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspSpringLoginReportDT.Count;
                            gvUsers.DataSource = uspSpringLoginReportDT;
                            gvUsers.Columns[9].Visible = true;
                            break;
                        case 3:
                            dsReportTableAdapters.uspAllsLoginReportTableAdapter uspAllsLoginReportTA = new dsReportTableAdapters.uspAllsLoginReportTableAdapter();
                            dsReport.uspAllsLoginReportDataTable uspAllsLoginReportDT = uspAllsLoginReportTA.GetUspAllsLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspAllsLoginReportDT.Count;
                            gvUsers.DataSource = uspAllsLoginReportDT;
                            gvUsers.Columns[10].Visible = true;
                            break;
                        case 4:
                            dsReportTableAdapters.uspWorldLoginReportTableAdapter uspWorldLoginReportTA = new dsReportTableAdapters.uspWorldLoginReportTableAdapter();
                            dsReport.uspWorldLoginReportDataTable uspWorldLoginReportDT = uspWorldLoginReportTA.GetUspWorldLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspWorldLoginReportDT.Count;
                            gvUsers.DataSource = uspWorldLoginReportDT;
                            gvUsers.Columns[11].Visible = true;
                            break;
                        case 5:
                            dsReportTableAdapters.uspCoopLoginReportTableAdapter uspCoopLoginReportTA = new dsReportTableAdapters.uspCoopLoginReportTableAdapter();
                            dsReport.uspCoopLoginReportDataTable uspCoopLoginReportDT = uspCoopLoginReportTA.GetUspCoopLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspCoopLoginReportDT.Count;
                            gvUsers.DataSource = uspCoopLoginReportDT;
                            gvUsers.Columns[12].Visible = true;
                            break;
                        case 6:
                            dsReportTableAdapters.uspMascotLoginReportTableAdapter uspMascotLoginReportTA = new dsReportTableAdapters.uspMascotLoginReportTableAdapter();
                            dsReport.uspMascotLoginReportDataTable uspMascotLoginReportDT = uspMascotLoginReportTA.GetUspMascotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspMascotLoginReportDT.Count;
                            gvUsers.DataSource = uspMascotLoginReportDT;
                            gvUsers.Columns[13].Visible = true;
                            break;
                        case 7:
                            dsReportTableAdapters.uspMinorLoginReportTableAdapter uspMinorLoginReportTA = new dsReportTableAdapters.uspMinorLoginReportTableAdapter();
                            dsReport.uspMinorLoginReportDataTable uspMinorLoginReportDT = uspMinorLoginReportTA.GetMinorLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspMinorLoginReportDT.Count;
                            gvUsers.DataSource = uspMinorLoginReportDT;
                            gvUsers.Columns[14].Visible = true;
                            break;
                        case 8:
                            dsReportTableAdapters.uspThemeArtLoginReportTableAdapter uspThemeArtLoginReportTA = new dsReportTableAdapters.uspThemeArtLoginReportTableAdapter();
                            dsReport.uspThemeArtLoginReportDataTable uspThemeArtLoginReportDT = uspThemeArtLoginReportTA.GetUspThemeArtLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspThemeArtLoginReportDT.Count;
                            gvUsers.DataSource = uspThemeArtLoginReportDT;
                            gvUsers.Columns[15].Visible = true;
                            break;
                        case 9:
                            dsReportTableAdapters.uspDesignLoginReportTableAdapter uspDesignLoginReportTA = new dsReportTableAdapters.uspDesignLoginReportTableAdapter();
                            dsReport.uspDesignLoginReportDataTable uspDesignLoginReportDT = uspDesignLoginReportTA.GetUspDesignLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspDesignLoginReportDT.Count;
                            gvUsers.DataSource = uspDesignLoginReportDT;
                            gvUsers.Columns[16].Visible = true;
                            break;
                        case 10:
                            //dsReportTableAdapters.uspCMCLoginReportByDatesTableAdapter uspCMCLoginReportByDatesTA = new dsReportTableAdapters.uspCMCLoginReportByDatesTableAdapter();
                            //dsReport.uspCMCLoginReportByDatesDataTable uspCMCLoginReportByDatesDT = uspCMCLoginReportByDatesTA.GetUspCMCLoginReportByDates(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            //iCount = uspCMCLoginReportByDatesDT.Rows.Count;
                            //gvUsers.DataSource = uspCMCLoginReportByDatesDT;
                            dsReportTableAdapters.uspCMCPageLoginsTableAdapter uspCMCPageLoginsTA = new dsReportTableAdapters.uspCMCPageLoginsTableAdapter();
                            dsReport.uspCMCPageLoginsDataTable uspCMCPageLoginsDT = new dsReport.uspCMCPageLoginsDataTable();
                            string strPageIDs = string.Empty;
                            for (int i = 0; i < cblPages.Items.Count; i++)
                            {
                                if (cblPages.Items[i].Selected)
                                {
                                    dsReport.uspCMCPageLoginsDataTable thisDT = uspCMCPageLoginsTA.GetUspCMCPageLogins(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1), Convert.ToInt32(cblPages.Items[i].Value));
                                    foreach (DataRow dr in thisDT.Rows)
                                    {
                                        uspCMCPageLoginsDT.ImportRow(dr);
                                    }
                                }
                            }
                            iCount = uspCMCPageLoginsDT.Count;
                            Session["uspCMCPageLoginsDT"] = uspCMCPageLoginsDT;
                            gvUsers.DataSource = uspCMCPageLoginsDT;
                            gvUsers.Columns[17].Visible = true;
                            gvUsers.Columns[18].HeaderText = "Page (logged into)";
                            gvUsers.Columns[18].Visible = true;
                            break;
                        case 11:
                            dsReportTableAdapters.uspRestrictedLoginReportTableAdapter uspRestrictedLoginReportTA = new dsReportTableAdapters.uspRestrictedLoginReportTableAdapter();
                            dsReport.uspRestrictedLoginReportDataTable uspRestrictedLoginReportDT = uspRestrictedLoginReportTA.GetUspRestrictedLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspRestrictedLoginReportDT.Count;
                            gvUsers.DataSource = uspRestrictedLoginReportDT;
                            gvUsers.Columns[19].Visible = true;
                            break;
                        case 12:
                            dsReportTableAdapters.uspOpeningLoginReportTableAdapter uspOpeningLoginReportTA = new dsReportTableAdapters.uspOpeningLoginReportTableAdapter();
                            dsReport.uspOpeningLoginReportDataTable uspOpeningLoginReportDT = uspOpeningLoginReportTA.GetUspOpeningLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspOpeningLoginReportDT.Count;
                            gvUsers.DataSource = uspOpeningLoginReportDT;
                            gvUsers.Columns[20].Visible = true;
                            break;
                        case 13:
                            dsReportTableAdapters.uspMascotBabiesLoginReportTableAdapter uspMascotBabiesLoginReportTA = new dsReportTableAdapters.uspMascotBabiesLoginReportTableAdapter();
                            dsReport.uspMascotBabiesLoginReportDataTable uspMascotBabiesLoginReportDT = uspMascotBabiesLoginReportTA.GetUspMascotBabiesLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1)); ;
                            iCount = uspMascotBabiesLoginReportDT.Count;
                            gvUsers.DataSource = uspMascotBabiesLoginReportDT;
                            gvUsers.Columns[21].Visible = true;
                            break;
                        case 14:
                            dsReportTableAdapters.uspPressBoxLoginReportTableAdapter uspPressBoxLoginReportTA = new dsReportTableAdapters.uspPressBoxLoginReportTableAdapter();
                            dsReport.uspPressBoxLoginReportDataTable uspPressBoxLoginReportDT = uspPressBoxLoginReportTA.GetUspPressBoxLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspPressBoxLoginReportDT.Count;
                            gvUsers.DataSource = uspPressBoxLoginReportDT;
                            gvUsers.Columns[22].Visible = true;
                            break;
                        case 15:
                            dsReportTableAdapters.uspPlayballLoginReportTableAdapter uspPlayballLoginReportTA = new dsReportTableAdapters.uspPlayballLoginReportTableAdapter();
                            dsReport.uspPlayballLoginReportDataTable uspPlayballLoginReportDT = uspPlayballLoginReportTA.GetUspPlayballLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspPlayballLoginReportDT.Count;
                            gvUsers.DataSource = uspPlayballLoginReportDT;
                            gvUsers.Columns[23].Visible = true;
                            break;
                        case 16:
                            dsReportTableAdapters.uspSponsorsLoginReportTableAdapter uspSponsorsLoginReportTA = new dsReportTableAdapters.uspSponsorsLoginReportTableAdapter();
                            dsReport.uspSponsorsLoginReportDataTable uspSponsorsLoginReportDT = uspSponsorsLoginReportTA.GetUspSponsorsLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspSponsorsLoginReportDT.Count;
                            gvUsers.DataSource = uspSponsorsLoginReportDT;
                            gvUsers.Columns[24].Visible = true;
                            break;
                        case 17:
                            dsReportTableAdapters.uspLondonLoginReportTableAdapter uspLondonLoginReportTA = new dsReportTableAdapters.uspLondonLoginReportTableAdapter();
                            dsReport.uspLondonLoginReportDataTable uspLondonLoginReportDT = uspLondonLoginReportTA.GetUspLondonLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspLondonLoginReportDT.Count;
                            gvUsers.DataSource = uspLondonLoginReportDT;
                            gvUsers.Columns[25].Visible = true;
                            break;
                        case 18:
                            dsReportTableAdapters.uspRestricted2LoginReportTableAdapter uspRestricted2LoginReportTA = new dsReportTableAdapters.uspRestricted2LoginReportTableAdapter();
                            dsReport.uspRestricted2LoginReportDataTable uspRestricted2LoginReportDT = uspRestricted2LoginReportTA.GetUspRestricted2LoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspRestricted2LoginReportDT.Count;
                            gvUsers.DataSource = uspRestricted2LoginReportDT;
                            gvUsers.Columns[26].Visible = true;
                            break;
                        case 19:
                            dsReportTableAdapters.uspRestricted3LoginReportTableAdapter uspRestricted3LoginReportTA = new dsReportTableAdapters.uspRestricted3LoginReportTableAdapter();
                            dsReport.uspRestricted3LoginReportDataTable uspRestricted3LoginReportDT = uspRestricted3LoginReportTA.GetUspRestricted3LoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspRestricted3LoginReportDT.Count;
                            gvUsers.DataSource = uspRestricted3LoginReportDT;
                            gvUsers.Columns[27].Visible = true;
                            break;
                        case 20:
                            dsReportTableAdapters.uspMLBLogoVaultLoginReportTableAdapter uspMLBLogoVaultLoginReportTA = new dsReportTableAdapters.uspMLBLogoVaultLoginReportTableAdapter();
                            dsReport.uspMLBLogoVaultLoginReportDataTable uspMLBLogoVaultLoginReportDT = uspMLBLogoVaultLoginReportTA.GetUspMLBLogoVaultLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspMLBLogoVaultLoginReportDT.Count;
                            gvUsers.DataSource = uspMLBLogoVaultLoginReportDT;
                            gvUsers.Columns[28].Visible = true;
                            break;
                        case 21:
                            dsReportTableAdapters.uspAllsCPLoginReportTableAdapter uspAllsCPLoginReportTA = new dsReportTableAdapters.uspAllsCPLoginReportTableAdapter();
                            dsReport.uspAllsCPLoginReportDataTable uspAllsCPLoginReportDT = uspAllsCPLoginReportTA.GetUspAllsCPLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspAllsCPLoginReportDT.Count;
                            gvUsers.DataSource = uspAllsCPLoginReportDT;
                            gvUsers.Columns[29].Visible = true;
                            break;
                        case 22:
                            dsReportTableAdapters.uspOpeningCPLoginReportTableAdapter uspOpeningCPLoginReportTA = new dsReportTableAdapters.uspOpeningCPLoginReportTableAdapter();
                            dsReport.uspOpeningCPLoginReportDataTable uspOpeningCPLoginReportDT = uspOpeningCPLoginReportTA.GetUspOpeningCPLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspOpeningCPLoginReportDT.Count;
                            gvUsers.DataSource = uspOpeningCPLoginReportDT;
                            gvUsers.Columns[30].Visible = true;
                            break;
                        case 23:
                            dsReportTableAdapters.uspSpringCPLoginReportTableAdapter uspSpringCPLoginReportTA = new dsReportTableAdapters.uspSpringCPLoginReportTableAdapter();
                            dsReport.uspSpringCPLoginReportDataTable uspSpringCPLoginReportDT = uspSpringCPLoginReportTA.GetUspSpringCPLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                            iCount = uspSpringCPLoginReportDT.Count;
                            gvUsers.DataSource = uspSpringCPLoginReportDT;
                            gvUsers.Columns[31].Visible = true;
                            break;
                    }
                    
                }

                gvUsers.DataBind();


                lblResult.Text = "Number of users: <b>" + iCount + "</b>";
                ltrBreadCrumb2.Text = " :: " + Session["sitelet"] + " - From " + Session["from"] + " To " + Session["to"];
                siteletTable.Visible = false;
                resultDiv.Visible = true;
                
               
               
            }

            if (Request.QueryString.ToString() == "not")
            {
                ltrBreadCrumb.Text = " :: <a href=\"UsersLoggedIn.aspx?not\">Traffic Report (Users Not Logged In)</a>";
            }
            else
            {
                ltrBreadCrumb.Text = " :: <a href=\"UsersLoggedIn.aspx\">Traffic Report (Users Logged In)</a>";
            }
            iSiteletID = Convert.ToInt32(ddlSitelet.SelectedItem.Value);

        }
    }
    protected void ddlSitelet_DataBound(object sender, EventArgs e)
    {
        string listItemText = "Select One";
        string listItemValue = "0";
        ddlSitelet.Items.Insert(0,new ListItem(listItemText, listItemValue));

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
            Response.Redirect("xls_UsersLoggedIn.aspx?sitelet=" + Server.UrlEncode(Session["sitelet"].ToString()) + "&siteletID=" + iSiteletID + "&from=" + Session["from"] + "&to=" + Convert.ToDateTime(Session["to"]).AddDays(1).ToShortDateString() + "&not=yes");
        }
        else
        {
            Response.Redirect("xls_UsersLoggedIn.aspx?sitelet=" + Server.UrlEncode(Session["sitelet"].ToString()) + "&siteletID=" + iSiteletID + "&from=" + Session["from"] + "&to=" + Convert.ToDateTime(Session["to"]).AddDays(1).ToShortDateString());
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
