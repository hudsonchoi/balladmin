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

public partial class UserReportByCategory : System.Web.UI.Page
{
    protected dsUserTableAdapters.dtSiteletsTableAdapter dtSiteletsTA = new dsUserTableAdapters.dtSiteletsTableAdapter();
    protected dsUser.dtSiteletsDataTable dtSiteletsDT = new dsUser.dtSiteletsDataTable();
    protected string strSitelets = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            dsReportTableAdapters.dtUsersByRequestorTableAdapter dtUsersByRequestorTA = new dsReportTableAdapters.dtUsersByRequestorTableAdapter();
            dsReport.dtUsersByRequestorDataTable dtUsersByRequestorDT = new dsReport.dtUsersByRequestorDataTable();
            //////dtUsersByRequestorDT = dtUsersByRequestorTA.GetUsersByRequestor(Convert.ToInt32(ddlRequestor.SelectedValue));

            //Status code
            for (int i = 0; i < dtUsersByRequestorDT.Rows.Count; i++)
            {
                if (!(dtUsersByRequestorDT.Rows[i]["UserLevel"] is DBNull))
                {

                    switch (dtUsersByRequestorDT[i].UserLevel)
                    {
                        case "A": dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                        case "B": dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                        case "C":
                            if (!(dtUsersByRequestorDT.Rows[i]["AllowedYear"] is DBNull))
                            {
                                if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByRequestorDT[i].AllowedYear)
                                {
                                    dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                }
                                else
                                {
                                    dtUsersByRequestorDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                }
                            }
                            else
                            {
                                dtUsersByRequestorDT[i].Status = "<b>Unknown</b>";
                            }

                            break;
                        case "D":
                            if (!(dtUsersByRequestorDT.Rows[i]["FromDate"] is DBNull) && !(dtUsersByRequestorDT.Rows[i]["ToDate"] is DBNull))
                            {
                                if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= dtUsersByRequestorDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= dtUsersByRequestorDT[i].ToDate))
                                {
                                    dtUsersByRequestorDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                                }
                                else
                                {
                                    dtUsersByRequestorDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                                }
                            }
                            else
                            {
                                dtUsersByRequestorDT[i].Status = "<b>Unknown</b>";
                            }
                            break;
                        default: break;
                    }
                }
            }



            gvUsers.DataSource = dtUsersByRequestorDT;
            gvUsers.DataBind();

            lblResult.Text = "Number of users: <b>" + dtUsersByRequestorDT.Rows.Count + "</b>";

            //////lblBreadCrumb.Text = "<a href=\"./\">Home</a> :: <a href=\"ReportByRequestor.aspx\">User Report</a> :: " + ddlRequestor.SelectedItem;
            requestorTable.Visible = false;
            resultDiv.Visible = true;

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
        //////Response.Redirect("./xls_requestor.aspx?id=" + ddlRequestor.SelectedValue);
    }
}