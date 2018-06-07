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

public partial class ReportByAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        dsReportTableAdapters.dtUsersOfAdminTableAdapter dtUsersOfAdminTA = new dsReportTableAdapters.dtUsersOfAdminTableAdapter();
        dsReport.dtUsersOfAdminDataTable dtUsersOfAdminDT = new dsReport.dtUsersOfAdminDataTable();
        dtUsersOfAdminDT = dtUsersOfAdminTA.GetUsersOfAdmin();
        gvUsers.DataSource = dtUsersOfAdminDT;
        gvUsers.DataBind();
        lblResult.Text = "Number of users: <b>" + dtUsersOfAdminDT.Rows.Count + "</b>";
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

    protected void lbXLS_Click(object sender, EventArgs e)
    {
        Response.Redirect("./xls_admin.aspx");
    }
}
