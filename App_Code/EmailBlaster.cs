using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Configuration;
using System.Text;


/// <summary>
/// Summary description for EmailBlaster
/// </summary>
[WebService(Namespace = "http://hudsonchoi.com/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]
public class EmailBlaster : System.Web.Services.WebService
{
    string _FromName;
    string _FromEmail;

    string _Subject;
    string _Message;

    int i = 0;
    int iBadEmails = 0;
    StringBuilder sbEmailList = new StringBuilder();
	StringBuilder sbBadEmailList = new StringBuilder();

    SmtpClient smtpClient;
    MailMessage message;
    public EmailBlaster()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
        smtpClient = new SmtpClient();
        smtpClient.Host = ConfigurationManager.AppSettings["SMTPServer"].ToString();
        smtpClient.Port = 25;
        message = new MailMessage();

        _FromName = "Major League Baseball";
        _FromEmail = "info@mlbstyleguide.com";
        _Subject = "MLB Confidential 2009 Style Guide Release!";
    }

    [WebMethod]
    public string LaunchEmailBlast(string strSubject, string strMessage)
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MLBStyleGuideConnectionString1"].ToString());

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT id, email FROM licensee WHERE Blast=1";
        cmd.CommandTimeout = 1200;

        SqlConnection ucon = new SqlConnection(ConfigurationManager.ConnectionStrings["MLBStyleGuideConnectionString1"].ToString());
        SqlCommand ucmd = new SqlCommand();
        ucmd.Connection = ucon;
        ucmd.CommandType = CommandType.Text;
        ucmd.CommandText = "UPDATE licensee SET sent = 1 WHERE id = @id";
        ucmd.CommandTimeout = 1200;
        ucmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Int, 4));

        try
        {
            con.Open();
            ucon.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                SendMail(reader.GetString(1), strSubject, strMessage, reader.GetInt32(0).ToString());
				sbEmailList.Append(reader.GetString(1) + ",");
                //SendMail("choihudson@gmail.com", strSubject, Server.HtmlDecode(strMessage));
                //SendMail("abc@abc.com", strSubject, Server.HtmlDecode(strMessage), reader.GetInt32(0).ToString());
                ucmd.Parameters["@id"].Value = reader.GetInt32(0).ToString();
                ucmd.ExecuteNonQuery();
                i++;
            }
        }
        catch (SqlException se)
        {
            return se.Message;
        }
        finally
        {
            con.Close();
            ucon.Close();
        }

        //System.Threading.Thread.Sleep(10000);

        SendMonitorEmail(strSubject, strMessage);
        return i + ":" + iBadEmails + ":" + sbBadEmailList.ToString();
        //System.Threading.Thread.Sleep(10000);
        //return "Bingo";
    }

    public void SendMail(string strRecepient, string strSubject, string strMessage, string strID)
    {
        try
        {
            MailAddress fromAddress = new MailAddress(_FromEmail, _FromName);
            message.From = fromAddress;

            MailAddress toAddress = new MailAddress(strRecepient);
            message.To.Clear();
            message.To.Add(toAddress);
            /*
            _Message = "Dear Style Guide User,<br><br>" +
             "Major League Baseball is excited to announce the pre-release " +
             "of the MLB 2009 Club Marks and Uniform Online Style Guide.<br><br>" +
             "To view, please log on to " +
             "<a href=\"http://www.mlbstyleguide.com\">www.mlbstyleguide.com</a>.<br><br>" +
             "As the new site contains <b>confidential changes to clubs</b> that will be " +
             "unveiled at a designated future date, it is critical that you keep " +
             "the contents of this site <b>strictly confidential</b>.<br><br>"+
             "In order to ensure the most accurate files possible, annual " +
             "replacement of all Club files residing on your drive is recommended. " +
             "A listing of Club changes and their unveiling dates can be found " +
             "on the site’s opening page.<br><br>" +
             "We look to continually improve this site. Your comments and " +
             "suggestions are always welcome.<br><br>" +
             "Anne Occi<br>"+
             "VP Design Services<br>"+
             "<a href=\"mailto:Anne.occi@mlb.com\">Anne.occi@mlb.com</a>";
            */

            message.Subject = strSubject.Replace("&rsquo;", "'");
            message.IsBodyHtml = true;
            message.Body = strMessage;
            smtpClient.Send(message);
        }
        catch (Exception ex)
        {
            //throw ex;
            iBadEmails++;
            sbBadEmailList.Append("<a href=\"EditUser.aspx?id=" + strID + "\" target=\"_blank\">" + strRecepient +"</a><br/>");
        }
    }

    public void SendMonitorEmail(string strSubject, string strMessage)
    {
        MailAddress fromAddress = new MailAddress(_FromEmail, _FromName);
        message.From = fromAddress;

        MailAddress toAddress = new MailAddress("hudsonchoi@gmail.com");
        message.To.Clear();
        message.To.Add(toAddress);

        message.Subject = "MLB Email Blaster Monitoring";
        message.IsBodyHtml = true;
        message.Body = "<b>Subject:</b> " + strSubject + "<br><br>" +
                       "<b>Message:</b> " + Server.HtmlDecode(strMessage) + "<br><br>" +
                        "<b>Total emails tried:</b> " + i + "<br>" +
						"<b>Total Recipient List:</b>" + sbEmailList.ToString() + "<br><br>" +
                       "<b># of emails failed:</b> " + iBadEmails + "<br>" +
                       "<b>Bad Recipient List:</b>" + sbBadEmailList.ToString();
        smtpClient.Send(message);

    }
}

