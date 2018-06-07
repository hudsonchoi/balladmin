using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["code"] != null)
        {
            lblInvalid.Visible = true;
        }
        else
        {
            lblInvalid.Visible = false;
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (AdminDAL.CheckUser(tbUsername.Text, tbPassword.Text))
        {
            FormsAuthentication.SetAuthCookie(tbUsername.Text, false);

            string returnUrl = Request.QueryString["ReturnUrl"] as string;

            if (returnUrl != null)
            {
                Response.Redirect(returnUrl);
            }
            else
            {
                //no return URL specified so lets kick him to home page
                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            Response.Redirect("Login.aspx?code=err");
        }
    }
}