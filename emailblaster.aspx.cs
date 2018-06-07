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

public partial class emailblaster : System.Web.UI.Page
{
    private dsUserTableAdapters.uspLicenseesBySiteletIDTableAdapter uspSiteletTA;
    private dsUser.uspLicenseesBySiteletIDDataTable uspSiteletDT;
    private dsUserTableAdapters.uspLicenseesByRequesterIDTableAdapter uspRequesterTA;
    private dsUser.uspLicenseesByRequesterIDDataTable uspRequesterDT;
    private dsUserTableAdapters.uspLicenseesByUserLevelTableAdapter uspUserLevelTA;
    private dsUser.uspLicenseesByUserLevelDataTable uspUserLevelDT;
    private dsUserTableAdapters.uspLicenseesByUserCategoryTableAdapter uspUserCategoryTA;
    private dsUser.uspLicenseesByUserCategoryDataTable uspUserCategoryDT;

    private dsUserTableAdapters.licenseeTableAdapter licenseeTA;
    private dsUser.licenseeDataTable licenseeDT;

    //public string sContent = string.Empty;//For email blaster
    public string sContent = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(0));
        Response.Cache.SetCacheability(HttpCacheability.Public);
        if (Session["message"] != null)
        {
            sContent = Session["message"].ToString();
        }
        ddlSitelet.Attributes.Add("onchange", "MutuallyExclusive('sitelet')");
        ddlRequesters.Attributes.Add("onchange", "MutuallyExclusive('requester')");
        ddlUserLevel.Attributes.Add("onchange", "MutuallyExclusive('level')");
        ddlCategory.Attributes.Add("onchange", "MutuallyExclusive('category')");
        if (Page.IsPostBack)
        {
            if (ddlSitelet.SelectedValue != "0")
            {

                //if ((Session["by"] == null)||(Session["by"].ToString() != "sitelet" + ddlSitelet.SelectedValue))
                //{
                    uspSiteletTA = new dsUserTableAdapters.uspLicenseesBySiteletIDTableAdapter();
                    uspSiteletDT = new dsUser.uspLicenseesBySiteletIDDataTable();
                    uspSiteletDT = uspSiteletTA.GetLicenseesBySiteletID(Convert.ToInt32(ddlSitelet.SelectedValue));

                    for (int j = 0; j < uspSiteletDT.Rows.Count; j++)
                    {
                        if (uspSiteletDT.Rows[j]["UserLevel"].ToString() == "C")
                        {
                           if (!(uspSiteletDT.Rows[j]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) > uspSiteletDT[j].AllowedYear)
                                {
                                    uspSiteletDT.Rows[j].Delete();
                                }
                            }
                            else
                            {
                                uspSiteletDT.Rows[j].Delete();
                            }   
                        }
                        else if (uspSiteletDT.Rows[j]["UserLevel"].ToString() == "D")
                        {

                            if (!(uspSiteletDT.Rows[j]["FromDate"] is DBNull)&& !(uspSiteletDT.Rows[j]["ToDate"] is DBNull))
                            {
                                if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) < uspSiteletDT[j].FromDate) || (Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= uspSiteletDT[j].ToDate))
                                {
                                    uspSiteletDT.Rows[j].Delete();
                                }
                            }
                            else
                            {
                                uspSiteletDT.Rows[j].Delete();
                            }   

                        }

                    }
                    uspSiteletDT.AcceptChanges();
                    gvRecipients.DataSource = uspSiteletDT;
                    gvRecipients.DataBind();
                    //lblStep.Text = "==>" + uspSiteletDT.Rows.Count;
                    lblRecipientNumber.Text = "There are " + uspSiteletDT.Rows.Count + " recipients.";
                    //Session["by"] = "sitelet" + ddlSitelet.SelectedValue;
                    Session["uspSiteLetDT"] = uspSiteletDT;
                //}

            }
            else if (ddlRequesters.SelectedValue != "0")
            {
                //if ((Session["by"] == null) || (Session["by"].ToString() != "requester" + ddlRequesters.SelectedValue))
                //{
                    uspRequesterTA = new dsUserTableAdapters.uspLicenseesByRequesterIDTableAdapter();
                    uspRequesterDT = new dsUser.uspLicenseesByRequesterIDDataTable();
                    uspRequesterDT = uspRequesterTA.GetLicenseesByRequesterID(Convert.ToInt32(ddlRequesters.SelectedValue));
                    

                    for (int j = 0; j < uspRequesterDT.Rows.Count; j++)
                    {
                        if (uspRequesterDT.Rows[j]["UserLevel"].ToString() == "C")
                        {
                            if (!(uspRequesterDT.Rows[j]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) > uspRequesterDT[j].AllowedYear)
                                {
                                    uspRequesterDT.Rows[j].Delete();
                                }
                            }
                            else
                            {
                                uspRequesterDT.Rows[j].Delete();
                            }
                        }
                        else if (uspRequesterDT.Rows[j]["UserLevel"].ToString() == "D")
                        {

                            if (!(uspRequesterDT.Rows[j]["FromDate"] is DBNull) && !(uspRequesterDT.Rows[j]["ToDate"] is DBNull))
                            {
                                if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) < uspRequesterDT[j].FromDate) || (Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= uspRequesterDT[j].ToDate))
                                {
                                    uspRequesterDT.Rows[j].Delete();
                                }
                            }
                            else
                            {
                                uspRequesterDT.Rows[j].Delete();
                            }

                        }

                    }
                    uspRequesterDT.AcceptChanges();
                    gvRecipients.DataSource = uspRequesterDT;
                    gvRecipients.DataBind();
                    //lblStep.Text = "==>" + uspSiteletDT.Rows.Count;
                    lblRecipientNumber.Text = "There are " + uspRequesterDT.Rows.Count + " recipients.";

                    //Session["by"] = "requester" + ddlRequesters.SelectedValue;
                    Session["uspRequesterDT"] = uspRequesterDT;
               // }

            }
            else if (ddlUserLevel.SelectedValue != "0")
            {
               // if ((Session["by"] == null) || (Session["by"].ToString() != "userlevel" + ddlRequesters.SelectedValue))
               // {
                    uspUserLevelTA = new dsUserTableAdapters.uspLicenseesByUserLevelTableAdapter();
                    uspUserLevelDT = new dsUser.uspLicenseesByUserLevelDataTable();
                    uspUserLevelDT = uspUserLevelTA.GetLicenseesByUserLevel(ddlUserLevel.SelectedValue);


                    for (int j = 0; j < uspUserLevelDT.Rows.Count; j++)
                    {
                        if (uspUserLevelDT.Rows[j]["UserLevel"].ToString() == "C")
                        {
                            if (!(uspUserLevelDT.Rows[j]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) > uspUserLevelDT[j].AllowedYear)
                                {
                                    uspUserLevelDT.Rows[j].Delete();
                                }
                            }
                            else
                            {
                                uspUserLevelDT.Rows[j].Delete();
                            }
                        }
                        else if (uspUserLevelDT.Rows[j]["UserLevel"].ToString() == "D")
                        {

                            if (!(uspUserLevelDT.Rows[j]["FromDate"] is DBNull) && !(uspUserLevelDT.Rows[j]["ToDate"] is DBNull))
                            {
                                if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) < uspUserLevelDT[j].FromDate) || (Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= uspUserLevelDT[j].ToDate))
                                {
                                    uspUserLevelDT.Rows[j].Delete();
                                }
                            }
                            else
                            {
                                uspUserLevelDT.Rows[j].Delete();
                            }

                        }
                    }
                    uspUserLevelDT.AcceptChanges();
                    gvRecipients.DataSource = uspUserLevelDT;
                    gvRecipients.DataBind();
                    //lblStep.Text = "==>" + uspSiteletDT.Rows.Count;
                    lblRecipientNumber.Text = "There are " + uspUserLevelDT.Rows.Count + " recipients.";

                    //Session["by"] = "userlevel" + ddlUserLevel.SelectedValue;
                    Session["uspUserLevelDT"] = uspUserLevelDT;
                //}
            }
            else if (ddlCategory.SelectedValue != "0")
            {
                //if ((Session["by"] == null) || (Session["by"].ToString() != "usercategory" + ddlRequesters.SelectedValue))
                //{
                    uspUserCategoryTA = new dsUserTableAdapters.uspLicenseesByUserCategoryTableAdapter();
                    uspUserCategoryDT = new dsUser.uspLicenseesByUserCategoryDataTable();
                    uspUserCategoryDT = uspUserCategoryTA.GetLicenseesByUserCategory(ddlCategory.SelectedValue);

                    for (int j = 0; j < uspUserCategoryDT.Rows.Count; j++)
                    {
                        if (uspUserCategoryDT.Rows[j]["UserLevel"].ToString() == "C")
                        {
                            if (!(uspUserCategoryDT.Rows[j]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) > uspUserCategoryDT[j].AllowedYear)
                                {
                                    uspUserCategoryDT.Rows[j].Delete();
                                }
                            }
                            else
                            {
                                uspUserCategoryDT.Rows[j].Delete();
                            }
                        }
                        else if (uspUserCategoryDT.Rows[j]["UserLevel"].ToString() == "D")
                        {

                            if (!(uspUserCategoryDT.Rows[j]["FromDate"] is DBNull) && !(uspUserCategoryDT.Rows[j]["ToDate"] is DBNull))
                            {
                                if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) < uspUserCategoryDT[j].FromDate) || (Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= uspUserCategoryDT[j].ToDate))
                                {
                                    uspUserCategoryDT.Rows[j].Delete();
                                }
                            }
                            else
                            {
                                uspUserCategoryDT.Rows[j].Delete();
                            }

                        }
                    }
                    uspUserCategoryDT.AcceptChanges();
                    gvRecipients.DataSource = uspUserCategoryDT;
                    gvRecipients.DataBind();
                    //lblStep.Text = "==>" + uspSiteletDT.Rows.Count;
                    lblRecipientNumber.Text = "There are " + uspUserCategoryDT.Rows.Count + " recipients.";

                    //Session["by"] = "usercategory" + ddlCategory.SelectedValue;
                    Session["uspUserCategoryDT"] = uspUserCategoryDT;

               // }
            }

            
        }
        /*
        if (Request.QueryString["step"] != null)
        {
            if (Request.QueryString["step"].ToString() == "2")//Back button pressed from step 3
            {
                lblStep.Text = "Step 2 of 4:";
                lblDescription.Text = "Verify the recipients";
                tableProfile.Visible = false;
                tableUserLevel.Visible = true;

                if ((Session["uspSiteLetDT"] != null)&&(Session["SelectedValue"] != null))
                {
                    ddlSitelet.SelectedValue = Session["SelectedValue"].ToString();
                    uspSiteletDT = (dsUser.uspLicenseesBySiteletIDDataTable)Session["uspSiteLetDT"];
                    gvRecipients.DataSource = uspSiteletDT;
                    gvRecipients.DataBind();
                    lblRecipientNumber.Text = "There are " + uspSiteletDT.Rows.Count + " recipients.";
                }
                else if ((Session["uspRequesterDT"] != null) &&(Session["SelectedValue"] != null))
                {
                    ddlRequesters.SelectedValue = Session["SelectedValue"].ToString();
                    uspRequesterDT = (dsUser.uspLicenseesByRequesterIDDataTable)Session["uspRequesterDT"];
                    gvRecipients.DataSource = uspRequesterDT;
                    gvRecipients.DataBind();
                    lblRecipientNumber.Text = "There are " + uspRequesterDT.Rows.Count + " recipients.";
                }
                else if ((Session["uspUserLevelDT"] != null)&&(Session["SelectedValue"] != null))
                {
                    ddlUserLevel.SelectedValue = Session["SelectedValue"].ToString();
                    uspUserLevelDT = (dsUser.uspLicenseesByUserLevelDataTable)Session["uspUserLevelDT"];
                    gvRecipients.DataSource = uspUserLevelDT;
                    gvRecipients.DataBind();
                    lblRecipientNumber.Text = "There are " + uspUserLevelDT.Rows.Count + " recipients.";
                }
                else if ((Session["uspUserCategoryDT"] != null)&&(Session["SelectedValue"] != null))
                {
                    ddlCategory.SelectedValue = Session["SelectedValue"].ToString();
                    uspUserCategoryDT = (dsUser.uspLicenseesByUserCategoryDataTable)Session["uspUserCategoryDT"];
                    gvRecipients.DataSource = uspUserCategoryDT;
                    gvRecipients.DataBind();
                    lblRecipientNumber.Text = "There are " + uspUserCategoryDT.Rows.Count + " recipients.";
                }
            }
        }*/
    }

    protected void btnContinue1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            
            lblStep.Text = "Step 2 of 4:";
            lblDescription.Text = "Verify the recipients";
            tableProfile.Visible = false;
            tableUserLevel.Visible = true;


        }

    }




    private void Row_Changed(object sender, DataRowChangeEventArgs e)
    {

    }



    protected void btnContinue2_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
            //licenseeDT = new dsUser.licenseeDataTable();
            //licenseeDT = licenseeTA.GetAllUsers();
            licenseeTA.ResetBlast();
            if (ddlSitelet.SelectedValue != "0")
            {
                uspSiteletDT = (dsUser.uspLicenseesBySiteletIDDataTable)Session["uspSiteletDT"];
                for (int j = 0; j < uspSiteletDT.Rows.Count; j++)
                {
                    licenseeTA.UpdateBlast(Convert.ToInt32(uspSiteletDT.Rows[j]["id"].ToString()));
                    //licenseeDT.FindByID(Convert.ToInt32(uspSiteletDT.Rows[j]["id"].ToString()))["blast"] = Convert.ToBoolean(1);

                }
                //licenseeTA.Update(licenseeDT);
            }
            else if (ddlRequesters.SelectedValue != "0")
            {
                uspRequesterDT = (dsUser.uspLicenseesByRequesterIDDataTable)Session["uspRequesterDT"];
                for (int j = 0; j < uspRequesterDT.Rows.Count; j++)
                {
                    licenseeTA.UpdateBlast(Convert.ToInt32(uspRequesterDT.Rows[j]["id"].ToString()));
                }
                licenseeTA.Dispose();
                //tableRequestor.Visible = true;
                //UpdatePanel1.UpdateMode
            }
            else if (ddlUserLevel.SelectedValue != "0")
            {
                uspUserLevelDT = (dsUser.uspLicenseesByUserLevelDataTable)Session["uspUserLevelDT"];
                for (int j = 0; j < uspUserLevelDT.Rows.Count; j++)
                {
                    licenseeTA.UpdateBlast(Convert.ToInt32(uspUserLevelDT.Rows[j]["id"].ToString()));
                }
            }
            else if (ddlCategory.SelectedValue != "0")
            {
                uspUserCategoryDT = (dsUser.uspLicenseesByUserCategoryDataTable)Session["uspUserCategoryDT"];
                for (int j = 0; j < uspUserCategoryDT.Rows.Count; j++)
                {
                    licenseeTA.UpdateBlast(Convert.ToInt32(uspUserCategoryDT.Rows[j]["id"].ToString()));
                }
            }

            Response.Redirect("emailblaster2.aspx");

            //lblStep.Text = "Step 3 of 4:";
            //bodyID.Attributes.Add("onload", "");
            //lblDescription.Text = "Provide the email subject and message";
            //tableUserLevel.Visible = false;
            //tableUserCategory.Visible = true;
            
            //btnContinue3.Attributes.Add("onclick", "return submitForm();");
        }
    }
    protected void cvUserLevel_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value != "")
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
    protected void cvFrom_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (Convert.ToDateTime(args.Value) > Convert.ToDateTime("1/1/1753"))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        catch (System.FormatException fe)
        {
            args.IsValid = false;
        }
    }
    protected void cvTo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (Convert.ToDateTime(args.Value) > Convert.ToDateTime("1/1/1753"))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        catch (System.FormatException fe)
        {
            args.IsValid = false;
        }
    }
    protected void cvUserName_ServerValidate(object source, ServerValidateEventArgs args)
    {
        dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
        dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
        legacyusersDT = legacyusersTA.GetCompanyByUserName(args.Value);
        if (legacyusersDT.Rows.Count > 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void cvUserCategory_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value != "")
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
    protected void btnContinue3_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblStep.Text = "Step 4 of 4:";
            lblDescription.Text = "Launch the email blast!";
            tableUserCategory.Visible = false;
            string strFiltered = tbSubject.Text.Replace("'", "&rsquo;");
            strFiltered = strFiltered.Replace("\"", "&quot;");
            Session["subject"] = strFiltered;
            Session["message"] = RTESafe(Request.Form["message"].ToString());
            ViewState["message"] = RTESafe(Request.Form["message"].ToString());
            //ViewState["message"] = tbMessage.Text;
            //Label1.Text = Server.HtmlDecode(RTESafe(Request.Form["message"].ToString()));
            //Response.Redirect("emailblaster2.aspx");
            Server.Transfer("emailblaster2.aspx");
        }

    }
    protected void cvRequestor_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value != "0")
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
    protected void btnContinue4_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

        }
    }
    protected void btnBack1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./");
    }
    protected void btnBack2_Click(object sender, EventArgs e)
    {
        lblStep.Text = "Step 1 of 4:";
        lblDescription.Text = "Choose the type of recipients";
        tableProfile.Visible = true;
        tableUserLevel.Visible = false;
    }
    protected void btnBack3_Click(object sender, EventArgs e)
    {
        lblStep.Text = "Step 2 of 4:";
        lblDescription.Text = "Verify the recipients";
        tableUserLevel.Visible = true;
        tableUserCategory.Visible = false;
    }


 

    protected void SaveLevelA()
    {
 
        
    }


    protected void ddlSitelet_DataBound(object sender, EventArgs e)
    {
        ListItem li = new ListItem();
        li.Text = "Select One";
        li.Value = "0";
        ddlSitelet.Items.Insert(0, li);

    }
    protected void ddlRequesters_DataBound(object sender, EventArgs e)
    {
        ddlRequesters.Items.FindByValue("0").Text = "Select One";
    }

    protected DataView SortDataTable(DataTable dataTable, bool isPageIndexChanging)
    {

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            if (GridViewSortExpression != string.Empty)
            {
                if (isPageIndexChanging)
                {
                    dataView.Sort = string.Format("{0} {1}", GridViewSortExpression, GridViewSortDirection);
                }
                else
                {
                    dataView.Sort = string.Format("{0} {1}", GridViewSortExpression, GetSortDirection());
                }
            }
            return dataView;
        }
        else
        {
            return new DataView();
        }

    }

    private string GridViewSortDirection
    {
        get { return ViewState["SortDirection"] as string ?? "ASC"; }
        set { ViewState["SortDirection"] = value; }
    }



    private string GridViewSortExpression
    {
        get { return ViewState["SortExpression"] as string ?? string.Empty; }
        set { ViewState["SortExpression"] = value; }
    }

    private string GetSortDirection()
    {
        switch (GridViewSortDirection)
        {
            case "ASC":
                GridViewSortDirection = "DESC";
                break;
            case "DESC":
                GridViewSortDirection = "ASC";
                break;
        }
        return GridViewSortDirection;
    }

    protected void gvRecipients_Sorting(object sender, GridViewSortEventArgs e)
    {
        GridViewSortExpression = e.SortExpression;
        int pageIndex = gvRecipients.PageIndex;
        gvRecipients.DataSource = SortDataTable(gvRecipients.DataSource as DataTable, false);
        gvRecipients.DataBind();
        gvRecipients.PageIndex = pageIndex;
    }

    protected void UpdatePanel1_Load(object sender, EventArgs e)
    {
        /*
        int iRemaining = 0;
        SqlCommand cmd = null;
        SqlConnection con = null;
        try
        {
            //if (Session["cmd"] == null)
            //{
            //    cmd = (SqlCommand)Session["cmd"];
            //}
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
            //}

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
        
        if (Session["remaining"] != null)
        {
            lblResult.Text = Session["remaining"].ToString();
        }
        else
        {
            lblResult.Text = "Oh no..";
        }
        */
         //lblResult.Text = "It is now " + DateTime.Now;

        //lblResult.Text = "Remaining number of recipients: " + iRemaining;

    }
    protected void cvType_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if ((ddlSitelet.SelectedValue == "0")&&
            (ddlRequesters.SelectedValue == "0")&&
            (ddlUserLevel.SelectedValue == "0")&&
            (ddlCategory.SelectedValue == "0"))
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
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
