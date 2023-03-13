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
using System.Diagnostics;

public partial class UserReportByCategory : System.Web.UI.Page
{
    protected dsUserTableAdapters.dtSiteletsTableAdapter dtSiteletsTA = new dsUserTableAdapters.dtSiteletsTableAdapter();
    protected dsUser.dtSiteletsDataTable dtSiteletsDT = new dsUser.dtSiteletsDataTable();
    protected string strSitelets = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            Session["Category"] = ddlCategory.SelectedValue;
            Session["Active"] = cbActive.Checked;

            Debug.WriteLine(ddlCategory.SelectedValue + ":" + cbActive.Checked);

            dsReportTableAdapters.dtUsersByCategoryTableAdapter dtUsersByCategoryTA = new dsReportTableAdapters.dtUsersByCategoryTableAdapter();
            dsReport.dtUsersByCategoryDataTable dtUsersByCategoryDT = new dsReport.dtUsersByCategoryDataTable();
            dtUsersByCategoryDT = dtUsersByCategoryTA.GetUsersByCategory(ddlCategory.SelectedValue);

            Debug.WriteLine(dtUsersByCategoryDT.Rows.Count);

            for (int i = 0; i < dtUsersByCategoryDT.Rows.Count; i++)
            {
                if (!(dtUsersByCategoryDT.Rows[i]["UserLevel"] is DBNull))
                {

                    switch (dtUsersByCategoryDT[i].UserLevel)
                    {
                        case "A":
                            if (cbActive.Checked)
                            {
                                dtUsersByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Delete();
                            }
                            break;
                        case "B":
                            if (cbActive.Checked)
                            {
                                dtUsersByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Delete();
                            }
                            break;
                        case "C":
                            if (!(dtUsersByCategoryDT.Rows[i]["AllowedYear"] is DBNull))
                            {
                                if (cbActive.Checked)
                                {
                                    if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByCategoryDT[i].AllowedYear)
                                    {
                                        dtUsersByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                    }
                                    else
                                    {
                                        dtUsersByCategoryDT[i].Delete();
                                    }
                                }
                                else
                                {
                                    if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByCategoryDT[i].AllowedYear)
                                    {
                                        dtUsersByCategoryDT[i].Delete();
                                    }
                                    else
                                    {
                                        dtUsersByCategoryDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                    }
                                }
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Status = "<b>Unknown</b>";
                            }

                            break;
                        case "D":
                            if (!(dtUsersByCategoryDT.Rows[i]["FromDate"] is DBNull) && !(dtUsersByCategoryDT.Rows[i]["ToDate"] is DBNull))
                            {
                                if (cbActive.Checked)
                                {
                                    if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtUsersByCategoryDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByCategoryDT[i].ToDate))
                                    {
                                        dtUsersByCategoryDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                    }
                                    else
                                    {
                                        dtUsersByCategoryDT[i].Delete();
                                    }
                                }
                                else
                                {
                                    if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtUsersByCategoryDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByCategoryDT[i].ToDate))
                                    {
                                        dtUsersByCategoryDT[i].Delete();
                                    }
                                    else
                                    {
                                        dtUsersByCategoryDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                    }
                                }
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Status = "<b>Unknown</b>";
                            }
                            break;
                        default:
                            if (cbActive.Checked)
                            {
                                dtUsersByCategoryDT[i].Delete();
                            }
                            else
                            {
                                dtUsersByCategoryDT[i].Status = "<b><font color=\"red\">Blocked</font></b>";
                            }
                            break;
                    }
                }
            }



            //////dsReportTableAdapters.dtUsersByRequestorTableAdapter dtUsersByRequestorTA = new dsReportTableAdapters.dtUsersByRequestorTableAdapter();
            //////dsReport.dtUsersByRequestorDataTable dtUsersByRequestorDT = new dsReport.dtUsersByRequestorDataTable();
            //////dtUsersByRequestorDT = dtUsersByRequestorTA.GetUsersByRequestor(Convert.ToInt32(ddlRequestor.SelectedValue));

            //Status code
            //////for (int i = 0; i < dtUsersByRequestorDT.Rows.Count; i++)
            //////{
            //////    if (!(dtUsersByRequestorDT.Rows[i]["UserLevel"] is DBNull))
            //////    {

            //////        switch (dtUsersByRequestorDT[i].UserLevel)
            //////        {
            //////            case "A": dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
            //////            case "B": dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
            //////            case "C":
            //////                if (!(dtUsersByRequestorDT.Rows[i]["AllowedYear"] is DBNull))
            //////                {
            //////                    if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByRequestorDT[i].AllowedYear)
            //////                    {
            //////                        dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
            //////                    }
            //////                    else
            //////                    {
            //////                        dtUsersByRequestorDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
            //////                    }
            //////                }
            //////                else
            //////                {
            //////                    dtUsersByRequestorDT[i].Status = "<b>Unknown</b>";
            //////                }

            //////                break;
            //////            case "D":
            //////                if (!(dtUsersByRequestorDT.Rows[i]["FromDate"] is DBNull) && !(dtUsersByRequestorDT.Rows[i]["ToDate"] is DBNull))
            //////                {
            //////                    if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtUsersByRequestorDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByRequestorDT[i].ToDate))
            //////                    {
            //////                        dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
            //////                    }
            //////                    else
            //////                    {
            //////                        dtUsersByRequestorDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
            //////                    }
            //////                }
            //////                else
            //////                {
            //////                    dtUsersByRequestorDT[i].Status = "<b>Unknown</b>";
            //////                }
            //////                break;
            //////            default: break;
            //////        }
            //////    }
            //////}


            dtUsersByCategoryDT.AcceptChanges();
            gvUsers.DataSource = dtUsersByCategoryDT;
            gvUsers.DataBind();

            lblResult.Text = "Number of users: <b>" + dtUsersByCategoryDT.Rows.Count + "</b>";

            //////lblBreadCrumb.Text = "<a href=\"./\">Home</a> :: <a href=\"ReportByRequestor.aspx\">User Report</a> :: " + ddlRequestor.SelectedItem;
            lblBreadCrumb.Text = "<a href=\"./\">Home</a> :: <a href=\"UserReportByCategory.aspx\">Users by Category</a> :: " + ddlCategory.SelectedItem;
            if (cbActive.Checked)
            {
                lblBreadCrumb.Text += " (Active)";
            }
            else
            {
                lblBreadCrumb.Text += " (Inactive)";
            }
            requestorTable.Visible = false;
            resultDiv.Visible = true;

        }
        else
        {
            if (Session["Category"] != null)
            {
                ddlCategory.SelectedValue = Session["Category"].ToString();
                cbActive.Checked = Convert.ToBoolean(Session["Active"]);
            }
        }
    }
    protected void ddlRequestor_DataBound(object sender, EventArgs e)
    {
        //////ddlRequestor.Items.FindByValue("0").Text = "Select One";

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {


    }

    //Ready-Made code to enable sort and paging
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

    protected void gvUsers_Sorting(object sender, GridViewSortEventArgs e)
    {
        GridViewSortExpression = e.SortExpression;
        int pageIndex = gvUsers.PageIndex;
        gvUsers.DataSource = SortDataTable(gvUsers.DataSource as DataTable, false);
        gvUsers.DataBind();
        gvUsers.PageIndex = pageIndex;
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

    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {


        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[8].Text = "BINGO!";
            strSitelets = string.Empty;
            dtSiteletsDT = dtSiteletsTA.GetSiteletNamesByUID(Convert.ToInt32(e.Row.Cells[9].Text));
            for (int i = 0; i < dtSiteletsDT.Rows.Count; i++)
            {
                if (i > 0)
                {
                    strSitelets += ", ";
                }
                strSitelets += dtSiteletsDT[i].description;
            }
            e.Row.Cells[9].Text = strSitelets;

        }

        /*
if (e.Row.RowType == DataControlRowType.DataRow)
{
if (e.Row.RowType == DataControlRowType.DataRow)
{
e.Row.Cells[1].Text = "<a href=\"CompanyDetail.aspx?id=" + gvCompany.DataKeys[e.Row.RowIndex]["ID"].ToString() + "\">" + e.Row.Cells[1].Text + "</a>";
}
}*/
    }
    protected void lbXLS_Click(object sender, EventArgs e)
    {
        if (cbActive.Checked)
        {
            Response.Redirect("./xls_category.aspx?category=" + ddlCategory.SelectedValue + "&active=true");
        }
        else
        {
            Response.Redirect("./xls_category.aspx?category=" + ddlCategory.SelectedValue + "&active=false");
        }
    }
}