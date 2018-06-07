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

public partial class probe : System.Web.UI.Page
{
    protected dsCompanyTableAdapters.dtSiteletsTableAdapter dtSiteletsTA = new dsCompanyTableAdapters.dtSiteletsTableAdapter();
    protected dsCompany.dtSiteletsDataTable dtSiteletsDT = new dsCompany.dtSiteletsDataTable();
    protected string strSitelets = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        dsReportTableAdapters.dtCompaniesByRequestorTableAdapter dtCompaniesByRequestorTA = new dsReportTableAdapters.dtCompaniesByRequestorTableAdapter();
        dsReport.dtCompaniesByRequestorDataTable dtCompaniesByRequestorDT = new dsReport.dtCompaniesByRequestorDataTable();
        dtCompaniesByRequestorDT = dtCompaniesByRequestorTA.GetCompaniesByRequestor(34);
        gvCompany.DataSource = dtCompaniesByRequestorDT;
        gvCompany.DataBind();
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

    protected void gvCompany_Sorting(object sender, GridViewSortEventArgs e)
    {
        GridViewSortExpression = e.SortExpression;
        int pageIndex = gvCompany.PageIndex;
        gvCompany.DataSource = SortDataTable(gvCompany.DataSource as DataTable, false);
        gvCompany.DataBind();
        gvCompany.PageIndex = pageIndex;
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

    protected void gvCompany_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        /*
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[8].Text = "BINGO!";
            strSitelets = string.Empty;
            dtSiteletsDT = dtSiteletsTA.GetSiteletNamesByCID(Convert.ToInt32(e.Row.Cells[9].Text));

            for (int i = 0; i < dtSiteletsDT.Rows.Count; i++)
            {
                if (i > 0)
                {
                    strSitelets += ", ";
                }
                strSitelets += dtSiteletsDT[i].description;
            }
            e.Row.Cells[9].Text = strSitelets;

        }*/

        /*
if (e.Row.RowType == DataControlRowType.DataRow)
{
if (e.Row.RowType == DataControlRowType.DataRow)
{
e.Row.Cells[1].Text = "<a href=\"CompanyDetail.aspx?id=" + gvCompany.DataKeys[e.Row.RowIndex]["ID"].ToString() + "\">" + e.Row.Cells[1].Text + "</a>";
}
}*/
    }
}
