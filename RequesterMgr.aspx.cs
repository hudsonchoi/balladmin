using System;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class RequesterMgr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDone.Visible = false;
        if ((!Page.IsPostBack) && ((Request.QueryString["id"] != null)||(Request.QueryString["did"] != null)))
        {
            dsRequestorsTableAdapters.otherRequestorsTableAdapter otherRequestorsTA = new dsRequestorsTableAdapters.otherRequestorsTableAdapter();
            dsRequestors.otherRequestorsDataTable otherRequestorsDT = new dsRequestors.otherRequestorsDataTable();
            if (Request.QueryString["did"] != null)//Deleting with users still exsiting
            {
                otherRequestorsDT = otherRequestorsTA.GetOtherRequestors(Convert.ToInt32(Request.QueryString["did"].ToString()));
            }
            else
            {
                otherRequestorsDT = otherRequestorsTA.GetOtherRequestors(Convert.ToInt32(Request.QueryString["id"].ToString()));
            }
           

            ddlMLBContacts.DataSource = otherRequestorsDT;
            ddlMLBContacts.DataBind();
            ListItem li = new ListItem("Select One","0");
            ddlMLBContacts.Items.Insert(0, li);
            pnlEdit.Visible = true;
            PopulateCblLicensees();
        }

        if (Session["name"] != null)
        {
            lblDone.Text = "'" + Session["name"].ToString() + "' has been successfully DELETED!";
            lblDone.Visible = true;
            pnlEdit.Visible = true;
            Session["name"] = null;
            lblRequestor.Visible = false;
            lblMoveDone.Visible = false;
            ddlMLBContacts.Enabled = false;
            btnMove.Enabled = false;
            btnSave.Enabled = false;
        }


    }
    protected void btnAdd1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddRequester.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblBreadCrumb.Text = "<a href=\"./\">Home</a> :: <a href=\"./UserMgr.aspx\">User Manager</a>";
    }
    protected void gvRequesters_RowDataBound(object sender, GridViewRowEventArgs e)
    {
     
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[4].Text = "<input type=\"button\" value=\"Delete\" onclick=\"Warning('" + Server.UrlEncode(e.Row.Cells[1].Text).Replace("'", "&#146;") + "', '" + Server.UrlEncode(e.Row.Cells[0].Text).Replace("'", "&#146;") + "', '" + gvRequesters.DataKeys[e.Row.RowIndex]["id"].ToString() + "')\">";

            e.Row.Cells[6].Text = "<input type=\"button\" value=\"Edit the users\" onclick=\"window.location='RequesterMgr.aspx?id=" + gvRequesters.DataKeys[e.Row.RowIndex]["id"].ToString() + "'\">";
             if (Request.QueryString["newid"] != null)
            {
                if (Request.QueryString["newid"].ToString() == gvRequesters.DataKeys[e.Row.RowIndex]["id"].ToString())
                {
                    e.Row.BackColor = Color.Yellow;
                    e.Row.ForeColor = Color.Black;
                }
            }

            if (Request.QueryString["did"] != null)
            {
                if (Request.QueryString["did"].ToString() == gvRequesters.DataKeys[e.Row.RowIndex]["id"].ToString())
                {
                    e.Row.BackColor = Color.Yellow;
                    e.Row.ForeColor = Color.Black;
                }
            }
            
        }
        
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string strID = string.Empty;
        if (Request.QueryString["id"] != null)
        {
            strID = Request.QueryString["id"].ToString();
        }
        if (Request.QueryString["did"] != null)
        {
            strID = Request.QueryString["did"].ToString();
        }
        if (strID.Length > 0)
        {
            dsRequestorsTableAdapters.licenseeTableTableAdapter licenseeTableTA = new dsRequestorsTableAdapters.licenseeTableTableAdapter();
            dsRequestors.licenseeTableDataTable licenseeTableDT = new dsRequestors.licenseeTableDataTable();
            licenseeTableDT = licenseeTableTA.GetLicenseesByRequestorTable(Convert.ToInt32(strID));
            foreach (DataRow dr in licenseeTableDT)
            {
                if (cblLicensees.Items.FindByValue(dr["id"].ToString()).Selected)
                {
                    dr["RequestorID"] = Convert.ToInt32(strID);
                }
                else
                {
                    dr["RequestorID"] = DBNull.Value;
                }
            }
            licenseeTableTA.Update(licenseeTableDT);
            /*
                dsRequestorsTableAdapters.licenseeTableAdapter licenseeTA = new dsRequestorsTableAdapters.licenseeTableAdapter();
            dsRequestors.licenseeDataTable licenseeDT = new dsRequestors.licenseeDataTable();
            licenseeDT = licenseeTA.GetLicenseesByRequestor(Convert.ToInt32(Request.QueryString["id"].ToString()));
            foreach (DataRow dr in licenseeDT)
            {
                if (cblLicensees.Items.FindByValue(dr["ID"].ToString()).Selected)
                {
                    dr["RequestorID"] = Convert.ToInt32(Request.QueryString["id"].ToString());

                }
           

             
            }
        
    */
            //Display the requester name
            dsRequestorsTableAdapters.requestorsTableAdapter requestorsTA = new dsRequestorsTableAdapters.requestorsTableAdapter();
            dsRequestors.requestorsDataTable requestorsDT = new dsRequestors.requestorsDataTable();
            requestorsDT = requestorsTA.GetRequestorByID(Convert.ToInt32(strID));
            lblDone.Text = requestorsDT[0]["FirstName"].ToString() + " " + requestorsDT[0]["LastName"].ToString() + "'s user list has been updated SUCCESSFULLY!";
            ddlMLBContacts.Enabled = false;
            btnMove.Enabled = false;
            lblDone.Visible = true;

            pnlEdit.Visible = true;
            pnlUsers.Visible = false;
        }
            else
        {
            Response.Redirect("RequesterMgr.aspx");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pnlUsers.Visible = false;
        pnlEdit.Visible = false;
    }
    protected void cvMLBContacts_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value == "0")
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void btnMove_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string strID = string.Empty;
            if (Request.QueryString["id"] != null)
            {
                strID = Request.QueryString["id"].ToString();
            }
            if (Request.QueryString["did"] != null)
            {
                strID = Request.QueryString["did"].ToString();
            }
            if (strID.Length > 0)
            {
                dsRequestorsTableAdapters.licenseeTableTableAdapter licenseeTableTA = new dsRequestorsTableAdapters.licenseeTableTableAdapter();
                dsRequestors.licenseeTableDataTable licenseeTableDT = new dsRequestors.licenseeTableDataTable();
                licenseeTableDT = licenseeTableTA.GetLicenseesByRequestorTable(Convert.ToInt32(strID));
                string tmp = string.Empty;
                foreach (DataRow dr in licenseeTableDT)
                {
                    if (dr["RequestorID"] != DBNull.Value)
                    {
                        dr["RequestorID"] = Convert.ToInt32(ddlMLBContacts.SelectedValue);
                        //tmp += dr["id"].ToString() + ":";
                    }
                    //tmp += dr["RequestorID"].ToString() + ":";
                    //if (cblLicensees.Items.FindByValue(dr["id"].ToString()).Selected)
                    //{
                    //    dr["RequestorID"] = Convert.ToInt32(strID);
                    //}
                    //else
                    //{
                    //    dr["RequestorID"] = DBNull.Value;
                    //}
                }

                //lblMoveDone.Text = tmp;
                licenseeTableTA.Update(licenseeTableDT);

                //Display the requester name
                dsRequestorsTableAdapters.requestorsTableAdapter requestorsTA = new dsRequestorsTableAdapters.requestorsTableAdapter();
                dsRequestors.requestorsDataTable requestorsDT = new dsRequestors.requestorsDataTable();
                requestorsDT = requestorsTA.GetRequestorByID(Convert.ToInt32(strID));
                string ln = ddlMLBContacts.SelectedItem.Text.Substring(0, ddlMLBContacts.SelectedItem.Text.IndexOf(" ") - 1);
                string fn = ddlMLBContacts.SelectedItem.Text.Substring(ddlMLBContacts.SelectedItem.Text.IndexOf(" ")+1);
                lblMoveDone.Text = requestorsDT[0]["FirstName"].ToString() + " " + requestorsDT[0]["LastName"].ToString() + "'s ALL users been assigned to <br>'" + fn + " " + ln + "' SUCCESSFULLY!";
               // Response.Redirect("RequesterMgr.aspx?id=" + ddlMLBContacts.SelectedValue);

                PopulateCblLicensees();
            }
        }
    }

    protected void PopulateCblLicensees()
    {
        dsRequestorsTableAdapters.licenseeTableAdapter licenseeTA = new dsRequestorsTableAdapters.licenseeTableAdapter();
        dsRequestors.licenseeDataTable licenseeDT = new dsRequestors.licenseeDataTable();
        if (Request.QueryString["did"] != null)//Deleting with users still exsiting
        {
            licenseeDT = licenseeTA.GetLicenseesByRequestor(Convert.ToInt32(Request.QueryString["did"].ToString()));
        }
        else
        {
            licenseeDT = licenseeTA.GetLicenseesByRequestor(Convert.ToInt32(Request.QueryString["id"].ToString()));
        }


        //Display the requester name
        dsRequestorsTableAdapters.requestorsTableAdapter requestorsTA = new dsRequestorsTableAdapters.requestorsTableAdapter();
        dsRequestors.requestorsDataTable requestorsDT = new dsRequestors.requestorsDataTable();
        if (Request.QueryString["did"] != null)//Deleting with users still exsiting
        {
            requestorsDT = requestorsTA.GetRequestorByID(Convert.ToInt32(Request.QueryString["did"].ToString()));
        }
        else
        {
            requestorsDT = requestorsTA.GetRequestorByID(Convert.ToInt32(Request.QueryString["id"].ToString()));
        }


        if (licenseeDT.Rows.Count > 0)
        {
            cblLicensees.DataSource = licenseeDT;
            cblLicensees.DataTextField = "siteuser";
            cblLicensees.DataValueField = "id";
            cblLicensees.DataBind();

            //Pre-select the users under the corresponding requester
            bool bEnable = false;
            foreach (DataRow dr in licenseeDT)
            {
                if (dr["RequestorID"] != DBNull.Value)
                {
                    cblLicensees.Items.FindByValue(dr["ID"].ToString()).Selected = true;
                    lblDone.Text = "You may edit the individual users.";
                    bEnable = true;
                }
                else
                {
                    lblDone.Text = "You may choose the individual users. The users who are not assigned to an MLB contact are appended at the bottom of the list.";

                }
            }

            ddlMLBContacts.Enabled = bEnable;
            btnMove.Enabled = bEnable;
            lblMoveDone.Visible = bEnable;

            lblDone.Visible = true;
            pnlEdit.Visible = true;


  
            lblRequestor.Text = "<b>" + requestorsDT[0]["FirstName"].ToString() + " " + requestorsDT[0]["LastName"].ToString() + "</b>'s user list:";

            if (Request.QueryString["did"] != null)
            {
                lblDone.Text = "There are still users that <b>'" + requestorsDT[0]["FirstName"].ToString() + " " + requestorsDT[0]["LastName"].ToString() + "'</b> is taking care of.<br><br>" +
                    "Please remove or assign them to other MLB contacts first and then try to delete '" + requestorsDT[0]["FirstName"].ToString() + " " + requestorsDT[0]["LastName"].ToString() + "' again.<br><br>";
                lblDone.Visible = true;
                pnlEdit.Visible = true;
            }

            pnlUsers.Visible = true;
            //ddlMLBContacts.Enabled = true;
            //btnMove.Enabled = true;
            lblDone.Visible = true;

        }
        else
        {
            ddlMLBContacts.Enabled = false;
            btnMove.Enabled = false;
            lblDone.Text = "There is no user to choose for <b>'" + requestorsDT[0]["FirstName"].ToString() + " " + requestorsDT[0]["LastName"].ToString() + "'</b>. All of them are under one of the MLB contacts.<br/><br/>You can get users from other MLB contacts or uncheck some of them to release. And then you can select them here.";
            lblDone.Visible = true;
            pnlEdit.Visible = true;
            pnlUsers.Visible = false;
        }
    }
}
