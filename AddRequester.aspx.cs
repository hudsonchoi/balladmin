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

public partial class AddRequester : System.Web.UI.Page
{
    int iPkey = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnContinue1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                dsRequestorsTableAdapters.requestorsTableAdapter requestorsTA = new dsRequestorsTableAdapters.requestorsTableAdapter();
                dsRequestors.requestorsDataTable requestorsDT = new dsRequestors.requestorsDataTable();
                requestorsDT = requestorsTA.GetAllRequestors();
                dsRequestors.requestorsRow requestorR = requestorsDT.NewrequestorsRow();
                requestorR.firstname = tbFirstName.Text;
                requestorR.lastname = tbLastName.Text;
                requestorR.email = tbEmail.Text;
                if (cbLicenseeA.Checked)
                {
                    requestorR.moreinfo = ":LicenseeA MLB Contact";
                    requestorR.displayorder = 1;
                }
                else
                {
                    requestorR.moreinfo = " ";
                    requestorR.displayorder = 1;
                }
                requestorsDT.Rows.Add(requestorR);
                requestorsDT.RowChanged += new DataRowChangeEventHandler(Row_Changed);
                requestorsTA.Update(requestorsDT);
                Response.Redirect("RequesterMgr.aspx?newid=" + iPkey);
            }
            catch (ConstraintException ce)
            {
                if (ce.Message.IndexOf("firstname, lastname") >= 0)
                {
                    lblErr.Text = "'" + tbFirstName.Text + " " + tbLastName.Text + "' is already registered.";
                    lblErr.Visible = true;
                }
                else
                {
                    throw ce;
                }
            }
        }
    }

    private void Row_Changed(object sender, DataRowChangeEventArgs e)
    {
        iPkey = Convert.ToInt32(e.Row["id"].ToString());
    }
}
