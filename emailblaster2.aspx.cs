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
using System.Data.SqlClient;

public partial class emailblaster2 : System.Web.UI.Page
{


    public string sContent = string.Empty;//For email blaster
    public string sSubject = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        
            if (Session["message"] != null)
            {
                sContent = Session["message"].ToString();
            }
            if (Session["subject"] != null)
            {
                sSubject = Session["subject"].ToString();
            }
            tbSubject.Text = sSubject.Replace("&rsquo;", "'");
        }
        if (ViewState["message"] != null)
        {
            sContent = ViewState["message"].ToString();
        }
       
        //btnContinue3.Attributes.Add("onclick", "return submitForm();");
        btnBack.Attributes.Add("onclick", "history.go(-1)");
    }
  
    protected void UpdatePanel1_Load(object sender, EventArgs e)
    {
        
        int iRemaining = 0;
        SqlCommand cmd = null;
        SqlConnection con = null;
        try
        {
            //if (Session["cmd"] == null)
            //{
               // cmd = (SqlCommand)Session["cmd"];
            
            //else
            //{
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MLBStyleGuideConnectionString1"].ToString());
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT count(*) FROM licensee WHERE sent = 0 AND blast = 1";
                cmd.CommandTimeout = 1200;
                con.Open();
                Session["cmd"] = cmd;
           // }

            iRemaining = Convert.ToInt32(cmd.ExecuteScalar());
        }
        catch (SqlException se)
        {
            //return se.Message;
        }
        finally
        {
            if (con != null)
            {
                con.Dispose();
            }
            if (cmd != null)
            {
                cmd.Dispose();
            }
           
        }
        

        
        //lblResult.Text = "It is now " + DateTime.Now;

        lblResult.Text = "Remaining number of recipients: " + iRemaining;
        //if (Page.IsPostBack)
        //{
            lblResult.Visible = true;
        //}
        //else
        //{
            //Session["iRemaining"] = iRemaining;
        //    lblResult.Visible = false;
        //}
        lblToSend.Text = "Total # of recipients to try: " + iRemaining;
    }


    protected void btnContinue3_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblStep.Text = "Step 4 of 4:";
            lblDescription.Text = "Launch the email blast!";
            tableUserCategory.Visible = false;
            tableRequestor.Visible = true;
            string strFiltered = tbSubject.Text.Replace("'", "&rsquo;");
            strFiltered = strFiltered.Replace("\"", "&quot;");
            Session["subject"] = strFiltered;
            ViewState["message"] = RTESafe(Server.HtmlDecode(Request.Form["message"].ToString()));
            Session["message"] = RTESafe(Server.HtmlDecode(Request.Form["message"].ToString()));

            int iRemaining = 0;
            SqlCommand cmd = null;
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["MLBStyleGuideConnectionString1"].ToString());
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT count(*) FROM licensee WHERE sent = 0 AND blast = 1";
                cmd.CommandTimeout = 1200;
                con.Open();
                iRemaining = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (SqlException se)
            {
                //return se.Message;
            }
            finally
            {
                if (con != null)
                {
                    con.Dispose();
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                }

            }
            Session["iRemaining"] = iRemaining;
            lblResult.Visible = false;
            //ViewState["message"] = tbMessage.Text;
            //Label1.Text = Server.HtmlDecode(RTESafe(Request.Form["message"].ToString()));
            //Response.Redirect("emailblaster2.aspx");
            //Server.Transfer("emailblaster2.aspx");
        }

    }

    protected void btnBack4_Click(object sender, EventArgs e)
    {
        lblStep.Text = "Step 3 of 4:";
        lblDescription.Text = "Provide the email subject and message";
        tableUserCategory.Visible = true;
        tableRequestor.Visible = false;
        btnBack.Attributes.Add("onclick", "history.go(-3)");
    }

    public string RTESafe(string strText)
    {

        string tmpString = string.Empty;
        tmpString = strText.Trim();
        //tmpString = tmpString.Replace(" ", "");
        tmpString = tmpString.Replace("\r", "");
        tmpString = tmpString.Replace("\n", "");
        tmpString = tmpString.Replace("\t", "");

        //convert all types of single quotes
        tmpString = tmpString.Replace((char)145, (char)39);
        tmpString = tmpString.Replace((char)146, (char)39);
        tmpString = tmpString.Replace("'", "&#39;");

        //convert all types of double quotes
        tmpString = tmpString.Replace((char)147, (char)34);
        tmpString = tmpString.Replace((char)148, (char)34);

        return tmpString;
    }
    protected void btnBack3_Click(object sender, EventArgs e)
    {
    }

    /*
    protected void cvMessage_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.Form["message"].ToString().Trim().Length == 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }*/
}
