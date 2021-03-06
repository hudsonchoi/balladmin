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
using System.Text;

public partial class Company : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Literal1.Text = "test";

        BuildTheAlphabetNav();
 
        tbSearch.Attributes.Add("onClick", "MakeItBlank()");

        //Reset the session variables to make it sense
        Session["legacyusersDT"] = null;
        dsCompanyTableAdapters.legacyusersTableAdapter legacyusersTA = new dsCompanyTableAdapters.legacyusersTableAdapter();
        dsCompanyTableAdapters.legacyusers4MgrTableAdapter legacyusers4MgrTA = new dsCompanyTableAdapters.legacyusers4MgrTableAdapter();

        dsCompany.legacyusersDataTable legacyusersDT = new dsCompany.legacyusersDataTable();
        dsCompany.legacyusers4MgrDataTable legacyusers4MgrDT = new dsCompany.legacyusers4MgrDataTable();


        if ((!Page.IsPostBack) || (tbSearch.Text == "Company or Username"))
        {
            if (Request.QueryString["prefix"] != null)
            {
                if (Request.QueryString["prefix"].ToString() == "0")
                {
                    legacyusers4MgrDT = legacyusers4MgrTA.GetCompaniesStartWithNumber();
                }
                else
                {
                    legacyusers4MgrDT = legacyusers4MgrTA.GetCompaniesStartWith(Server.UrlDecode(Request.QueryString["prefix"].ToString()));
                }
            }
            else if (Request.QueryString["key"] != null)
            {
                legacyusers4MgrDT = legacyusers4MgrTA.GetCompaniesByKeyword(Server.UrlDecode(Request.QueryString["key"].ToString()));
            }
            else
            {
                legacyusers4MgrDT = legacyusers4MgrTA.GetCompaniesStartWith("A");
            }
        }
        else
        {
            legacyusers4MgrDT = legacyusers4MgrTA.GetCompaniesByKeyword(tbSearch.Text);
        }
        



        for (int i = 0; i < legacyusers4MgrDT.Rows.Count; i++)
        {
            if (!(legacyusers4MgrDT.Rows[i]["UserLevel"] is DBNull))
            {

                switch (legacyusers4MgrDT[i].UserLevel)
                {
                    case "A": legacyusers4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                    case "B": legacyusers4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                    case "C":
                        if (!(legacyusers4MgrDT.Rows[i]["AllowedYear"] is DBNull))
                        {
                            if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= legacyusers4MgrDT[i].AllowedYear)
                            {
                                legacyusers4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                legacyusers4MgrDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                            }
                        }
                        else
                        {
                            legacyusers4MgrDT[i].Status = "<b>Unknown</b>";
                        }

                        break;
                    
                        if (!(legacyusers4MgrDT.Rows[i]["FromDate"] is DBNull) && !(legacyusers4MgrDT.Rows[i]["ToDate"] is DBNull))
                        {
                            if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= legacyusers4MgrDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= legacyusers4MgrDT[i].ToDate))
                            {
                                legacyusers4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                legacyusers4MgrDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                            }
                        }
                        else
                        {
                            legacyusers4MgrDT[i].Status = "<b>Unknown</b>";
                        }
                        break;
                    case "X":
                        legacyusers4MgrDT[i].Status = "<b><font color=\"red\">Suspended</font></b>";
                        break;
                    default: break;
                }
            }

        }

        gvCompany.DataSource = legacyusers4MgrDT;
        gvCompany.DataBind();
        legacyusers4MgrDT = legacyusers4MgrTA.GetAllCompanies();
        lblNum.Text = "Total number of companies: " + legacyusers4MgrDT.Rows.Count;
    }
    protected void btnAdd1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCompany.aspx");
    }



    protected void gvCompany_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Response.Redirect("EditCompany.aspx?id=" + gvCompany.DataKeys[e.NewEditIndex]["ID"].ToString());
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

    protected void gvCompany_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCompany.DataSource = SortDataTable(gvCompany.DataSource as DataTable, true);
        gvCompany.PageIndex = e.NewPageIndex;
        gvCompany.DataBind();
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



    protected void gvReport_Sorting(object sender, GridViewSortEventArgs e)
    {
        GridViewSortExpression = e.SortExpression;
        int pageIndex = gvCompany.PageIndex;
        gvCompany.DataSource = SortDataTable(gvCompany.DataSource as DataTable, false);
        gvCompany.DataBind();
        gvCompany.PageIndex = pageIndex;
    }

    protected void gvCompany_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        dsUserTableAdapters.licensee4MgrTableAdapter licensee4MgrTA = new dsUserTableAdapters.licensee4MgrTableAdapter();
        dsUser.licensee4MgrDataTable licensee4MgrDT = new dsUser.licensee4MgrDataTable();
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            licensee4MgrDT = licensee4MgrTA.GetLicenseesByCID(Convert.ToInt32(gvCompany.DataKeys[e.Row.RowIndex]["ID"].ToString()));
            if (licensee4MgrDT.Rows.Count == 0)
            {
                ((HtmlImage)e.Row.FindControl("viewUserID")).Visible = false;
            }
        }

        /*
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Cells[3].Text = "<a href=\"CompanyDetail.aspx?id=" + gvUser.DataKeys[e.Row.RowIndex]["ID"].ToString() + "\">" + e.Row.Cells[3].Text + "</a>";
                e.Row.Cells[0].Text = "<input type=\"button\" value=\"View\" onclick=\"window.location='CompanyDetail.aspx?id=" + gvCompany.DataKeys[e.Row.RowIndex]["ID"].ToString() + "'\">";
                e.Row.Cells[1].Text = "<input type=\"button\" value=\" Edit \" onclick=\"window.location='EditCompany.aspx?id=" + gvCompany.DataKeys[e.Row.RowIndex]["ID"].ToString() + "'\">";
                e.Row.Cells[8].Text = "<input type=\"button\" value=\"Delete\" onclick=\"window.location='DeleteCompany.aspx?id=" + gvCompany.DataKeys[e.Row.RowIndex]["ID"].ToString() + "'\">";
            }
        }
         */
        
    }
    protected void gvCompany_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }

    protected void gvCompany_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int iIndex;
        if (e.CommandName == "View")
        {
            iIndex = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("CompanyDetail.aspx?id=" + gvCompany.DataKeys[iIndex]["ID"].ToString());
        }
        else if (e.CommandName == "Edit")
        {
            iIndex = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("EditCompany.aspx?id=" + gvCompany.DataKeys[iIndex]["ID"].ToString());

        }
        else if (e.CommandName == "Delete")
        {
            iIndex = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("DeleteCompany.aspx?id=" + gvCompany.DataKeys[iIndex]["ID"].ToString());

        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblBreadCrumb.Text = "<a href=\"./\">Home</a> :: <a href=\"./CompanyMgr.aspx\">Company Manager</a>";
    }

    protected void BuildTheAlphabetNav()
    {
        StringBuilder sbAlphaNav = new StringBuilder();

        sbAlphaNav.Append("<a href=\"CompanyMgr.aspx?prefix=0\" class=\"alphabet\"");
        if ((Request.QueryString["prefix"] != null)&(Request.QueryString["prefix"] == "0"))
        {
            sbAlphaNav.Append(" style=\"color:#0099CC\"");
        }
        sbAlphaNav.Append(">&nbsp;&nbsp;0-9&nbsp;&nbsp;</a>|");
        for (int i = 65; i <= 90; i++)
        {
            sbAlphaNav.Append("<a href=\"CompanyMgr.aspx?prefix=" + (char)i + "\" class=\"alphabet\"");
            if ((Request.QueryString["prefix"] != null) & (!Page.IsPostBack))
            {
                if ((char)i == Convert.ToChar(Request.QueryString["prefix"].ToCharArray()[0]))
                {
                    sbAlphaNav.Append(" style=\"color:#0099CC\"");
                }
            }
            else if ((Request.QueryString["from"] == null) & (!Page.IsPostBack))
            {
                if ((char)i == Convert.ToChar("A"))
                {
                    sbAlphaNav.Append(" style=\"color:#0099CC\"");
                }
            }
            sbAlphaNav.Append(">&nbsp;&nbsp;" + (char)i + "&nbsp;&nbsp;</a>|");
        }
        ltAlphaNav.Text = sbAlphaNav.ToString();
    }
}
