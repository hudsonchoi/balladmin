using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;
using System.Configuration;
using System.Text;

public partial class emailimage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        StringBuilder sbMsg = new StringBuilder();
        StringBuilder sbMsgPop = new StringBuilder();
        sbMsg.Append("<img src=\"cid:Pic1\"><br>");
        sbMsg.Append("You can login with this information at http://mlbstyleguide.com. Once you log in you will be asked to complete a short form and create your own unique password. Future access to the site will then be done by simply entering your e-mail address and desired password.<br><br>");
        sbMsg.Append("If you have any questions or need any other assistance, please contact us at info@mlbstyleguide.com.<br><br>");
        sbMsg.Append("<br>Thank you,<br><br>Major League Baseball Properties");

        AlternateView avHthml = AlternateView.CreateAlternateViewFromString(sbMsg.ToString(), null, MediaTypeNames.Text.Html);
        
        LinkedResource pic1 = new LinkedResource(Server.MapPath("emailbanner.jpg"), MediaTypeNames.Image.Jpeg);
        pic1.ContentId = "Pic1";
        avHthml.LinkedResources.Add(pic1);

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

            MailAddress toAddress = new MailAddress("hudsonc@videobankdigital.com");
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
    }
}
