using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Sql;
using System.Net.Mail;
using System.Net.Mime;
using System.Configuration;
using System.Text;
/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class UserService : System.Web.Services.WebService {


    public class user
    {
        public string uid { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string email { get; set; }
        public string userCategory { get; set; }
        public string requestorName { get; set; }
        public string status { get; set; }
        public string cid { get; set; }
        public string pid { get; set; }
        public string pFirstName { get; set; }
        public string pLastName { get; set; }
        public bool primaryContact { get; set; }
        public string mlbName { get; set; }
        public string mlbEmail { get; set; }
    }
    public UserService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World!!! I told you!!!";
    }
    [WebMethod] 
    public List<user> GetUsersByCID(string cid){

        string pID = string.Empty;
        string pFirstName = string.Empty;
        string pLastName = string.Empty;
        dsUserTableAdapters.licenseeTableAdapter licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
        dsUser.licenseeDataTable licenseeDT = new dsUser.licenseeDataTable();
        licenseeDT = licenseeTA.GetPrimaryContactByCID(Convert.ToInt32(cid));
        if (licenseeDT.Rows.Count > 0){
             pID = licenseeDT.Rows[0]["ID"].ToString(); ;
             pFirstName = licenseeDT.Rows[0]["FirstName"].ToString();
             pLastName = licenseeDT.Rows[0]["LastName"].ToString();
        }

        dsUserTableAdapters.licensee4MgrTableAdapter licensee4MgrTA = new dsUserTableAdapters.licensee4MgrTableAdapter();
        dsUser.licensee4MgrDataTable licensee4MgrDT = new dsUser.licensee4MgrDataTable();
        licensee4MgrDT = licensee4MgrTA.GetLicenseesByCID(Convert.ToInt32(cid));
        for (int i = 0; i < licensee4MgrDT.Rows.Count; i++)
        {
            if (!(licensee4MgrDT.Rows[i]["UserLevel"] is DBNull))
            {

                switch (licensee4MgrDT[i].UserLevel)
                {
                    case "A": licensee4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                    case "B": licensee4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                    case "C":
                        if (!(licensee4MgrDT.Rows[i]["AllowedYear"] is DBNull))
                        {
                            if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= licensee4MgrDT[i].AllowedYear)
                            {
                                licensee4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                licensee4MgrDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                            }
                        }
                        else
                        {
                            licensee4MgrDT[i].Status = "<b>Unknown</b>";
                        }

                        break;
                    case "D":
                        if (!(licensee4MgrDT.Rows[i]["FromDate"] is DBNull) && !(licensee4MgrDT.Rows[i]["ToDate"] is DBNull))
                        {
                            if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= licensee4MgrDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= licensee4MgrDT[i].ToDate))
                            {
                                licensee4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                licensee4MgrDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                            }
                        }
                        else
                        {
                            licensee4MgrDT[i].Status = "<b>Unknown</b>";
                        }
                        break;
                    case "X":
                        licensee4MgrDT[i].Status = "<b><font color=\"red\">Suspended</font></b>";
                        break;
                    default: break;
                }
            }
        }
        List<user> users = new List<user>();
        foreach (DataRow dr in licensee4MgrDT.Rows)
        {
            user u = new user();
            u.uid = dr["ID"].ToString();
            u.firstName = dr["FirstName"].ToString();
            u.lastName = dr["LastName"].ToString();
            u.email = dr["Email"].ToString();
            u.userCategory = dr["UserCategory"].ToString();
            u.requestorName = dr["RequestorName"].ToString();
            u.status = dr["Status"].ToString();
            u.cid = cid;
            u.primaryContact = Convert.ToBoolean(dr["PrimaryContact"].ToString());
            //u.primaryContact = true;
            //u.requestorName = "Hudson Choi";
            //u.status = "Current";
            /*
            if (dr["RequestorName"] != null)
            {
                u.requestorName = dr["RequestorName"].ToString();
            }
            if (dr["Status"] != null)
            {
                u.status = dr["Status"].ToString();
            }
            */
            u.pid = pID;
            u.pFirstName = pFirstName;
            u.pLastName = pLastName;
            
            if (dr["RequestorEmail"] != null)
            {
                u.mlbEmail = dr["RequestorEmail"].ToString();
                u.mlbName = dr["RequestorName"].ToString();
            }
            else
            {
                u.mlbEmail = "";
                u.mlbName = "";
            }
            users.Add(u);
        }
        return users;
        //List<CollectData> 
        //return c;
    }
    [WebMethod]
    public List<user> DeleteUserAndReturnNewList(string uID, string cID)
    {
        //TO DO: Use uID to delete the user
        dsUserTableAdapters.licenseeTableAdapter licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
        dsUser.licenseeDataTable licenseeDT = new dsUser.licenseeDataTable();
        licenseeDT = licenseeTA.GetUserByID(Convert.ToInt32(uID));
        licenseeDT.Rows[0].Delete();
        licenseeTA.Update(licenseeDT);
        //Get the user list after deleteion
        List<user> users = GetUsersByCID(cID);
        return users;
    }

    [WebMethod]
    public List<user> ChangePrimaryContact(string uID, string cID)
    {
        //TO DO: Use uID to delete the user
        dsUserTableAdapters.licenseeTableAdapter licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
        licenseeTA.ResetPrimaryContactByCID(Convert.ToInt32(cID));
        licenseeTA.MakeHerPrimaryContactByID(Convert.ToInt32(uID));

        //Get the user list after changing the primary contact
        List<user> users = GetUsersByCID(cID);
        return users;
    }

    [WebMethod]
    public string NotifyPrimaryContact(string pID, string cID)
    {
        //TO DO: Use pID and cID to send email;

        //Get the user list after deleteion
        //List<user> users = GetUsersByCID(cID);
        //return users;
        dsUserTableAdapters.licenseeTableAdapter licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
        dsUser.licenseeDataTable licenseeDT = new dsUser.licenseeDataTable();
        licenseeDT = licenseeTA.GetUserByID(Convert.ToInt32(pID));
        string pEmail = licenseeDT.Rows[0]["email"].ToString();
        //string pEmail = "hudsonchoi@gmail.com";
        //string mlbEmail = "hudsonhchoi@gmail.com";
        string pFirstName = licenseeDT.Rows[0]["FirstName"].ToString();
        string pLastName = licenseeDT.Rows[0]["LastName"].ToString();

        dsRequestorsTableAdapters.requestorsTableAdapter requestorsTA = new dsRequestorsTableAdapters.requestorsTableAdapter();
        dsRequestors.requestorsDataTable requestorsDT = new dsRequestors.requestorsDataTable();
        requestorsDT = requestorsTA.GetRequestorByID(Convert.ToInt32(licenseeDT.Rows[0]["RequestorID"].ToString()));
        string mlbEmail = requestorsDT.Rows[0]["Email"].ToString();


        licenseeDT = licenseeTA.GetUsersByCID(Convert.ToInt32(cID));

        StringBuilder sbMsg = new StringBuilder();
        StringBuilder sbMsgPop = new StringBuilder();
        sbMsg.Append("Dear " + pFirstName + " " + pLastName + ",<br><br>");
	sbMsg.Append("As part of our ongoing security practices, this message provides a current active list of the MLBstyleguide.com user group that you oversee. Please review and confirm that all of the following users are in good standing. If the status has changed for any of the registered users, it is very important that you let your MLB representative know immediately so that they can be removed from the active user list.<br><br>");
        //sbMsg.Append("Please confirm the following users are up-to-dated and let us know if anyone needs to be removed.<br><br>");
        sbMsgPop.Append("The following users were emailed to '" + pFirstName + "' successfully!\n\n");
        foreach (dsUser.licenseeRow r in licenseeDT.Rows)
        {
            sbMsg.Append(r["FirstName"].ToString() + " " + r["LastName"].ToString() + "<br>");
            sbMsgPop.Append(r["FirstName"].ToString() + " " + r["LastName"].ToString() + "\n");
        }
        sbMsg.Append("<br>Thank you for your cooperation.<br><br>Major League Baseball Properties");

        string _FromName = "Major League Baseball";
        string _FromEmail = "info@mlbstyleguide.com";
        string strSubject = "MLB Style Guide: The current user list";
        SmtpClient smtpClient;
        MailMessage message;
        try
        {
            smtpClient = new SmtpClient();
            smtpClient.Host = ConfigurationManager.AppSettings["SMTPServer"].ToString();
            smtpClient.Port = 25;
            message = new MailMessage();

            MailAddress fromAddress = new MailAddress(_FromEmail, _FromName);
            message.From = fromAddress;

            MailAddress toAddress = new MailAddress(pEmail);
            message.To.Clear();
            message.To.Add(toAddress);

            MailAddress ccAddress = new MailAddress(mlbEmail);
            message.CC.Clear();
            message.CC.Add(ccAddress);

            message.Subject = strSubject;
            message.IsBodyHtml = true;
            message.Body = sbMsg.ToString();
            smtpClient.Send(message);

        }
        catch (Exception ex)
        {
            //throw ex;
            //iBadEmails++;
            //sbBadEmailList.Append("<a href=\"EditUser.aspx?id=" + strID + "\" target=\"_blank\">" + strRecepient + "</a><br/>");
        }
        return sbMsgPop.ToString();
    }


    [WebMethod]
    public string TryIt(string uID, string cID)
    //public string TryIt(string uID)
    {
        //TO DO: Use uID to delete the user

        //Get the user list after deleteion
        return uID + ":"+cID;
        //return uID;
    }

    [WebMethod]
    public string ContactTheUser(string email, string cID)
    {
        //return email + ":::::::" + cID;

        dsUserTableAdapters.licenseeTableAdapter licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
        dsUser.licenseeDataTable licenseeDT = new dsUser.licenseeDataTable();

        dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
        dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
        legacyusersDT = legacyusersTA.GetCompanyByID(Convert.ToInt32(cID));

        StringBuilder sbMsg = new StringBuilder();
        StringBuilder sbMsgPop = new StringBuilder();
        sbMsg.Append("<img src=\"cid:Pic1\"><br>");
        sbMsg.Append("Welcome " + legacyusersDT.Rows[0]["Company"].ToString() + ",<br><br>");
        sbMsg.Append("Thank you for registering at www.mlbstyleguide.com.<br><br>");
        sbMsg.Append("Your temporary login information is shown below:<br><br>");

        sbMsg.Append("User name: " + legacyusersDT.Rows[0]["UserName"].ToString() + "<br>");
        sbMsg.Append("Password: " + legacyusersDT.Rows[0]["Password"].ToString() + "<br><br>");

        sbMsg.Append("You can login with this information at http://mlbstyleguide.com. Once you log in you will be asked to complete a short form and create your own unique password. Future access to the site will then be done by simply entering your e-mail address and desired password.<br><br>");
        sbMsg.Append("If you have any questions or need any other assistance, please contact us at info@mlbstyleguide.com.<br><br>");
        sbMsg.Append("<br>Thank you,<br><br>Major League Baseball Properties");

        AlternateView avHthml = AlternateView.CreateAlternateViewFromString(sbMsg.ToString(), null, MediaTypeNames.Text.Html);

        LinkedResource pic1 = new LinkedResource(Server.MapPath("emailbanner.jpg"), MediaTypeNames.Image.Jpeg);
        pic1.ContentId = "Pic1";
        avHthml.LinkedResources.Add(pic1);

        string _FromName = "Major League Baseball";
        string _FromEmail = "info@mlbstyleguide.com";
        string strSubject = "MLB Style Guide Registration";
        SmtpClient smtpClient;
        MailMessage message;
        try
        {
            smtpClient = new SmtpClient();
            smtpClient.Host = ConfigurationManager.AppSettings["SMTPServer"].ToString();
            smtpClient.Port = 25;
            message = new MailMessage();

            MailAddress fromAddress = new MailAddress(_FromEmail, _FromName);
            message.From = fromAddress;

            MailAddress toAddress = new MailAddress(email);
            message.To.Clear();
            message.To.Add(toAddress);

            message.Subject = strSubject;
            message.IsBodyHtml = true;
            //message.Body = sbMsg.ToString();
            message.AlternateViews.Add(avHthml);
            smtpClient.Send(message);
        }
        catch (Exception ex)
        {
            //throw ex;
            //iBadEmails++;
            //sbBadEmailList.Append("<a href=\"EditUser.aspx?id=" + strID + "\" target=\"_blank\">" + strRecepient + "</a><br/>");
        }

        return "Success!!";
    }

}

