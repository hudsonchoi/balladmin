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

public partial class AddCompany : System.Web.UI.Page
{
    dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA;
    dsCompany.legacyusersDataTable legacyusersDT;
    dsCompany.legacyusersRow legacyusersR;
    int iPkey = 0;

    protected void Page_Load(object sender, EventArgs e)
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
        else if (Session["DateWasDisplayed"] != null)
        {
            bodyID.Attributes.Add("onload", "document.getElementById(\"dateLayer\").style.visibility=\"hidden\";");
            rfvFrom.Enabled = false;
            rfvTo.Enabled = false;
            cvFrom.Enabled = false;
            cvTo.Enabled = false;
            cpvDateRange.Enabled = false;
            Session["DateWasDisplayed"] = null;
        }

    }
    protected void ddlCountry_DataBound(object sender, EventArgs e)
    {
        ddlCountry.SelectedIndex = 1;
        /*
         *     
            protected void ddlCountry_DataBound(object sender, EventArgs e)
            {
                if (myShopper.BcountryISO != null)
                {
                    ddlCountry.Items.FindByValue(myShopper.BcountryISO.ToString()).Selected = true;
                }
                else
                {
                    ddlCountry.SelectedIndex = 1;
                }

            }
         */
    }
    protected void btnContinue1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
            legacyusersDT = legacyusersTA.GetAllCompanies();
            legacyusersR = legacyusersDT.NewlegacyusersRow();

            legacyusersR.Company = tbCompany.Text;
            legacyusersR.Address1 = tbAddress1.Text;
            legacyusersR.Address2 = tbAddress2.Text;
            legacyusersR.City = tbCity.Text;

            if (ddlState.SelectedIndex > 0)
            {
                legacyusersR.State = ddlState.SelectedValue;
            }
            else
            {
                legacyusersR.State = tbProvince.Text;
            }

            legacyusersR.Zip = tbZip.Text;
            legacyusersR.Country = ddlCountry.SelectedValue;
            legacyusersR.Phone = tbPhone.Text;
            //legacyusersR.Email = tbEmail.Text;
            legacyusersR.Contract = tbContract.Text;

            string companyNoSpace = tbCompany.Text.ToLower().Replace(" ", "");

            if (companyNoSpace.Length >= 5)
            {
                legacyusersR.UserName = companyNoSpace.Substring(0, 5) + "_register";
            }
            else
            {
                legacyusersR.UserName = companyNoSpace + "_register";
            }
            
            legacyusersR.Password = RandomPassword.Generate(7);

            //legacyusersR.UserName = tbUserName.Text;
            //legacyusersR.Password = tbPassword.Text;


            legacyusersR.Mlb = false;
            legacyusersR.Minor = false;
            legacyusersR.Coop = false;
            legacyusersR.Alls = false;
            legacyusersR.World = false;
            legacyusersR.Mascot = false;
            legacyusersR.Spring = false;
            legacyusersR.Trend = false;
            legacyusersR.Minorleaguestyleguide = false;
            legacyusersR.Super = false;
            legacyusersR.Mlb2003 = false;
            legacyusersR.Creative = false;
            legacyusersR.Alls2007 = false;

            legacyusersR.BulkReg = false;

            Session["legacyusersTA"] = legacyusersTA;
            Session["legacyusersDT"] = legacyusersDT;
            Session["legacyusersR"] = legacyusersR;

            lblStep.Text = "Step 2 of 5:";
            lblDescription.Text = "Choose a user level";
            tableProfile.Visible = false;
            cvMessage.Enabled = false;
            tableUserLevel.Visible = true;
            

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
        if (Page.IsValid)
        {
            if (Session["legacyusersR"] != null)
            {
                //legacyusersTA = (dsCompanyTableAdapters.legacyusersTableAdapter)(Session["legacyusersTA"]);
                //legacyusersDT = (dsCompany.legacyusersDataTable)(Session["legacyusersDT"]);
                legacyusersR = (dsCompany.legacyusersRow)(Session["legacyusersR"]);
                legacyusersR.UserLevel = rblUserLevel.SelectedValue;
                if (rblUserLevel.SelectedValue == "D")
                {
                    legacyusersR.FromDate = Convert.ToDateTime(calendarPopupFrom.SelectedDate.ToString());
                    legacyusersR.ToDate = Convert.ToDateTime(calendarPopupTo.SelectedDate.ToString());
                }
                else if (rblUserLevel.SelectedValue == "C")
                {
                    legacyusersR.AllowedYear = Convert.ToDateTime("12/31/" + DateTime.Now.Year);
                }
                //Session["legacyusersTA"] = legacyusersTA;
                //Session["legacyusersDT"] = legacyusersDT;
                Session["legacyusersR"] = legacyusersR;

                //Provide sitelets to "A" users 091308
                //if (legacyusersR.UserLevel == "A")
                //{
                //    lblStep.Text = "Step 3 of 4:";
                //    bodyID.Attributes.Add("onload", "ChangeStep()");
                //    rblUserCategory.Attributes.Add("onclick", "ChangeStep()");
                //}
                //else
                //{
                    lblStep.Text = "Step 3 of 5:";
                    bodyID.Attributes.Add("onload", "");
                    rblUserCategory.Attributes.Add("onclick", "");
                //}
                lblDescription.Text = "Choose a user category";
                tableUserLevel.Visible = false;
                tableUserCategory.Visible = true;



                //Button1.Text = "Ready to SAVE!!!!";
                //Response.Redirect("http://google.com");

            }
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
    protected void cvCompany_ServerValidate(object source, ServerValidateEventArgs args)
    {
        dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
        dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
        legacyusersDT = legacyusersTA.GetCompanyByName(args.Value);
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
            if (Session["legacyusersR"] != null)
            {
                //legacyusersTA = (dsCompanyTableAdapters.legacyusersTableAdapter)(Session["legacyusersTA"]);
                //legacyusersDT = (dsCompany.legacyusersDataTable)(Session["legacyusersDT"]);
                legacyusersR = (dsCompany.legacyusersRow)(Session["legacyusersR"]);

                legacyusersR.UserCategory = rblUserCategory.SelectedValue;
                
                
                //Session["legacyusersTA"] = legacyusersTA;
                //Session["legacyusersDT"] = legacyusersDT;
                Session["legacyusersR"] = legacyusersR;

                //if (legacyusersR.UserLevel == "A")
                //{
                    //lblStep.Text = "Step 4 of 4:";
                    //lblDescription.Text = "Give permissions to '" + legacyusersR.Company + "' to access the following sitelet(s)";
                    //tableUserCategory.Visible = false;???

                        //lblStep.Text = "Step 4 of 4:";
                        //lblDescription.Text = "Choose a MLB Contact";
                        //tableUserCategory.Visible = false;
                        //tableRequestor.Visible = true;
      
                //}
                //else
                //{
                    lblStep.Text = "Step 4 of 5:";
                    lblDescription.Text = "Choose a MLB contact";
                    tableUserCategory.Visible = false;
                    tableRequestor.Visible = true;
                //}

                



                //Button1.Text = "Ready to SAVE!!!!";
                //Response.Redirect("http://google.com");

            }
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
            if (Session["legacyusersR"] != null)
            {
                //legacyusersTA = (dsCompanyTableAdapters.legacyusersTableAdapter)(Session["legacyusersTA"]);
                //legacyusersDT = (dsCompany.legacyusersDataTable)(Session["legacyusersDT"]);
                legacyusersR = (dsCompany.legacyusersRow)(Session["legacyusersR"]);

                legacyusersR.RequestorID = Convert.ToInt32(ddlRequestor.SelectedValue.ToString());
                Session["legacyusersR"] = legacyusersR;

                //if (legacyusersR.UserLevel == "A")
                //{
                 //   SaveLevelA();
                //}
                //else
                //{
                    lblStep.Text = "Step 5 of 5:";
                    lblDescription.Text = "Give permissions to '" + legacyusersR.Company + "' to access the following sitelet(s)";

                    tableRequestor.Visible = false;
                    tablesitlet.Visible = true;
                //}
                    //Needed to select all sitelets by default
                    cblSitelet.DataBind();
                    
                //Session["legacyusersTA"] = legacyusersTA;
                //Session["legacyusersDT"] = legacyusersDT;
                



                //Button1.Text = "Ready to SAVE!!!!";
                //Response.Redirect("http://google.com");

            }
        }
    }
    protected void btnContinue5_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if ((Session["legacyusersTA"] != null) && (Session["legacyusersDT"] != null) && (Session["legacyusersR"] != null))
            {
                legacyusersTA = (dsCompanyTableAdapters.legacyusersTableAdapter)(Session["legacyusersTA"]);
                legacyusersDT = (dsCompany.legacyusersDataTable)(Session["legacyusersDT"]);
                legacyusersR = (dsCompany.legacyusersRow)(Session["legacyusersR"]);

                //dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
                //int iPkey = Convert.ToInt32(legacyusersTA.InsertQuery(legacyusersR.UserName, legacyusersR.Password, legacyusersR.Company, true, true, true, true, true, true, legacyusersR.Email, false, legacyusersR.Contract, legacyusersR.Address1, legacyusersR.Address2, legacyusersR.City, legacyusersR.State, legacyusersR.Zip, legacyusersR.Phone, legacyusersR.Country, true, true, true, true, true, true, true, legacyusersR.UserLevel, legacyusersR.UserCategory, legacyusersR.RequestorID, legacyusersR.FromDate, legacyusersR.ToDate, legacyusersR.AllowedYear));
                //string strBefore = legacyusersDT.Rows.Count.ToString();
                legacyusersR.RegistrationDate = DateTime.Now;

                legacyusersDT.AddlegacyusersRow(legacyusersR);
                legacyusersDT.RowChanged += new DataRowChangeEventHandler(Row_Changed);

                //string strAfter = legacyusersDT.Rows.Count.ToString();
                legacyusersTA.Update(legacyusersDT);

                //Let's add sitelets
                dsCompanyTableAdapters.legacyusers2siteletsTableAdapter legacyusers2siteletsTA = new dsCompanyTableAdapters.legacyusers2siteletsTableAdapter();
                dsCompany.legacyusers2siteletsDataTable legacyusers2siteletsDT = new dsCompany.legacyusers2siteletsDataTable();
                legacyusers2siteletsDT = legacyusers2siteletsTA.GetAllc2s();

                foreach (ListItem li in cblSitelet.Items)
                {
                    if (li.Selected)
                    {
                        dsCompany.legacyusers2siteletsRow legacyusers2siteletsR = legacyusers2siteletsDT.Newlegacyusers2siteletsRow();
                        legacyusers2siteletsR.cid = iPkey;
                        legacyusers2siteletsR.sid = Convert.ToInt32(li.Value);
                        legacyusers2siteletsDT.Addlegacyusers2siteletsRow(legacyusers2siteletsR);
                        legacyusers2siteletsTA.Update(legacyusers2siteletsDT);
                    }
                }

                //Send a confirmation email

                /*
                Axis360Mail myMail = new Axis360Mail();
                myMail.FromEmail = "info@mlbstyleguide.com";
                myMail.FromName = "Major League Baseball Properties";
                myMail.IsBodyHtml = true;
                myMail.Subject = "Welcome to the MLB Styleguide!";
                myMail.ToEmail1 = legacyusersR.Email;
                myMail.ToName1 = legacyusersR.Company;

                myMail.Message = "Hello " + legacyusersR.Company + " user<br><br>" +
                                 "Thank you for registering at www.mlbstyleguide.com.<br><br>" +
                                 "Your temporary login information is shown below:<br><br>" +
                                 "User name: " + legacyusersR.UserName + "<br>" +
                                 "Password: " + legacyusersR.Password + "<br><br>" +
                                 "You can login with this information at <a href=\"http://" + Request.ServerVariables["SERVER_NAME"].ToString() + "\">" +
                                 "http://" + Request.ServerVariables["SERVER_NAME"].ToString() + "</a>.<br>" +
                                 "Once you log in you will be asked to complete a short form and create your own unique password.<br>" +
                                 "Future access to the site will then be done by simply entering your e-mail address and desired password.<br><br>" +
                                 "If you have any questions or need any other assistance, please contact us at <a href=\"mailto:info@mlbstyleguide.com\">info@mlbstyleguide.com</a>.<br><br>" +
                                 "Thank you,<br><br>" +
                                 "Major League Baseball Properties";
                myMail.Send();
                 * /

                /*
                if ((legacyusersR["FromDate"] is DBNull) || (legacyusersR["ToDate"] is DBNull))
                {
                    //Response.Redirect("http://google.com");
                    //legacyusersR.FromDate = null;
                    //legacyusersR.ToDate = null;

                }

                if (legacyusersR["AllowedYear"] is DBNull)
                {
                    //legacyusersR.AllowedYear = null;
                }

                dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
                int iPkey = Convert.ToInt32(legacyusersTA.InsertQuery(legacyusersR.UserName, legacyusersR.Password, legacyusersR.Company, true, true, true, true, true, true, legacyusersR.Email, false, legacyusersR.Contract, legacyusersR.Address1, legacyusersR.Address2, legacyusersR.City, legacyusersR.State, legacyusersR.Zip, legacyusersR.Phone, legacyusersR.Country, true, true, true, true, true, true, true, legacyusersR.UserLevel, legacyusersR.UserCategory, legacyusersR.RequestorID, legacyusersR.FromDate, legacyusersR.ToDate, legacyusersR.AllowedYear));
                */
                //lblDescription.Text = "PRIMIRY KEY CREATED ==> " + iPkey;
                ltrAddUsers.Text = "Now you can <a href=\"CompanyMgr.aspx?prefix=" + legacyusersR.Company.Substring(0, 1) + "\">add a user</a>.<br />";

            }
            else
            {
                Response.Redirect("./");
            }

            
            lblStep.Visible = false;
            lblDescription.Visible = false;

            tablesitlet.Visible = false;
            tableFinished.Visible = true;
            
        }
        /*
        foreach (ListItem li in cblS7.Items)
        {
            if (li.Selected)
            {
                PRegSurveyTA.InsertQuery(iPkey, 7, Convert.ToInt32(li.Value));
            }
        }*/
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
    protected void btnBack1_Click(object sender, EventArgs e)
    {
        Response.Redirect("./");
    }
    protected void btnBack2_Click(object sender, EventArgs e)
    {
        lblStep.Text = "Step 1 of 5:";
        lblDescription.Text = "Enter The Company Information";
        tableProfile.Visible = true;
        cvMessage.Enabled = true;
        tableUserLevel.Visible = false;
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
        if (Session["legacyusersR"] != null)
        {
            legacyusersR = (dsCompany.legacyusersRow)(Session["legacyusersR"]);
            //if (legacyusersR.UserLevel == "A")
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
            Response.Redirect("./");
        }

        
        lblDescription.Text = "Choose a user category";
        tableUserCategory.Visible = true;
        tableRequestor.Visible = false;
    }
    protected void btnBack5_Click(object sender, EventArgs e)
    {
        if (Session["legacyusersR"] != null)
        {
            legacyusersR = (dsCompany.legacyusersRow)(Session["legacyusersR"]);
            //Never reach the following code
            //if (legacyusersR.UserLevel == "A")
            //{
            //    lblStep.Text = "Step 3:";
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
    protected void ddlRequestor_DataBound(object sender, EventArgs e)
    {
        ddlRequestor.Items.FindByValue("0").Text = "Select One";

    }

    protected void SaveLevelA()
    {
        if ((Session["legacyusersTA"] != null) && (Session["legacyusersDT"] != null))
        {

            legacyusersTA = (dsCompanyTableAdapters.legacyusersTableAdapter)(Session["legacyusersTA"]);
            legacyusersDT = (dsCompany.legacyusersDataTable)(Session["legacyusersDT"]);
            legacyusersR = (dsCompany.legacyusersRow)(Session["legacyusersR"]);

            //dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
            //int iPkey = Convert.ToInt32(legacyusersTA.InsertQuery(legacyusersR.UserName, legacyusersR.Password, legacyusersR.Company, true, true, true, true, true, true, legacyusersR.Email, false, legacyusersR.Contract, legacyusersR.Address1, legacyusersR.Address2, legacyusersR.City, legacyusersR.State, legacyusersR.Zip, legacyusersR.Phone, legacyusersR.Country, true, true, true, true, true, true, true, legacyusersR.UserLevel, legacyusersR.UserCategory, legacyusersR.RequestorID, legacyusersR.FromDate, legacyusersR.ToDate, legacyusersR.AllowedYear));
            //string strBefore = legacyusersDT.Rows.Count.ToString();
            legacyusersR.RegistrationDate = DateTime.Now;

            legacyusersDT.AddlegacyusersRow(legacyusersR);
            legacyusersDT.RowChanged += new DataRowChangeEventHandler(Row_Changed);

            //string strAfter = legacyusersDT.Rows.Count.ToString();
            legacyusersTA.Update(legacyusersDT);

            //Let's add sitelets
            //Get all availaible sitelets
            dsCompanyTableAdapters.siteletsTableAdapter siteletsTA = new dsCompanyTableAdapters.siteletsTableAdapter();
            dsCompany.siteletsDataTable siteletsDT = new dsCompany.siteletsDataTable();
            siteletsDT = siteletsTA.GetAllSitelets();

            dsCompanyTableAdapters.legacyusers2siteletsTableAdapter legacyusers2siteletsTA = new dsCompanyTableAdapters.legacyusers2siteletsTableAdapter();
            dsCompany.legacyusers2siteletsDataTable legacyusers2siteletsDT = new dsCompany.legacyusers2siteletsDataTable();
            legacyusers2siteletsDT = legacyusers2siteletsTA.GetAllc2s();

            for (int i = 0; i < siteletsDT.Rows.Count; i++)
            {
                dsCompany.legacyusers2siteletsRow legacyusers2siteletsR = legacyusers2siteletsDT.Newlegacyusers2siteletsRow();
                legacyusers2siteletsR.cid = iPkey;
                legacyusers2siteletsR.sid = Convert.ToInt32(siteletsDT[i].id);
                legacyusers2siteletsDT.Addlegacyusers2siteletsRow(legacyusers2siteletsR);
                legacyusers2siteletsTA.Update(legacyusers2siteletsDT);
            }


            tableRequestor.Visible = false;

            tableFinished.Visible = true;
            lblStep.Visible = false;
            lblDescription.Visible = false;


            //Send a confirmation email
            /*
            Axis360Mail myMail = new Axis360Mail();
            myMail.FromEmail = "info@mlbstyleguide.com";
            myMail.FromName = "Major League Baseball Properties";
            myMail.IsBodyHtml = true;
            myMail.Subject = "Welcome to the MLB Styleguide!";
            myMail.ToEmail1 = legacyusersR.Email;
            myMail.ToName1 = legacyusersR.Company;

            myMail.Message = "Hello " + legacyusersR.Company + " user<br><br>" +
                             "Thank you for registering at www.mlbstyleguide.com.<br><br>" +
                             "Your temporary login information is shown below:<br><br>" +
                             "User name: " + legacyusersR.UserName + "<br>" +
                             "Password: " + legacyusersR.Password + "<br><br>" +
                             "You can login with this information at <a href=\"http://" + Request.ServerVariables["SERVER_NAME"].ToString() + "\">" +
                             "http://" + Request.ServerVariables["SERVER_NAME"].ToString() + "</a>.<br>" +
                             "Once you log in you will be asked to complete a short form and create your own unique password.<br>" +
                             "Future access to the site will then be done by simply entering your e-mail address and desired password.<br><br>" +
                             "If you have any questions or need any other assistance, please contact us at <a href=\"mailto:info@mlbstyleguide.com\">info@mlbstyleguide.com</a>.<br><br>" +
                             "Thank you,<br><br>" +
                             "Major League Baseball Properties";
            myMail.Send();
             */
        }
    }


    protected void cblSitelet_DataBound(object sender, EventArgs e)
    {
        if (Session["legacyusersR"] != null)
        {
            legacyusersR = (dsCompany.legacyusersRow)(Session["legacyusersR"]);

            if (legacyusersR.UserLevel == "A")
            {
                foreach (ListItem li in cblSitelet.Items)
                {
                        li.Selected = true;
                    
                }
            }
        }

    }
    protected void cvMaxCharacters_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.ToString().Length > 100)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}
