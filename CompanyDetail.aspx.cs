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

public partial class CompanyDetail : System.Web.UI.Page
{
    dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA;
    dsCompany.legacyusersDataTable legacyusersDT;
    dsCompany.legacyusersRow legacyusersR;
    int iPkey = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)//Protection required ALL edits!
        {

            if (!Page.IsPostBack)
            {
                try{
                legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
                legacyusersDT = new dsCompany.legacyusersDataTable();
                legacyusersDT = legacyusersTA.GetCompanyByID(Convert.ToInt32(Request.QueryString["id"].ToString()));
                Session["legacyusersDT"] = legacyusersDT;


                //Populate the existing data
                if (!(legacyusersDT.Rows[0]["Company"] is DBNull))
                {
                    lblCompany.Text = legacyusersDT[0].Company;

                }
                if (!(legacyusersDT.Rows[0]["Address1"] is DBNull))
                {
                    lblAddress1.Text = legacyusersDT[0].Address1;
                }
                if (!(legacyusersDT.Rows[0]["Address2"] is DBNull))
                {
                    lblAddress2.Text = legacyusersDT[0].Address2;
                }
                if (!(legacyusersDT.Rows[0]["City"] is DBNull))
                {
                    lblCity.Text = legacyusersDT[0].City;
                }
                if (!(legacyusersDT.Rows[0]["State"] is DBNull))
                {
                    lblState.Text = legacyusersDT[0].State;
                }
                if (!(legacyusersDT.Rows[0]["Zip"] is DBNull))
                {
                    lblZip.Text = legacyusersDT[0].Zip;
                }
                if (!(legacyusersDT.Rows[0]["Country"] is DBNull))
                {
                    lblCountry.Text = legacyusersDT[0].Country;
                }
                if (!(legacyusersDT.Rows[0]["Phone"] is DBNull))
                {
                    lblPhone.Text = legacyusersDT[0].Phone;
                }
                if (!(legacyusersDT.Rows[0]["Email"] is DBNull))
                {
                    lblEmail.Text = legacyusersDT[0].Email;
                }
                if (!(legacyusersDT.Rows[0]["Contract"] is DBNull))
                {
                    lblContract.Text = legacyusersDT[0].Contract;
                }
                if (!(legacyusersDT.Rows[0]["UserName"] is DBNull))
                {
                    lblUserName.Text = legacyusersDT[0].UserName;
                }
                if (!(legacyusersDT.Rows[0]["Password"] is DBNull))
                {
                    lblPassword.Text = legacyusersDT[0].Password;
                }
                if (!(legacyusersDT.Rows[0]["UserLevel"] is DBNull))
                {
                    lblUserLevel.Text = legacyusersDT[0].UserLevel;
                    if (legacyusersDT[0].UserLevel == "D" && (!(legacyusersDT.Rows[0]["FromDate"] is DBNull)) && (!(legacyusersDT.Rows[0]["ToDate"] is DBNull)))//When Level D enforce the required field validator to the date range
                    {
                        lblDateRange.Text = "(" + legacyusersDT[0].FromDate.ToShortDateString() + " ~ " + legacyusersDT[0].ToDate.ToShortDateString() + ")";
                    }
                }
                if (!(legacyusersDT.Rows[0]["UserCategory"] is DBNull))
                {
                    lblUserCategory.Text = legacyusersDT[0].UserCategory;
                }
                if (!(legacyusersDT.Rows[0]["RequestorID"] is DBNull))
                {
                    dsCompanyTableAdapters.requestorsTableAdapter requestorsTA = new dsCompanyTableAdapters.requestorsTableAdapter();
                    dsCompany.requestorsDataTable requestorsDT = new dsCompany.requestorsDataTable();
                    requestorsDT = requestorsTA.GetRequestorByID(legacyusersDT[0].RequestorID);
                    if (requestorsDT.Rows.Count > 0)
                        lblRequestor.Text = requestorsDT[0].name;
                }

                dsCompanyTableAdapters.legacyusers2siteletsTableAdapter legacyusers2siteletsTA = new dsCompanyTableAdapters.legacyusers2siteletsTableAdapter();
                dsCompany.legacyusers2siteletsDataTable legacyusers2siteletsDT = new dsCompany.legacyusers2siteletsDataTable();
                legacyusers2siteletsDT = legacyusers2siteletsTA.Getc2sByCID(legacyusersDT[0].ID);

                dsCompanyTableAdapters.siteletsTableAdapter siteletsTA = new dsCompanyTableAdapters.siteletsTableAdapter();
                dsCompany.siteletsDataTable siteletsDT = new dsCompany.siteletsDataTable();
                siteletsDT = siteletsTA.GetAllSitelets();

                string strSitelets = string.Empty;
                for (int i = 0; i < legacyusers2siteletsDT.Rows.Count; i++)
                {
                    for (int j = 0; j < siteletsDT.Rows.Count; j++ )
                    {
                        if (siteletsDT[j].id == legacyusers2siteletsDT[i].sid)
                        {
                            strSitelets += siteletsDT[j].description + "<br>";
                        }
                    }
                }

                lblSitelets.Text = strSitelets;
                }
                catch (Exception ex)
                {
                    HttpBrowserCapabilities br = Request.Browser;

                    string strHandledMessage = "ex.StackTrace: " + ex.StackTrace.ToString() +
                        Environment.NewLine + Environment.NewLine +
                        "The client ip: " + Request.ServerVariables["REMOTE_ADDR"] +
                        Environment.NewLine + Environment.NewLine +
                        "GetLastError.Message: " + ex.Message.ToString() +
                        Environment.NewLine + Environment.NewLine +
                        "Page: " + Request.ServerVariables["SCRIPT_NAME"] +
                        Environment.NewLine + Environment.NewLine +
                        "Server: " + Request.ServerVariables["SERVER_NAME"] +
                        Environment.NewLine + Environment.NewLine +
                        "Local Address: " + Request.ServerVariables["LOCAL_ADDR"] +
                         Environment.NewLine + Environment.NewLine +
                        "Browser: " + br.Browser.ToString() + " : " + br.Version.ToString();

                    if (Request.UrlReferrer != null)
                    {
                        strHandledMessage += Environment.NewLine + Environment.NewLine +
                       "Referrer: " + Request.UrlReferrer.ToString();
                    }

                    if (Request.QueryString != null)
                    {
                        strHandledMessage += Environment.NewLine + Environment.NewLine +
                       "Query String: " + Request.QueryString.ToString();
                    }


                    strHandledMessage += Environment.NewLine + Environment.NewLine;
                    System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient();
                    System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                    try
                    {
                        System.Net.Mail.MailAddress fromAddress = new System.Net.Mail.MailAddress("info@axis360.com", "Debugger");
                        smtpClient.Host = System.Configuration.ConfigurationManager.AppSettings["SMTPServer"].ToString();
                        smtpClient.Port = 25;
                        message.From = fromAddress;
                        message.To.Add("hudsonchoi@gmail.com");
                        message.Subject = "MLBStyleGuide : Error on " + Request.ServerVariables["SCRIPT_NAME"] + ".. but handled";
                        //message.Body = Server.GetLastError().InnerException.Message.ToString();
                        message.Body = strHandledMessage;
                        smtpClient.Send(message);
                    }
                    catch (Exception e2)
                    {
                        //lblStatus.Text = "Send Email Failed." + ex.Message;
                    }
                }



            }
        }
        else//Take care of the deviants
        {
            Response.Redirect("./");
        }

    }


}
