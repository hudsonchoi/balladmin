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

public partial class editor : System.Web.UI.Page
{
    public string sContent = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Attributes.Add("onclick", "return submitForm();");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Label1.Text = RTESafe(Request.Form["rte1"].ToString());

        Literal1.Text = Server.HtmlDecode(RTESafe(Request.Form["rte1"].ToString()));
    }

    public string RTESafe(string strText)
    {
        
        string tmpString = string.Empty;
        tmpString = strText.Trim();

        //convert all types of single quotes
        tmpString = tmpString.Replace((char)145, (char)39);
        tmpString = tmpString.Replace((char)146, (char)39);
        tmpString = tmpString.Replace("'", "&#39;");

        //convert all types of double quotes
        tmpString = tmpString.Replace((char)147, (char)34);
        tmpString = tmpString.Replace((char)148, (char)34);
       
        return tmpString;
    }
}
