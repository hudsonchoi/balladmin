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

public partial class DeleteUser : System.Web.UI.Page
{
    dsUserTableAdapters.licenseeTableAdapter licenseeTA;
    dsUser.licenseeDataTable licenseeDT;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)//Protection required ALL edits!
        {
            if (!Page.IsPostBack)
            {

                licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
                licenseeDT = new dsUser.licenseeDataTable();
                licenseeDT = licenseeTA.GetUserByID(Convert.ToInt32(Request.QueryString["id"].ToString()));
                Session["licenseeDT"] = licenseeDT;




                //Populate the existing data
                if (!(licenseeDT.Rows[0]["FirstName"] is DBNull))
                {
                    lblFirstName.Text = licenseeDT[0].FirstName;
                }

                if (!(licenseeDT.Rows[0]["MI"] is DBNull))
                {
                    lblMI.Text = licenseeDT[0].MI;
                }

                if (!(licenseeDT.Rows[0]["LastName"] is DBNull))
                {
                    lblLastName.Text = licenseeDT[0].LastName;
                }


                if (!(licenseeDT.Rows[0]["Email"] is DBNull))
                {
                    lblEmail.Text = licenseeDT[0].Email;
                }

                if (!(licenseeDT.Rows[0]["cid"] is DBNull))
                {
                    dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
                    dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
                    legacyusersDT = legacyusersTA.GetCompanyByID(licenseeDT[0].cid);

                    if (legacyusersDT.Rows.Count > 0)
                    {
                        lblCompany.Text = legacyusersDT[0].Company;
                    }
                    else
                    {
                        lblCompany.Text = "<b><font color=\"red\">DELETED</font></b>";
                    }
                }

                if (!(licenseeDT.Rows[0]["Contract"] is DBNull))
                {
                    lblContract.Text = licenseeDT[0].Contract;
                }

                if (!(licenseeDT.Rows[0]["Address1"] is DBNull))
                {
                    lblAddress1.Text = licenseeDT[0].Address1;
                }

                if (!(licenseeDT.Rows[0]["Address2"] is DBNull))
                {
                    lblAddress2.Text = licenseeDT[0].Address2;
                }

                if (!(licenseeDT.Rows[0]["City"] is DBNull))
                {
                    lblCity.Text = licenseeDT[0].City;
                }

                if (!(licenseeDT.Rows[0]["State"] is DBNull))
                {
                    lblState.Text = licenseeDT[0].State;
                }
                if (!(licenseeDT.Rows[0]["Zip"] is DBNull))
                {
                    lblZip.Text = licenseeDT[0].Zip;
                }

                if (!(licenseeDT.Rows[0]["Phone"] is DBNull))
                {
                    lblPhone.Text = licenseeDT[0].Phone;
                }

                if (!(licenseeDT.Rows[0]["Fax"] is DBNull))
                {
                    lblFax.Text = licenseeDT[0].Fax;
                }

                if (!(licenseeDT.Rows[0]["Password"] is DBNull))
                {
                    lblPassword.Text = licenseeDT[0].Password;
                }

                if (!(licenseeDT.Rows[0]["UserLevel"] is DBNull))
                {
                    lblUserLevel.Text = licenseeDT[0].UserLevel;
                    if (licenseeDT[0].UserLevel == "D" && (!(licenseeDT.Rows[0]["FromDate"] is DBNull)) && (!(licenseeDT.Rows[0]["ToDate"] is DBNull)))//When Level D enforce the required field validator to the date range
                    {
                        lblDateRange.Text = "(" + licenseeDT[0].FromDate.ToShortDateString() + " ~ " + licenseeDT[0].ToDate.ToShortDateString() + ")";
                    }
                }

                if (!(licenseeDT.Rows[0]["UserCategory"] is DBNull))
                {
                    lblUserCategory.Text = licenseeDT[0].UserCategory;
                }

                if (!(licenseeDT.Rows[0]["RequestorID"] is DBNull))
                {
                    dsCompanyTableAdapters.requestorsTableAdapter requestorsTA = new dsCompanyTableAdapters.requestorsTableAdapter();
                    dsCompany.requestorsDataTable requestorsDT = new dsCompany.requestorsDataTable();
                    requestorsDT = requestorsTA.GetRequestorByID(licenseeDT[0].RequestorID);
                    lblRequestor.Text = requestorsDT[0].name;
                }


                //dsCompanyTableAdapters.legacyusers2siteletsTableAdapter legacyusers2siteletsTA = new dsCompanyTableAdapters.legacyusers2siteletsTableAdapter();
                dsUserTableAdapters.licensee2siteletsTableAdapter licensee2siteletsTA = new dsUserTableAdapters.licensee2siteletsTableAdapter();

                //dsCompany.legacyusers2siteletsDataTable legacyusers2siteletsDT = new dsCompany.legacyusers2siteletsDataTable();
                dsUser.licensee2siteletsDataTable licensee2siteletsDT = new dsUser.licensee2siteletsDataTable();

                //legacyusers2siteletsDT = legacyusers2siteletsTA.Getc2sByCID(legacyusersDT[0].ID);
                licensee2siteletsDT = licensee2siteletsTA.Getu2sByUID(licenseeDT[0].ID);

                dsCompanyTableAdapters.siteletsTableAdapter siteletsTA = new dsCompanyTableAdapters.siteletsTableAdapter();
                dsCompany.siteletsDataTable siteletsDT = new dsCompany.siteletsDataTable();
                siteletsDT = siteletsTA.GetAllSitelets();

                string strSitelets = string.Empty;
                for (int i = 0; i < licensee2siteletsDT.Rows.Count; i++)
                {
                    for (int j = 0; j < siteletsDT.Rows.Count; j++)
                    {
                        if (siteletsDT[j].id == licensee2siteletsDT[i].sid)
                        {
                            strSitelets += siteletsDT[j].description + "<br>";
                        }
                    }
                }

                lblSitelets.Text = strSitelets;


            }
        }
        else//Take care of the deviants
        {
            Response.Redirect("./");
        }

    }


    protected void btnYes_Click(object sender, EventArgs e)
    {
        if (Session["adminID"] != null)
        {
            lblDescription.Visible = false;
            tableProfile.Visible = false;
            tableFinished.Visible = true;

            //dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
            dsUserTableAdapters.licenseeTableAdapter licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();

            //dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
            dsUser.licenseeDataTable licenseeDT = new dsUser.licenseeDataTable();

            //legacyusersDT = legacyusersTA.GetCompanyByID(Convert.ToInt32(Request.QueryString["id"].ToString()));
            licenseeDT = licenseeTA.GetUserByID(Convert.ToInt32(Request.QueryString["id"].ToString()));

            AdminActionLogDAL.LogAdminAction(Convert.ToInt32(Session["adminID"].ToString()), 1, licenseeDT.Rows[0]["email"].ToString(), licenseeDT.Rows[0]["firstname"].ToString(), licenseeDT.Rows[0]["lastname"].ToString());

            //legacyusersDT.Rows[0].Delete();
            licenseeDT.Rows[0].Delete();

            //legacyusersTA.Update(legacyusersDT);
            licenseeTA.Update(licenseeDT);
        }


    }
}
