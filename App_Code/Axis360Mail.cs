using System;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Collections;
using System.Collections.Specialized;


/// <summary>
/// Summary description for Axis360Mail
/// </summary>
public class Axis360Mail
{
    string _FromName;
    string _FromEmail;
    string _ToName1;
    string _ToEmail1 = string.Empty;
    string _ToName2;
    string _ToEmail2 = string.Empty;
    string _ToName3;
    string _ToEmail3 = string.Empty;
    string _BCCName;
    string _BCCEmail = string.Empty;
    string _Subject;
    string _Message;
    StringDictionary _sdToEmails;
    
    bool _IsBodyHtml = false;
    SmtpClient smtpClient; 
    MailMessage message;

	public Axis360Mail()
    {
        smtpClient = new SmtpClient();
        smtpClient.Host = System.Configuration.ConfigurationManager.AppSettings["SMTPServer"].ToString();
        smtpClient.Port = 25;
        message = new MailMessage();
		//
		// TODO: Add constructor logic here
		//
	}

    public void Send()
    {
        MailAddress fromAddress = new MailAddress(_FromEmail, _FromName);
        message.From = fromAddress;

        MailAddress toAddress = new MailAddress(_ToEmail1, _ToName1);
        message.To.Add(toAddress);

        if (_ToEmail2.Length > 0)
        {
            MailAddress toAddress2 = new MailAddress(_ToEmail2, _ToName2);
            message.To.Add(toAddress2);
        }

        if (_ToEmail3.Length > 0)
        {
            MailAddress toAddress3 = new MailAddress(_ToEmail3, _ToName3);
            message.To.Add(toAddress3);
        }

        if (_BCCEmail.Length > 0)
        {
            MailAddress bccAddress = new MailAddress(_BCCEmail, _BCCName);
            message.Bcc.Add(bccAddress);
        }


        message.Subject = _Subject;
        message.IsBodyHtml = _IsBodyHtml;
        message.Body = _Message;
        smtpClient.Send(message);
    }

    public string FromName
    {
        get { return _FromName; }
        set { _FromName = value; }
    }

    public string FromEmail
    {
        get { return _FromEmail; }
        set { _FromEmail = value; }
    }

    public string Subject
    {
        get { return _Subject; }
        set { _Subject = value; }
    }

    public string Message
    {
        get { return _Message; }
        set { _Message = value; }
    }

    public bool IsBodyHtml
    {
        get { return _IsBodyHtml; }
        set { _IsBodyHtml = value; }
    }

    public string ToName1
    {
        get { return _ToName1; }
        set { _ToName1 = value; }
    }

    public string ToEmail1
    {
        get { return _ToEmail1; }
        set { _ToEmail1 = value; }
    }

    public string ToName2
    {
        get { return _ToName2; }
        set { _ToName2 = value; }
    }

    public string ToEmail2
    {
        get { return _ToEmail2; }
        set { _ToEmail2 = value; }
    }

    public string ToName3
    {
        get { return _ToName3; }
        set { _ToName3 = value; }
    }

    public string ToEmail3
    {
        get { return _ToEmail3; }
        set { _ToEmail3 = value; }
    }

    public string BCCName
    {
        get { return _BCCName; }
        set { _BCCName = value; }
    }

    public string BCCEmail
    {
        get { return _BCCEmail; }
        set { _BCCEmail = value; }
    }
}
