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

public partial class EditRequester : System.Web.UI.Page
{
    int iPkey = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                dsRequestorsTableAdapters.requestorsTableAdapter requestorsTA = new dsRequestorsTableAdapters.requestorsTableAdapter();
                dsRequestors.requestorsDataTable requestorsDT = new dsRequestors.requestorsDataTable();
                requestorsDT = requestorsTA.GetRequestorByID(Convert.ToInt32(Request.QueryString["id"].ToString()));
                tbFirstName.Text = requestorsDT[0]["FirstName"].ToString();
                tbLastName.Text = requestorsDT[0]["LastName"].ToString();
                tbEmail.Text = requestorsDT[0]["Email"].ToString();
                if (requestorsDT[0]["MoreInfo"].ToString() != " ")
                {
                    cbLicenseeA.Checked = true;
                }
            }
            else
            {
                Response.Redirect("./");
            }
        }

    }
    protected void btnContinue1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                dsRequestorsTableAdapters.requestorsTableAdapter requestorsTA = new dsRequestorsTableAdapters.requestorsTableAdapter();
                dsRequestors.requestorsDataTable requestorsDT = new dsRequestors.requestorsDataTable();
                requestorsDT = requestorsTA.GetRequestorByID(Convert.ToInt32(Request.QueryString["id"].ToString()));
                requestorsDT[0]["FirstName"] = tbFirstName.Text;
                requestorsDT[0]["LastName"] = tbLastName.Text;
                requestorsDT[0]["Email"] = tbEmail.Text;
                if (cbLicenseeA.Checked)
                {
                    requestorsDT[0]["MoreInfo"] = ":LicenseeA MLB Contact";
                    requestorsDT[0]["DisplayOrder"] = 1;
                }
                else
                {
                    requestorsDT[0]["MoreInfo"] = " ";
                    requestorsDT[0]["DisplayOrder"] = 1;
                }

                requestorsDT.RowChanged += new DataRowChangeEventHandler(Row_Changed);
                requestorsTA.Update(requestorsDT);
                Response.Redirect("RequesterMgr.aspx?newid=" + iPkey);
            }
            catch (Exception ex)
            {
                if (ex.Message.IndexOf("PK_requestors") >= 0)
                {
                    lblErr.Text = "'" + tbFirstName.Text + " " + tbLastName.Text + "' is already registered.";
                    lblErr.Visible = true;
                }
                else
                {
                    throw ex;
                }
            }
        }
    }

    private void Row_Changed(object sender, DataRowChangeEventArgs e)
    {
        iPkey = Convert.ToInt32(e.Row["id"].ToString());
    }
}
