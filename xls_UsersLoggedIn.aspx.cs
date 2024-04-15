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

public partial class xls_UsersLoggedIn : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["not"] != null)
        {
            switch (Convert.ToInt32(Request.QueryString["siteletID"]))
            {
                case 1:
                    dsReportTableAdapters.uspClubArtsNotLoginReportTableAdapter uspClubArtsNotTA = new dsReportTableAdapters.uspClubArtsNotLoginReportTableAdapter();
                    dsReport.uspClubArtsNotLoginReportDataTable uspClubArtsNotDT = uspClubArtsNotTA.GetUspClubArtsNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspClubArtsNotDT;
                    gvUsers.Columns[8].Visible = true;
                    break;
                case 2:
                    dsReportTableAdapters.uspSpringNotLoginReportTableAdapter uspSpringNotTA = new dsReportTableAdapters.uspSpringNotLoginReportTableAdapter();
                    dsReport.uspSpringNotLoginReportDataTable uspSpringNotDT = uspSpringNotTA.GetUspSpringNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspSpringNotDT;
                    gvUsers.Columns[9].Visible = true;
                    break;
                case 3:
                    dsReportTableAdapters.uspAllsNotLoginReportTableAdapter uspAllsNotTA = new dsReportTableAdapters.uspAllsNotLoginReportTableAdapter();
                    dsReport.uspAllsNotLoginReportDataTable uspAllsNotDT = uspAllsNotTA.GetUspAllsNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspAllsNotDT;
                    gvUsers.Columns[10].Visible = true;
                    break;
                case 4:
                    dsReportTableAdapters.uspWorldNotLoginReportTableAdapter uspWorldNotTA = new dsReportTableAdapters.uspWorldNotLoginReportTableAdapter();
                    dsReport.uspWorldNotLoginReportDataTable uspWorldNotDT = uspWorldNotTA.GetUspWorldNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspWorldNotDT;
                    gvUsers.Columns[11].Visible = true;
                    break;
                case 5:
                    dsReportTableAdapters.uspCoopNotLoginReportTableAdapter uspCoopNotTA = new dsReportTableAdapters.uspCoopNotLoginReportTableAdapter();
                    dsReport.uspCoopNotLoginReportDataTable uspCoopNotDT = uspCoopNotTA.GetUspCoopNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspCoopNotDT;
                    gvUsers.Columns[12].Visible = true;
                    break;
                case 6:
                    dsReportTableAdapters.uspMascotNotLoginReportTableAdapter uspMascotNotTA = new dsReportTableAdapters.uspMascotNotLoginReportTableAdapter();
                    dsReport.uspMascotNotLoginReportDataTable uspMascotNotDT = uspMascotNotTA.GetUspMascotNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspMascotNotDT;
                    gvUsers.Columns[13].Visible = true;
                    break;
                case 7:
                    dsReportTableAdapters.uspMinorNotLoginReportTableAdapter uspMinorNotTA = new dsReportTableAdapters.uspMinorNotLoginReportTableAdapter();
                    dsReport.uspMinorNotLoginReportDataTable uspMinorNotDT = uspMinorNotTA.GetUspMinorNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspMinorNotDT;
                    gvUsers.Columns[14].Visible = true;
                    break;
                case 8:
                    dsReportTableAdapters.uspThemeArtNotLoginReportTableAdapter uspThemeArtNotTA = new dsReportTableAdapters.uspThemeArtNotLoginReportTableAdapter();
                    dsReport.uspThemeArtNotLoginReportDataTable uspThemeArtNotDT = uspThemeArtNotTA.GetUspThemeArtNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspThemeArtNotDT;
                    gvUsers.Columns[15].Visible = true;
                    break;
                case 9:
                    dsReportTableAdapters.uspDesignNotLoginReportTableAdapter uspDesignNotTA = new dsReportTableAdapters.uspDesignNotLoginReportTableAdapter();
                    dsReport.uspDesignNotLoginReportDataTable uspDesignNotDT = uspDesignNotTA.GetUspDesignNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspDesignNotDT;
                    gvUsers.Columns[16].Visible = true;
                    break;
                case 10:
                    //dsReportTableAdapters.uspCMCNotLoginReportByDatesTableAdapter uspCMCNotLoginReportByDatesTA = new dsReportTableAdapters.uspCMCNotLoginReportByDatesTableAdapter();
                    //dsReport.uspCMCNotLoginReportByDatesDataTable uspCMCNotLoginReportByDatesDT = uspCMCNotLoginReportByDatesTA.GetUspCMCNotLoginReportByDates(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    //gvUsers.DataSource = uspCMCNotLoginReportByDatesDT;
                    //gvUsers.Columns[17].Visible = false;
                    gvUsers.DataSource = Session["uspCMCPageNotLoginsDT"];
                    gvUsers.Columns[17].Visible = true;
                    gvUsers.Columns[18].HeaderText = "Page (not logged into)";
                    gvUsers.Columns[18].Visible = true;
                    break;
                case 11:
                    dsReportTableAdapters.uspRestrictedNotLoginReportTableAdapter uspRestrictedNotTA = new dsReportTableAdapters.uspRestrictedNotLoginReportTableAdapter();
                    dsReport.uspRestrictedNotLoginReportDataTable uspRestrictedNotDT = uspRestrictedNotTA.GetUspRestrictedNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspRestrictedNotDT;
                    gvUsers.Columns[19].Visible = true;
                    break;
                case 12:
                    dsReportTableAdapters.uspOpeningNotLoginReportTableAdapter uspOpeningNotTA = new dsReportTableAdapters.uspOpeningNotLoginReportTableAdapter();
                    dsReport.uspOpeningNotLoginReportDataTable uspOpeningNotDT = uspOpeningNotTA.GetUspOpeningNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspOpeningNotDT;
                    gvUsers.Columns[20].Visible = true;
                    break;
                case 13:
                    dsReportTableAdapters.uspMascotBabiesNotLoginReportTableAdapter uspMascotBabiesNotTA = new dsReportTableAdapters.uspMascotBabiesNotLoginReportTableAdapter();
                    dsReport.uspMascotBabiesNotLoginReportDataTable uspMascotBabiesNotDT = uspMascotBabiesNotTA.GetUspMascotBabiesNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspMascotBabiesNotDT;
                    gvUsers.Columns[21].Visible = true;
                    break;
                case 14:
                    dsReportTableAdapters.uspPressBoxNotLoginReportTableAdapter uspPressBoxNotLoginReportTA = new dsReportTableAdapters.uspPressBoxNotLoginReportTableAdapter();
                    dsReport.uspPressBoxNotLoginReportDataTable uspPressBoxNotLoginReportDT = uspPressBoxNotLoginReportTA.GetUspPressBoxNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspPressBoxNotLoginReportDT;
                    gvUsers.Columns[22].Visible = true;
                    break;
                case 15:
                    dsReportTableAdapters.uspPlayballNotLoginReportTableAdapter uspPlayballNotLoginReportTA = new dsReportTableAdapters.uspPlayballNotLoginReportTableAdapter();
                    dsReport.uspPlayballNotLoginReportDataTable uspPlayballNotLoginReportDT = uspPlayballNotLoginReportTA.GetUspPlayballNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspPlayballNotLoginReportDT;
                    gvUsers.Columns[23].Visible = true;
                    break;
                case 16:
                    dsReportTableAdapters.uspSponsorsNotLoginReportTableAdapter uspSponsorsNotLoginReportTA = new dsReportTableAdapters.uspSponsorsNotLoginReportTableAdapter();
                    dsReport.uspSponsorsNotLoginReportDataTable uspSponsorsNotLoginReportDT = uspSponsorsNotLoginReportTA.GetUspSponsorsNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspSponsorsNotLoginReportDT;
                    gvUsers.Columns[24].Visible = true;
                    break;
                case 17:
                    dsReportTableAdapters.uspLondonNotLoginReportTableAdapter uspLondonNotLoginReportTA = new dsReportTableAdapters.uspLondonNotLoginReportTableAdapter();
                    dsReport.uspLondonNotLoginReportDataTable uspLondonNotLoginReportDT = uspLondonNotLoginReportTA.GetUspLondonNotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspLondonNotLoginReportDT;
                    gvUsers.Columns[25].Visible = true;
                    break;
                case 18:
                    dsReportTableAdapters.uspRestricted2NotLoginReportTableAdapter uspRestricted2NotLoginReportTA = new dsReportTableAdapters.uspRestricted2NotLoginReportTableAdapter();
                    dsReport.uspRestricted2NotLoginReportDataTable uspRestricted2NotLoginReportDT = uspRestricted2NotLoginReportTA.GetUspRestricted2NotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted2NotLoginReportDT;
                    gvUsers.Columns[26].Visible = true;
                    break;
                case 19:
                    dsReportTableAdapters.uspRestricted3NotLoginReportTableAdapter uspRestricted3NotLoginReportTA = new dsReportTableAdapters.uspRestricted3NotLoginReportTableAdapter();
                    dsReport.uspRestricted3NotLoginReportDataTable uspRestricted3NotLoginReportDT = uspRestricted3NotLoginReportTA.GetUspRestricted3NotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted3NotLoginReportDT;
                    gvUsers.Columns[27].Visible = true;
                    break;
                case 20:
                    dsReportTableAdapters.uspMLBLogoVaultNotLoginReportTableAdapter uspMLBLogoVaultNotLoginReportTA = new dsReportTableAdapters.uspMLBLogoVaultNotLoginReportTableAdapter();
                    dsReport.uspMLBLogoVaultNotLoginReportDataTable uspMLBLogoVaultNotLoginReportDT = uspMLBLogoVaultNotLoginReportTA.GetUspMLBLogoVaultNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspMLBLogoVaultNotLoginReportDT;
                    gvUsers.Columns[28].Visible = true;
                    break;
                case 21:
                    dsReportTableAdapters.uspRestricted4NotLoginReportTableAdapter uspRestricted4NotLoginReportTA = new dsReportTableAdapters.uspRestricted4NotLoginReportTableAdapter();
                    dsReport.uspRestricted4NotLoginReportDataTable uspRestricted4NotLoginReportDT = uspRestricted4NotLoginReportTA.GetUspRestricted4NotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted4NotLoginReportDT;
                    gvUsers.Columns[29].Visible = true;
                    break;
                case 22:
                    dsReportTableAdapters.uspAllsCPNotLoginReportTableAdapter uspAllsCPNotLoginReportTA = new dsReportTableAdapters.uspAllsCPNotLoginReportTableAdapter();
                    dsReport.uspAllsCPNotLoginReportDataTable uspAllsCPNotLoginReportDT = uspAllsCPNotLoginReportTA.GetUspAllsCPNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspAllsCPNotLoginReportDT;
                    gvUsers.Columns[30].Visible = true;
                    break;
                case 23:
                    dsReportTableAdapters.uspOpeningCPNotLoginReportTableAdapter uspOpeningCPNotLoginReportTA = new dsReportTableAdapters.uspOpeningCPNotLoginReportTableAdapter();
                    dsReport.uspOpeningCPNotLoginReportDataTable uspOpeningCPNotLoginReportDT = uspOpeningCPNotLoginReportTA.GetUspOpeningCPNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspOpeningCPNotLoginReportDT;
                    gvUsers.Columns[31].Visible = true;
                    break;
                case 24:
                    dsReportTableAdapters.uspSpringCPNotLoginReportTableAdapter uspSpringCPNotLoginReportTA = new dsReportTableAdapters.uspSpringCPNotLoginReportTableAdapter();
                    dsReport.uspSpringCPNotLoginReportDataTable uspSpringCPNotLoginReportDT = uspSpringCPNotLoginReportTA.GetUspSpringCPNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspSpringCPNotLoginReportDT;
                    gvUsers.Columns[32].Visible = true;
                    break;
                case 25:
                    dsReportTableAdapters.uspWorldCPNotLoginReportTableAdapter uspWorldCPNotLoginReportTA = new dsReportTableAdapters.uspWorldCPNotLoginReportTableAdapter();
                    dsReport.uspWorldCPNotLoginReportDataTable uspWorldCPNotLoginReportDT = uspWorldCPNotLoginReportTA.GetUspWorldCPNotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspWorldCPNotLoginReportDT;
                    gvUsers.Columns[33].Visible = true;
                    break;
                case 26:
                    dsReportTableAdapters.uspRestricted5NotLoginReportTableAdapter uspRestricted5NotLoginReportTA = new dsReportTableAdapters.uspRestricted5NotLoginReportTableAdapter();
                    dsReport.uspRestricted5NotLoginReportDataTable uspRestricted5NotLoginReportDT = uspRestricted5NotLoginReportTA.GetUspRestricted5NotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted5NotLoginReportDT;
                    gvUsers.Columns[34].Visible = true;
                    break;
                case 27:
                    dsReportTableAdapters.uspRestricted6NotLoginReportTableAdapter uspRestricted6NotLoginReportTA = new dsReportTableAdapters.uspRestricted6NotLoginReportTableAdapter();
                    dsReport.uspRestricted6NotLoginReportDataTable uspRestricted6NotLoginReportDT = uspRestricted6NotLoginReportTA.GetUspRestricted6NotLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted6NotLoginReportDT;
                    gvUsers.Columns[35].Visible = true;
                    break;
            }
            //dsReportTableAdapters.uspCMCNotLoginReportByDatesTableAdapter uspCMCNotLoginReportByDatesTA = new dsReportTableAdapters.uspCMCNotLoginReportByDatesTableAdapter();
            //dsReport.uspCMCNotLoginReportByDatesDataTable uspCMCNotLoginReportByDatesDT = uspCMCNotLoginReportByDatesTA.GetUspCMCNotLoginReportByDates(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
            //gvUsers.DataSource = uspCMCNotLoginReportByDatesDT;
            gvUsers.Caption = "Traffic Report (Users Not Logged In) :: " + Request.QueryString["sitelet"] + " :: From " + Request.QueryString["from"].ToString() + " To " + Request.QueryString["to"].ToString();

        }
        else
        {

            switch (Convert.ToInt32(Request.QueryString["siteletID"]))
            {
                case 1:
                    dsReportTableAdapters.uspClubArtsLoginReportTableAdapter uspClubArtsLoginReportTA = new dsReportTableAdapters.uspClubArtsLoginReportTableAdapter();
                    dsReport.uspClubArtsLoginReportDataTable uspClubArtsLoginReportDT = uspClubArtsLoginReportTA.GetUspClubArtsLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspClubArtsLoginReportDT;
                    gvUsers.Columns[8].Visible = true;
                    break;
                case 2:
                    dsReportTableAdapters.uspSpringLoginReportTableAdapter uspSpringLoginReportTA = new dsReportTableAdapters.uspSpringLoginReportTableAdapter();
                    dsReport.uspSpringLoginReportDataTable uspSpringLoginReportDT = uspSpringLoginReportTA.GetUspSpringLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspSpringLoginReportDT;
                    gvUsers.Columns[9].Visible = true;
                    break;
                case 3:
                    dsReportTableAdapters.uspAllsLoginReportTableAdapter uspAllsLoginReportTA = new dsReportTableAdapters.uspAllsLoginReportTableAdapter();
                    dsReport.uspAllsLoginReportDataTable uspAllsLoginReportDT = uspAllsLoginReportTA.GetUspAllsLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspAllsLoginReportDT;
                    gvUsers.Columns[10].Visible = true;
                    break;
                case 4:
                    dsReportTableAdapters.uspWorldLoginReportTableAdapter uspWorldLoginReportTA = new dsReportTableAdapters.uspWorldLoginReportTableAdapter();
                    dsReport.uspWorldLoginReportDataTable uspWorldLoginReportDT = uspWorldLoginReportTA.GetUspWorldLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspWorldLoginReportDT;
                    gvUsers.Columns[11].Visible = true;
                    break;
                case 5:
                    dsReportTableAdapters.uspCoopLoginReportTableAdapter uspCoopLoginReportTA = new dsReportTableAdapters.uspCoopLoginReportTableAdapter();
                    dsReport.uspCoopLoginReportDataTable uspCoopLoginReportDT = uspCoopLoginReportTA.GetUspCoopLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspCoopLoginReportDT;
                    gvUsers.Columns[12].Visible = true;
                    break;
                case 6:
                    dsReportTableAdapters.uspMascotLoginReportTableAdapter uspMascotLoginReportTA = new dsReportTableAdapters.uspMascotLoginReportTableAdapter();
                    dsReport.uspMascotLoginReportDataTable uspMascotLoginReportDT = uspMascotLoginReportTA.GetUspMascotLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspMascotLoginReportDT;
                    gvUsers.Columns[13].Visible = true;
                    break;
                case 7:
                    dsReportTableAdapters.uspMinorLoginReportTableAdapter uspMinorLoginReportTA = new dsReportTableAdapters.uspMinorLoginReportTableAdapter();
                    dsReport.uspMinorLoginReportDataTable uspMinorLoginReportDT = uspMinorLoginReportTA.GetMinorLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspMinorLoginReportDT;
                    gvUsers.Columns[14].Visible = true;
                    break;
                case 8:
                    dsReportTableAdapters.uspThemeArtLoginReportTableAdapter uspThemeArtLoginReportTA = new dsReportTableAdapters.uspThemeArtLoginReportTableAdapter();
                    dsReport.uspThemeArtLoginReportDataTable uspThemeArtLoginReportDT = uspThemeArtLoginReportTA.GetUspThemeArtLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspThemeArtLoginReportDT;
                    gvUsers.Columns[15].Visible = true;
                    break;
                case 9:
                    dsReportTableAdapters.uspDesignLoginReportTableAdapter uspDesignLoginReportTA = new dsReportTableAdapters.uspDesignLoginReportTableAdapter();
                    dsReport.uspDesignLoginReportDataTable uspDesignLoginReportDT = uspDesignLoginReportTA.GetUspDesignLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString())); ;
                    gvUsers.DataSource = uspDesignLoginReportDT;
                    gvUsers.Columns[16].Visible = true;
                    break;
                case 10:
                    //dsReportTableAdapters.uspCMCLoginReportByDatesTableAdapter uspCMCLoginReportByDatesTA = new dsReportTableAdapters.uspCMCLoginReportByDatesTableAdapter();
                    //dsReport.uspCMCLoginReportByDatesDataTable uspCMCLoginReportByDatesDT = uspCMCLoginReportByDatesTA.GetUspCMCLoginReportByDates(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    //gvUsers.DataSource = uspCMCLoginReportByDatesDT;
                    //gvUsers.Columns[17].Visible = true;

                    gvUsers.DataSource = Session["uspCMCPageLoginsDT"];
                    gvUsers.Columns[17].Visible = true;
                    gvUsers.Columns[18].HeaderText = "Page (logged into)";
                    gvUsers.Columns[18].Visible = true;
                    break;
                case 11:
                    dsReportTableAdapters.uspRestrictedLoginReportTableAdapter uspRestrictedLoginReportTA = new dsReportTableAdapters.uspRestrictedLoginReportTableAdapter();
                    dsReport.uspRestrictedLoginReportDataTable uspRestriectedLoginReportDT = uspRestrictedLoginReportTA.GetUspRestrictedLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspRestriectedLoginReportDT;
                    gvUsers.Columns[19].Visible = true;
                    break;
                case 12:
                    dsReportTableAdapters.uspOpeningLoginReportTableAdapter uspOpeningLoginReportTA = new dsReportTableAdapters.uspOpeningLoginReportTableAdapter();
                    dsReport.uspOpeningLoginReportDataTable uspOpeningLoginReportDT = uspOpeningLoginReportTA.GetUspOpeningLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspOpeningLoginReportDT;
                    gvUsers.Columns[20].Visible = true;
                    break;
                case 13:
                    dsReportTableAdapters.uspMascotBabiesLoginReportTableAdapter uspMascotBabiesLoginReportTA = new dsReportTableAdapters.uspMascotBabiesLoginReportTableAdapter();
                    dsReport.uspMascotBabiesLoginReportDataTable uspMascotBabiesLoginReportDT = uspMascotBabiesLoginReportTA.GetUspMascotBabiesLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspMascotBabiesLoginReportDT;
                    gvUsers.Columns[21].Visible = true;
                    break;
                case 14:
                    dsReportTableAdapters.uspPressBoxLoginReportTableAdapter uspPressBoxLoginReportTA = new dsReportTableAdapters.uspPressBoxLoginReportTableAdapter();
                    dsReport.uspPressBoxLoginReportDataTable uspPressBoxLoginReportDT = uspPressBoxLoginReportTA.GetUspPressBoxLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspPressBoxLoginReportDT;
                    gvUsers.Columns[22].Visible = true;
                    break;
                case 15:
                    dsReportTableAdapters.uspPlayballLoginReportTableAdapter uspPlayballLoginReportTA = new dsReportTableAdapters.uspPlayballLoginReportTableAdapter();
                    dsReport.uspPlayballLoginReportDataTable uspPlayballLoginReportDT = uspPlayballLoginReportTA.GetUspPlayballLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspPlayballLoginReportDT;
                    gvUsers.Columns[23].Visible = true;
                    break;
                case 16:
                    dsReportTableAdapters.uspSponsorsLoginReportTableAdapter uspSponsorsLoginReportTA = new dsReportTableAdapters.uspSponsorsLoginReportTableAdapter();
                    dsReport.uspSponsorsLoginReportDataTable uspSponsorsLoginReportDT = uspSponsorsLoginReportTA.GetUspSponsorsLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspSponsorsLoginReportDT;
                    gvUsers.Columns[24].Visible = true;
                    break;
                case 17:
                    dsReportTableAdapters.uspLondonLoginReportTableAdapter uspLondonLoginReportTA = new dsReportTableAdapters.uspLondonLoginReportTableAdapter();
                    dsReport.uspLondonLoginReportDataTable uspLondonLoginReportDT = uspLondonLoginReportTA.GetUspLondonLoginReport(Convert.ToDateTime(Request.QueryString["from"].ToString()), Convert.ToDateTime(Request.QueryString["to"].ToString()));
                    gvUsers.DataSource = uspLondonLoginReportDT;
                    gvUsers.Columns[25].Visible = true;
                    break;
                case 18:
                    dsReportTableAdapters.uspRestricted2LoginReportTableAdapter uspRestricted2LoginReportTA = new dsReportTableAdapters.uspRestricted2LoginReportTableAdapter();
                    dsReport.uspRestricted2LoginReportDataTable uspRestricted2LoginReportDT = uspRestricted2LoginReportTA.GetUspRestricted2LoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted2LoginReportDT;
                    gvUsers.Columns[26].Visible = true;
                    break;
                case 19:
                    dsReportTableAdapters.uspRestricted3LoginReportTableAdapter uspRestricted3LoginReportTA = new dsReportTableAdapters.uspRestricted3LoginReportTableAdapter();
                    dsReport.uspRestricted3LoginReportDataTable uspRestricted3LoginReportDT = uspRestricted3LoginReportTA.GetUspRestricted3LoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted3LoginReportDT;
                    gvUsers.Columns[27].Visible = true;
                    break;
                case 20:
                    dsReportTableAdapters.uspMLBLogoVaultLoginReportTableAdapter uspMLBLogoVaultLoginReportTA = new dsReportTableAdapters.uspMLBLogoVaultLoginReportTableAdapter();
                    dsReport.uspMLBLogoVaultLoginReportDataTable uspMLBLogoVaultLoginReportDT = uspMLBLogoVaultLoginReportTA.GetUspMLBLogoVaultLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspMLBLogoVaultLoginReportDT;
                    gvUsers.Columns[28].Visible = true;
                    break;
                case 21:
                    dsReportTableAdapters.uspRestricted4LoginReportTableAdapter uspRestricted4LoginReportTA = new dsReportTableAdapters.uspRestricted4LoginReportTableAdapter();
                    dsReport.uspRestricted4LoginReportDataTable uspRestricted4LoginReportDT = uspRestricted4LoginReportTA.GetUspRestricted4LoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted4LoginReportDT;
                    gvUsers.Columns[29].Visible = true;
                    break;
                case 22:
                    dsReportTableAdapters.uspAllsCPLoginReportTableAdapter uspAllsCPLoginReportTA = new dsReportTableAdapters.uspAllsCPLoginReportTableAdapter();
                    dsReport.uspAllsCPLoginReportDataTable uspAllsCPLoginReportDT = uspAllsCPLoginReportTA.GetUspAllsCPLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspAllsCPLoginReportDT;
                    gvUsers.Columns[30].Visible = true;
                    break;
                case 23:
                    dsReportTableAdapters.uspOpeningCPLoginReportTableAdapter uspOpeningCPLoginReportTA = new dsReportTableAdapters.uspOpeningCPLoginReportTableAdapter();
                    dsReport.uspOpeningCPLoginReportDataTable uspOpeningCPLoginReportDT = uspOpeningCPLoginReportTA.GetUspOpeningCPLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspOpeningCPLoginReportDT;
                    gvUsers.Columns[31].Visible = true;
                    break;
                case 24:
                    dsReportTableAdapters.uspSpringCPLoginReportTableAdapter uspSpringCPLoginReportTA = new dsReportTableAdapters.uspSpringCPLoginReportTableAdapter();
                    dsReport.uspSpringCPLoginReportDataTable uspSpringCPLoginReportDT = uspSpringCPLoginReportTA.GetUspSpringCPLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspSpringCPLoginReportDT;
                    gvUsers.Columns[32].Visible = true;
                    break;
                case 25:
                    dsReportTableAdapters.uspWorldCPLoginReportTableAdapter uspWorldCPLoginReportTA = new dsReportTableAdapters.uspWorldCPLoginReportTableAdapter();
                    dsReport.uspWorldCPLoginReportDataTable uspWorldCPLoginReportDT = uspWorldCPLoginReportTA.GetUspWorldCPLoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspWorldCPLoginReportDT;
                    gvUsers.Columns[33].Visible = true;
                    break;
                case 26:
                    dsReportTableAdapters.uspRestricted5LoginReportTableAdapter uspRestricted5LoginReportTA = new dsReportTableAdapters.uspRestricted5LoginReportTableAdapter();
                    dsReport.uspRestricted5LoginReportDataTable uspRestricted5LoginReportDT = uspRestricted5LoginReportTA.GetUspRestricted5LoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted5LoginReportDT;
                    gvUsers.Columns[34].Visible = true;
                    break;
                case 27:
                    dsReportTableAdapters.uspRestricted6LoginReportTableAdapter uspRestricted6LoginReportTA = new dsReportTableAdapters.uspRestricted6LoginReportTableAdapter();
                    dsReport.uspRestricted6LoginReportDataTable uspRestricted6LoginReportDT = uspRestricted6LoginReportTA.GetUspRestricted6LoginReport(Convert.ToDateTime(Session["from"]), Convert.ToDateTime(Session["to"]).AddDays(1));
                    gvUsers.DataSource = uspRestricted6LoginReportDT;
                    gvUsers.Columns[35].Visible = true;
                    break;
            }

               gvUsers.Caption = "Traffic Report (Users Logged In) :: " + Request.QueryString["sitelet"] + " :: From " + Request.QueryString["from"].ToString() + " To " + Request.QueryString["to"].ToString();       
        
        }

        
        gvUsers.DataBind();
        
      Response.Clear();
      Response.ClearHeaders();//For HTTPS
      Response.Cache.SetCacheability(HttpCacheability.Private);//For HTTPS

      //Response.AddHeader("content-disposition", "attachment; filename=SpifeAssociates"+Convert.ToDateTime(AssociatesDT.Rows[0]["downloaddate"].ToString()).ToShortDateString()+".xls");
      if (Request.QueryString["not"] != null)
      {
          Response.AddHeader("content-disposition", "attachment; filename=UsersNotLoggedIn_"+Request.QueryString["sitelet"]+".xls");
      }
      else
      {
          Response.AddHeader("content-disposition", "attachment; filename=UsersLoggedIn_" + Request.QueryString["sitelet"] + ".xls");
      }
        
      
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
