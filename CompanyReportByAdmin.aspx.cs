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

public partial class CompanyReportByAdmin : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

            //dsReportTableAdapters.dtCompaniesByRequestorTableAdapter dtCompaniesByRequestorTA = new dsReportTableAdapters.dtCompaniesByRequestorTableAdapter();
            dsReportTableAdapters.dtCompaniesOfAdminTableAdapter dtCompaniesOfAdminTA = new dsReportTableAdapters.dtCompaniesOfAdminTableAdapter();
            //dsReport.dtCompaniesByRequestorDataTable dtCompaniesByRequestorDT = new dsReport.dtCompaniesByRequestorDataTable();
            dsReport.dtCompaniesOfAdminDataTable dtCompaniesOfAdminDT = new dsReport.dtCompaniesOfAdminDataTable();
            //dtCompaniesByRequestorDT = dtCompaniesByRequestorTA.GetCompaniesByRequestor(Convert.ToInt32(ddlRequestor.SelectedValue));
            dtCompaniesOfAdminDT = dtCompaniesOfAdminTA.GetCompaniesOfAdmin();
            gvCompany.DataSource = dtCompaniesOfAdminDT;
            gvCompany.DataBind();
            lblResult.Text = "Number of companies: <b>" + dtCompaniesOfAdminDT.Rows.Count + "</b>";
            lblBreadCrumb.Text = "<a href=\"./\">Home</a> :: <a href=\"CompanyReport.aspx\">Company Report</a> :: Site Administrator";

        
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

    protected void lbXLS_Click(object sender, EventArgs e)
    {
        Response.Redirect("./xls_company_admin.aspx");
    }
}
