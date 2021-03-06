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

public partial class EditUser : System.Web.UI.Page
{
    dsUserTableAdapters.licenseeTableAdapter licenseeTA;
    dsUser.licenseeDataTable licenseeDT;
    dsUser.licenseeRow licenseeR;

    int iPkey = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)//Protection required ALL edits!
        {
            rblUserLevel.Attributes.Add("onclick", "CheckUserLevel()");

            if (rblUserLevel.SelectedValue == "D")//When Level D enforce the required field validator to the date range
            {
                bodyID.Attributes.Add("onload", "document.getElementById(\"dateLayer\").style.visibility=\"visible\";");
                rfvFrom.Enabled = true;
                rfvTo.Enabled = true;
                cvFrom.Enabled = true;
                cvTo.Enabled = true;
                cpvDateRange.Enabled = true;
                Session["DateWasDisplayed"] = "yes";
            }
            else if (Session["DateWasDisplayed"] != null)//Choose "D" --> Change it to others --> w/o this code the date range fields are displayed
            {
                bodyID.Attributes.Add("onload", "document.getElementById(\"dateLayer\").style.visibility=\"hidden\";");
                rfvFrom.Enabled = false;
                rfvTo.Enabled = false;
                cvFrom.Enabled = false;
                cvTo.Enabled = false;
                cpvDateRange.Enabled = false;
                Session["DateWasDisplayed"] = null;
            }

            if (!Page.IsPostBack)
            {

                licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
                licenseeDT = new dsUser.licenseeDataTable();
                licenseeDT = licenseeTA.GetUserByID(Convert.ToInt32(Request.QueryString["id"].ToString()));
                Session["licenseeDT"] = licenseeDT;




                //Populate the existing data
                if (!(licenseeDT.Rows[0]["FirstName"] is DBNull))
                {
                    tbFirstName.Text = licenseeDT[0].FirstName;
                }

                if (!(licenseeDT.Rows[0]["MI"] is DBNull))
                {
                    tbMI.Text = licenseeDT[0].MI;
                }

                if (!(licenseeDT.Rows[0]["LastName"] is DBNull))
                {
                    tbLastName.Text = licenseeDT[0].LastName;
                }


                if (!(licenseeDT.Rows[0]["Email"] is DBNull))
                {
                    tbEmail.Text = licenseeDT[0].Email;
                }

                if (!(licenseeDT.Rows[0]["cid"] is DBNull))
                {
                    dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
                    dsCompany.legacyusersDataTable legacyusersDT = legacyusersTA.GetAllCompanies();
                    ddlCompany.DataSource = legacyusersDT;
                    ddlCompany.DataTextField = "Company";
                    ddlCompany.DataValueField = "ID";
                    ddlCompany.SelectedValue = licenseeDT.Rows[0]["cid"].ToString();
                    ddlCompany.DataBind();
                }

                if (!(licenseeDT.Rows[0]["Contract"] is DBNull))
                {
                    tbContract.Text = licenseeDT[0].Contract;
                }

                if (!(licenseeDT.Rows[0]["Address1"] is DBNull))
                {
                    tbAddress1.Text = licenseeDT[0].Address1;
                }

                if (!(licenseeDT.Rows[0]["Address2"] is DBNull))
                {
                    tbAddress2.Text = licenseeDT[0].Address2;
                }

                if (!(licenseeDT.Rows[0]["City"] is DBNull))
                {
                    tbCity.Text = licenseeDT[0].City;
                }

                if (!(licenseeDT.Rows[0]["State"] is DBNull))
                {
                    bool bProvince = true;
                    foreach (ListItem l in ddlState.Items)
                    {
                        if (licenseeDT[0].State == l.Value)
                        {
                            l.Selected = true;
                            bProvince = false;
                        }
                    }
                    if (bProvince)
                    {
                        tbProvince.Text = licenseeDT[0].State;
                    }
                }



                if (!(licenseeDT.Rows[0]["Zip"] is DBNull))
                {
                    tbZip.Text = licenseeDT[0].Zip;
                }

                if (!(licenseeDT.Rows[0]["Phone"] is DBNull))
                {
                    tbPhone.Text = licenseeDT[0].Phone;
                }

                if (!(licenseeDT.Rows[0]["Fax"] is DBNull))
                {
                    tbFax.Text = licenseeDT[0].Fax;
                }

                if (!(licenseeDT.Rows[0]["Password"] is DBNull))
                {
                    tbPassword.Text = licenseeDT[0].Password;
                }

            }
        }
        else//Take care of the deviants
        {
            Response.Redirect("./");
        }

    }
    protected void ddlCountry_DataBound(object sender, EventArgs e)
    {
        if (!(licenseeDT.Rows[0]["Country"] is DBNull))
        {
            try
            {
                ddlCountry.Items.FindByValue(licenseeDT[0].Country).Selected = true;
            }
            catch (System.Exception ex)
            {
                //Do nothing
            }
        }
        else
        {
            ddlCountry.SelectedIndex = 1;
        }
    }
    protected void btnContinue1_Click(object sender, EventArgs e)
    {
        
        if (Session["licenseeDT"] != null)//At first arrival, create the session as needed.
        {
            if (Page.IsValid)
            {
                licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);

                licenseeDT[0].FirstName = tbFirstName.Text;
                licenseeDT[0].MI = tbMI.Text;
                licenseeDT[0].LastName = tbLastName.Text;
                licenseeDT[0].Email = tbEmail.Text;
                licenseeDT[0].Contract = tbContract.Text;
                licenseeDT[0].Address1 = tbAddress1.Text;
                licenseeDT[0].Address2 = tbAddress2.Text;
                licenseeDT[0].City = tbCity.Text;

                if (ddlState.SelectedIndex > 0)
                {
                    licenseeDT[0].State = ddlState.SelectedValue;
                }
                else
                {
                    licenseeDT[0].State = tbProvince.Text;
                }

                licenseeDT[0].Zip = tbZip.Text;
                licenseeDT[0].Country = ddlCountry.SelectedValue;
                licenseeDT[0].Phone = tbPhone.Text;
                licenseeDT[0].Fax = tbFax.Text;
                licenseeDT[0].Password = tbPassword.Text;

                //Populate the user level using the session
                if (!(licenseeDT.Rows[0]["UserLevel"] is DBNull))
                {
                    var userLevel = "";
                    dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
                    dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
                    try
                    {
                        if (licenseeDT.Rows[0]["cid"].ToString() != ddlCompany.SelectedValue)//A different company was selected. Get requestor from the company data
                        {

                            legacyusersDT = legacyusersTA.GetCompanyByID(int.Parse(ddlCompany.SelectedValue));
                            if (!(legacyusersDT.Rows[0]["UserLevel"] is DBNull))
                            {
                                userLevel = legacyusersDT[0].UserLevel;
                            }
                        }
                        else
                        {
                            userLevel = licenseeDT[0].UserLevel;
                        }
		            }
                    catch (Exception ex){}
                    rblUserLevel.ClearSelection();//Without this can't change it for company dropdown feature coming back from step 2
                    rblUserLevel.Items.FindByValue(userLevel).Selected = true;

                    if (userLevel == "D")//When Level D enforce the required field validator to the date range
                    {
                        bodyID.Attributes.Add("onload", "document.getElementById(\"dateLayer\").style.visibility=\"visible\";");
                        if (licenseeDT.Rows[0]["cid"].ToString() != ddlCompany.SelectedValue)//A different company was selected. Get requestor from the company data
                        {
                            if (!(legacyusersDT.Rows[0]["FromDate"] is DBNull) && !(legacyusersDT.Rows[0]["ToDate"] is DBNull))
                            {
                                calendarPopupFrom.SelectedDate = legacyusersDT[0].FromDate;
                                calendarPopupTo.SelectedDate = legacyusersDT[0].ToDate;
                            }
                        }
                        else
                        {
                            if (!(licenseeDT.Rows[0]["FromDate"] is DBNull) && !(licenseeDT.Rows[0]["ToDate"] is DBNull))
                            {
                                calendarPopupFrom.SelectedDate = licenseeDT[0].FromDate;
                                calendarPopupTo.SelectedDate = licenseeDT[0].ToDate;
                            }
                        }

                        rfvFrom.Enabled = true;
                        rfvTo.Enabled = true;
                        cvFrom.Enabled = true;
                        cvTo.Enabled = true;
                        cpvDateRange.Enabled = true;
                        Session["DateWasDisplayed"] = "yes";
                    }
                    else
                    {
                        bodyID.Attributes.Add("onload", "document.getElementById(\"dateLayer\").style.visibility=\"hidden\";");
                        Session["DateWasDisplayed"] = null;
                    }
                }


                Session["licenseeDT"] = licenseeDT;

                lblStep.Text = "Step 2 of 5:";
                lblDescription.Text = "Choose a user level";
                tableProfile.Visible = false;
                cvMessage.Enabled = false;
                tableUserLevel.Visible = true;



            }
        }
        else
        {
            Response.Redirect("./");
        }
        


    }

    protected void cvState_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if ((ddlState.SelectedIndex == 0) && (tbProvince.Text.Length == 0))
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void cvCountry_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (ddlCountry.SelectedIndex == 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }


    private void Row_Changed(object sender, DataRowChangeEventArgs e)
    {

        //lblDescription.Text = e.Row["id"].ToString() + "!!!!!!!!!!!";
        //Console.WriteLine("Row_Changed Event: name={0}; action={1}",
        //  e.Row["name"], e.Action);

        iPkey = Convert.ToInt32(e.Row["id"].ToString());
    }



    protected void btnContinue2_Click(object sender, EventArgs e)
    {
        if (Session["licenseeDT"] != null)
        {
            if (Page.IsValid)
            {
                licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);

                licenseeDT[0].UserLevel = rblUserLevel.SelectedValue;
                if (rblUserLevel.SelectedValue == "D")
                {
                    licenseeDT[0].FromDate = Convert.ToDateTime(calendarPopupFrom.SelectedDate.ToString());
                    licenseeDT[0].ToDate = Convert.ToDateTime(calendarPopupTo.SelectedDate.ToString());
                }
                else if (rblUserLevel.SelectedValue == "C")
                {
                    licenseeDT[0].AllowedYear = Convert.ToDateTime("12/31/" + DateTime.Now.Year);
                    licenseeDT.Rows[0]["FromDate"] = DBNull.Value;
                    licenseeDT.Rows[0]["ToDate"] = DBNull.Value;
                }
                else
                {
                    licenseeDT.Rows[0]["FromDate"] = DBNull.Value;
                    licenseeDT.Rows[0]["ToDate"] = DBNull.Value;
                    licenseeDT.Rows[0]["AllowedYear"] = DBNull.Value;

                }

                if (licenseeDT.Rows[0]["cid"].ToString() != ddlCompany.SelectedValue)//A different company was selected. Get requestor from the company data
                {
                    dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
                    dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
                    legacyusersDT = legacyusersTA.GetCompanyByID(int.Parse(ddlCompany.SelectedValue));
                    if (!(legacyusersDT.Rows[0]["UserCategory"] is DBNull))
                    {
                        rblUserCategory.ClearSelection();
                        rblUserCategory.Items.FindByValue(legacyusersDT[0].UserCategory).Selected = true;
                        bodyID.Attributes.Add("onload", "");
                        rblUserCategory.Attributes.Add("onclick", "");
                        lblStep.Text = "Step 3 of 5:";
                    }
                    else
                    {
                        lblStep.Text = "Step 3 of 5:";
                    }
                }
                else
                {
                    //Populate the user category with the session
                    if (!(licenseeDT.Rows[0]["UserCategory"] is DBNull))
                    {
                        rblUserCategory.ClearSelection();
                        rblUserCategory.Items.FindByValue(licenseeDT[0].UserCategory).Selected = true;
                        //Allow sitelet selection to level "A" 091408
                        //Remove UserLevel Requestor logic 050508
                        //if (licenseeDT[0].UserLevel == "A")
                        //{
                        //    lblStep.Text = "Step 3 of 4:";
                        //    bodyID.Attributes.Add("onload", "ChangeStep()");
                        //    rblUserCategory.Attributes.Add("onclick", "ChangeStep()");
                        //}
                        //else
                        //{
                        bodyID.Attributes.Add("onload", "");
                        rblUserCategory.Attributes.Add("onclick", "");
                        lblStep.Text = "Step 3 of 5:";
                        //}
                    }
                    else
                    {
                        lblStep.Text = "Step 3 of 5:";
                    }
                }


                Session["licenseeDT"] = licenseeDT;


                lblDescription.Text = "Choose a user category";
                tableUserLevel.Visible = false;
                tableUserCategory.Visible = true;

                //Let's populate the existing data



                //Button1.Text = "Ready to SAVE!!!!";
                //Response.Redirect("http://google.com");

            }
        }
        else
        {
            Response.Redirect("./");
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
        /*
        if (Session["licenseeDT"] != null)
        {
            licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);
            if (licenseeDT[0].UserName != args.Value)
            {
                dsUserTableAdapters.licenseeTableAdapter licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
                dsUser.licenseeDataTable licenseeDTCheck = new dsUser.licenseeDataTable();
                licenseeDTCheck = licenseeTA.GetCompanyByUserName(args.Value);
                if (licenseeDTCheck.Rows.Count > 0)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }
         */
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
        if (Session["licenseeDT"] != null)
        {
            if (Page.IsValid)
            {
                licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);
                licenseeDT[0].UserCategory = rblUserCategory.SelectedValue;
                //Allow sitelet selection to level "A" 091408
                //Remove UserLevel Requestor logic 050508
                //if (licenseeDT[0].UserLevel == "A")
                //{
                //    lblStep.Text = "Step 4 of 4:";
                //    lblDescription.Text = "Choose a MLB Contact";
                //    tableUserCategory.Visible = false;
                //    tableRequestor.Visible = true;
                //}
                //else
                //{

                    lblStep.Text = "Step 4 of 5:";
                    lblDescription.Text = "Choose a MLB Contact";
                    tableUserCategory.Visible = false;
                    tableRequestor.Visible = true;
                //}
                Session["licenseeDT"] = licenseeDT;

                ddlRequestor.DataBind();

            }
        }
        else
        {
            Response.Redirect("./");
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
        if (Session["licenseeDT"] != null)
        {
            if (Page.IsValid)
            {

                licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);

                licenseeDT[0].RequestorID = Convert.ToInt32(ddlRequestor.SelectedValue.ToString());

                //Allow sitelet selection to level "A" 091408
                
                //if (licenseeDT[0].UserLevel == "A")
                //{
                //    Session["licenseeDT"] = licenseeDT;
                //    SaveLevelA(true);
                //}
                //else
                //{
                    lblStep.Text = "Step 5 of 5:";
                    lblDescription.Text = "Give permissions to '" + licenseeDT[0].FirstName + " " + licenseeDT[0].LastName + "' to access the following sitelet(s)";

                    tableRequestor.Visible = false;
                    tablesitlet.Visible = true;

                    Session["licenseeDT"] = licenseeDT;
                //}


                cblSitelet.DataBind();

            }
        }
        else
        {
            Response.Redirect("./");
        }
    }
    protected void btnContinue5_Click(object sender, EventArgs e)
    {
        
        if (Session["licenseeDT"] != null)
        {
            if (Page.IsValid)
            {
                licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
                licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);
                licenseeDT.Rows[0]["cid"] = ddlCompany.SelectedValue;
                //Let's update sitelets
                dsUserTableAdapters.licensee2siteletsTableAdapter licensee2siteletsTA = new dsUserTableAdapters.licensee2siteletsTableAdapter();
                //Delete the existing one first!
                licensee2siteletsTA.DeleteByUID(licenseeDT[0].ID);

                dsUser.licensee2siteletsDataTable licensee2siteletsDT = new dsUser.licensee2siteletsDataTable();
                licensee2siteletsDT = licensee2siteletsTA.GetAllu2s();

                foreach (ListItem li in cblSitelet.Items)
                {
                    if (li.Selected)
                    {
                        dsUser.licensee2siteletsRow licensee2siteletR = licensee2siteletsDT.Newlicensee2siteletsRow();

                        licensee2siteletR.uid = licenseeDT[0].ID;
                        licensee2siteletR.sid = Convert.ToInt32(li.Value);
                        licensee2siteletsDT.Addlicensee2siteletsRow(licensee2siteletR);
                        licensee2siteletsTA.Update(licensee2siteletsDT);

                    }
                }


                licenseeTA.Update(licenseeDT);

                lblStep.Visible = false;
                lblDescription.Visible = false;

                tablesitlet.Visible = false;
                tableFinished.Visible = true;

            }

        }
        else
        {
            Response.Redirect("./");
        }
        
    }
    protected void cvSitelet_ServerValidate(object source, ServerValidateEventArgs args)
    {
        bool bSelected = false;
        foreach (ListItem li in cblSitelet.Items)
        {
            if (li.Selected)
            {
                bSelected = true;
                break;
            }
        }
        args.IsValid = bSelected;
    }

    protected void btnBack2_Click(object sender, EventArgs e)
    {
        lblStep.Text = "Step 1 of 5:";
        lblDescription.Text = "Edit the user profile information";
        tableProfile.Visible = true;
        cvMessage.Enabled = true;
        tableUserLevel.Visible = false;
        ltrBack.Text = "<input type=\"button\" name=\"btnBack\" value=\"<<< Go Back\" onclick=\"window.location.replace('./UserMgr.aspx')\"/>";

        if (Session["licenseeDT"] == null)
        {
            licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
            licenseeDT = new dsUser.licenseeDataTable();
            licenseeDT = licenseeTA.GetUserByID(Convert.ToInt32(Request.QueryString["id"].ToString()));
            Session["licenseeDT"] = licenseeDT;
        }
        else
        {
            licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);
        }



        //Populate the existing data
        if (!(licenseeDT.Rows[0]["FirstName"] is DBNull))
        {
            tbFirstName.Text = licenseeDT[0].FirstName;
        }

        if (!(licenseeDT.Rows[0]["MI"] is DBNull))
        {
            tbMI.Text = licenseeDT[0].MI;
        }

        if (!(licenseeDT.Rows[0]["LastName"] is DBNull))
        {
            tbLastName.Text = licenseeDT[0].LastName;
        }


        if (!(licenseeDT.Rows[0]["Email"] is DBNull))
        {
            tbEmail.Text = licenseeDT[0].Email;
        }

        if (!(licenseeDT.Rows[0]["Contract"] is DBNull))
        {
            tbContract.Text = licenseeDT[0].Contract;
        }

        if (!(licenseeDT.Rows[0]["Address1"] is DBNull))
        {
            tbAddress1.Text = licenseeDT[0].Address1;
        }

        if (!(licenseeDT.Rows[0]["Address2"] is DBNull))
        {
            tbAddress2.Text = licenseeDT[0].Address2;
        }

        if (!(licenseeDT.Rows[0]["City"] is DBNull))
        {
            tbCity.Text = licenseeDT[0].City;
        }

        if (!(licenseeDT.Rows[0]["State"] is DBNull))
        {
            bool bProvince = true;
            foreach (ListItem l in ddlState.Items)
            {
                if (licenseeDT[0].State == l.Value)
                {
                    l.Selected = true;
                    bProvince = false;
                }
            }
            if (bProvince)
            {
                tbProvince.Text = licenseeDT[0].State;
            }
        }



        if (!(licenseeDT.Rows[0]["Zip"] is DBNull))
        {
            tbZip.Text = licenseeDT[0].Zip;
        }

        if (!(licenseeDT.Rows[0]["Phone"] is DBNull))
        {
            tbPhone.Text = licenseeDT[0].Phone;
        }

        if (!(licenseeDT.Rows[0]["Fax"] is DBNull))
        {
            tbFax.Text = licenseeDT[0].Fax;
        }

        if (!(licenseeDT.Rows[0]["Password"] is DBNull))
        {
            tbPassword.Text = licenseeDT[0].Password;
        }
    }
    protected void btnBack3_Click(object sender, EventArgs e)
    {
        lblStep.Text = "Step 2 of 5:";
        lblDescription.Text = "Choose a user level";
        tableUserLevel.Visible = true;
        tableUserCategory.Visible = false;
    }
    protected void btnBack4_Click(object sender, EventArgs e)
    {
        if (Session["licenseeDT"] != null)
        {
            //Allow sitelet selection to level "A" 091408
            //slicenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);
            //Remove UserLevel Requestor logic 050508
            //if (licenseeDT[0].UserLevel == "A")
            //{
            //    lblStep.Text = "Step 3 of 4:";
            //    bodyID.Attributes.Add("onload", "ChangeStep();");
            //    rblUserCategory.Attributes.Add("onclick", "ChangeStep()");
            //}
            //else
            //{
                bodyID.Attributes.Add("onload", "");
                rblUserCategory.Attributes.Add("onclick", "");
                lblStep.Text = "Step 3 of 5:";
            //}
        }
        else
        {
            Response.Redirect("./");
        }


        lblDescription.Text = "Choose a user category";
        tableUserCategory.Visible = true;
        tableRequestor.Visible = false;
    }
    protected void btnBack5_Click(object sender, EventArgs e)
    {
        if (Session["licenseeDT"] != null)
        {
            licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);
            //Never reaching code
            //if (licenseeDT[0].UserLevel == "A")
            //{
            //    lblStep.Text = "Step 3 of 4:";
            //    lblDescription.Text = "Choose a user category";
            //    tableUserCategory.Visible = true;
            //    tablesitlet.Visible = false;
            //}
            //else
            //{
                lblStep.Text = "Step 4 of 5:";
                lblDescription.Text = "Choose a MLB Contact";
                tableRequestor.Visible = true;
                tablesitlet.Visible = false;
            //}
        }
        else
        {
            Response.Redirect("./");
        }

    }


    protected void cblSitelet_DataBound(object sender, EventArgs e)
    {

        if (Session["licenseeDT"] != null)
        {

            if (licenseeDT.Rows[0]["cid"].ToString() != ddlCompany.SelectedValue)//A different company was selected. Get requestor from the company data
            {
                dsCompanyTableAdapters.legacyusers2siteletsTableAdapter legacyusers2siteletsTA = new dsCompanyTableAdapters.legacyusers2siteletsTableAdapter();
                dsCompany.legacyusers2siteletsDataTable legacyusers2siteletsDT = new dsCompany.legacyusers2siteletsDataTable();
                legacyusers2siteletsDT = legacyusers2siteletsTA.Getc2sByCID(int.Parse(ddlCompany.SelectedValue));

                for (int i = 0; i < legacyusers2siteletsDT.Rows.Count; i++)
                {
                    foreach (ListItem li in cblSitelet.Items)
                    {
                        if (li.Value == legacyusers2siteletsDT[i].sid.ToString())
                        {
                            li.Selected = true;
                        }
                    }
                }
            }
            else
            {
                licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);
                dsUserTableAdapters.licensee2siteletsTableAdapter licensee2siteletsTA = new dsUserTableAdapters.licensee2siteletsTableAdapter();
                dsUser.licensee2siteletsDataTable licensee2siteletsDT = new dsUser.licensee2siteletsDataTable();
                licensee2siteletsDT = licensee2siteletsTA.Getu2sByUID(licenseeDT[0].ID);

                for (int i = 0; i < licensee2siteletsDT.Rows.Count; i++)
                {
                    foreach (ListItem li in cblSitelet.Items)
                    {
                        if (li.Value == licensee2siteletsDT[i].sid.ToString())
                        {
                            li.Selected = true;
                        }
                    }
                }
            }
        }

    }

    protected void ddlRequestor_DataBound(object sender, EventArgs e)
    {
        if (Session["licenseeDT"] != null)
        {
            licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);

            if (licenseeDT.Rows[0]["cid"].ToString() != ddlCompany.SelectedValue)//A different company was selected. Get requestor from the company data
            {
                dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
                dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
                legacyusersDT = legacyusersTA.GetCompanyByID(int.Parse(ddlCompany.SelectedValue));
                if (!(legacyusersDT.Rows[0]["RequestorID"] is DBNull))
                {
                    ddlRequestor.Items.FindByValue(legacyusersDT[0].RequestorID.ToString()).Selected = true;
                }
            }
            else
            {
                //Populate the requstor with the session
                if (!(licenseeDT.Rows[0]["RequestorID"] is DBNull))
                {
                    ddlRequestor.Items.FindByValue(licenseeDT[0].RequestorID.ToString()).Selected = true;
                }
            }
        }
        ddlRequestor.Items.FindByValue("0").Text = "Select One";
    }

    protected void SaveLevelA(bool bLicensee)
    {
        if (Session["licenseeDT"] != null)
        {
            licenseeDT = (dsUser.licenseeDataTable)(Session["licenseeDT"]);
            if (!bLicensee)
            {
                licenseeDT.Rows[0]["RequestorID"] = DBNull.Value;
            }
            licenseeDT.Rows[0]["FromDate"] = DBNull.Value;
            licenseeDT.Rows[0]["ToDate"] = DBNull.Value;
            licenseeDT.Rows[0]["AllowedYear"] = DBNull.Value;
            //tablesitlet.Visible = true;

            licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();

            licenseeTA.Update(licenseeDT);

            //Let's update sitelets
            dsUserTableAdapters.licensee2siteletsTableAdapter licensee2siteletsTA = new dsUserTableAdapters.licensee2siteletsTableAdapter();
            //Delete the existing one first!
            licensee2siteletsTA.DeleteByUID(licenseeDT[0].ID);

            //Get all availaible sitelets
            dsCompanyTableAdapters.siteletsTableAdapter siteletsTA = new dsCompanyTableAdapters.siteletsTableAdapter();
            dsCompany.siteletsDataTable siteletsDT = new dsCompany.siteletsDataTable();
            siteletsDT = siteletsTA.GetAllSitelets();




            dsUser.licensee2siteletsDataTable licensee2siteletsDT = new dsUser.licensee2siteletsDataTable();
            licensee2siteletsDT = licensee2siteletsTA.GetAllu2s();

            for (int i = 0; i < siteletsDT.Rows.Count; i++)
            {

                dsUser.licensee2siteletsRow licensee2siteletR = licensee2siteletsDT.Newlicensee2siteletsRow();

                licensee2siteletR.uid = licenseeDT[0].ID;
                licensee2siteletR.sid = Convert.ToInt32(siteletsDT[i].id);
                licensee2siteletsDT.Addlicensee2siteletsRow(licensee2siteletR);
                licensee2siteletsTA.Update(licensee2siteletsDT);


            }




            lblStep.Visible = false;
            lblDescription.Visible = false;
            tableRequestor.Visible = false;
            tableUserCategory.Visible = false;
            tableFinished.Visible = true;
        }

    }
}
