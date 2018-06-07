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

public partial class UserMgr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tbSearch.Attributes.Add("onClick", "MakeItBlank()");
        //Reset the session variables to make it sense
        Session["licenseeDT"] = null;

      

        //dsUserTableAdapters.licenseeTableAdapter licenseeTA = new dsUserTableAdapters.licenseeTableAdapter();
        //dsUser.licenseeDataTable licenseeDT = new dsUser.licenseeDataTable();

        dsUserTableAdapters.licensee4MgrTableAdapter licensee4MgrTA = new dsUserTableAdapters.licensee4MgrTableAdapter();
        dsUser.licensee4MgrDataTable licensee4MgrDT = new dsUser.licensee4MgrDataTable();

        if ((!Page.IsPostBack) || (tbSearch.Text == "Email, Name or Company"))
        {
            //licenseeDT = licenseeTA.GetAllUsers();
            if (Request.QueryString["key"] != null)
            {
                licensee4MgrDT = licensee4MgrTA.GetLicenseeByKeyword(Server.UrlDecode(Request.QueryString["key"].ToString()));
            }
            else
            {
                licensee4MgrDT = licensee4MgrTA.GetAllUsers();
            }
            
        }
        else
        {
            //licenseeDT = licenseeTA.GetLicenseeByKeyword(tbSearch.Text);
            licensee4MgrDT = licensee4MgrTA.GetLicenseeByKeyword(tbSearch.Text);
        }

        for (int i = 0; i < licensee4MgrDT.Rows.Count; i++)
        {
            if (!(licensee4MgrDT.Rows[i]["UserLevel"] is DBNull))
            {

                switch (licensee4MgrDT[i].UserLevel)
                {
                    case "A": licensee4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                    case "B": licensee4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>"; break;
                    case "C":
                        if (!(licensee4MgrDT.Rows[i]["AllowedYear"] is DBNull))
                        {
                            if (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= licensee4MgrDT[i].AllowedYear)
                            {
                                licensee4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                licensee4MgrDT[i].Status = "<b><font color=\"red\">Expired</font></b>"; 
                            }
                        }
                        else
                        {
                            licensee4MgrDT[i].Status = "<b>Unknown</b>"; 
                        }
                        
                        break;
                    case "D": 
                        if (!(licensee4MgrDT.Rows[i]["FromDate"] is DBNull) && !(licensee4MgrDT.Rows[i]["ToDate"] is DBNull))
                        {
                            if ((Convert.ToDateTime(DateTime.Now.ToShortDateString()) >= licensee4MgrDT[i].FromDate) && (Convert.ToDateTime(DateTime.Now.ToShortDateString()) <= licensee4MgrDT[i].ToDate))
                            {
                                licensee4MgrDT[i].Status = "<b><font color=\"cyan\">Current</font></b>";
                            }
                            else
                            {
                                licensee4MgrDT[i].Status = "<b><font color=\"red\">Expired</font></b>";
                            }
                        }
                        else
                        {
                            licensee4MgrDT[i].Status = "<b>Unknown</b>";
                        }
                        break;
                    case "X":
                        licensee4MgrDT[i].Status = "<b><font color=\"red\">Suspended</font></b>";
                        break;
                    default: break;
                }
            }
            
        }

        gvUser.DataSource = licensee4MgrDT;
        //gvCompany.DataBind();
        gvUser.DataBind();

        lblNum.Text = "Total number of users: " + licensee4MgrDT.Rows.Count;
    }
    protected void btnAdd1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCompany.aspx");
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

    protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUser.DataSource = SortDataTable(gvUser.DataSource as DataTable, true);
        gvUser.PageIndex = e.NewPageIndex;
        gvUser.DataBind();
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
        int pageIndex = gvUser.PageIndex;
        gvUser.DataSource = SortDataTable(gvUser.DataSource as DataTable, false);
        gvUser.DataBind();
        gvUser.PageIndex = pageIndex;
    }

    protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Cells[3].Text = "<a href=\"CompanyDetail.aspx?id=" + gvUser.DataKeys[e.Row.RowIndex]["ID"].ToString() + "\">" + e.Row.Cells[3].Text + "</a>";
                e.Row.Cells[0].Text = "<input type=\"button\" value=\"View\" onclick=\"window.location='UserDetail.aspx?id=" + gvUser.DataKeys[e.Row.RowIndex]["ID"].ToString() + "'\">";
                e.Row.Cells[1].Text = "<input type=\"button\" value=\" Edit \" onclick=\"window.location='EditUser.aspx?id=" + gvUser.DataKeys[e.Row.RowIndex]["ID"].ToString() + "'\">";
                e.Row.Cells[10].Text = "<input type=\"button\" value=\"Delete\" onclick=\"window.location='DeleteUser.aspx?id=" + gvUser.DataKeys[e.Row.RowIndex]["ID"].ToString() + "'\">";
                if (e.Row.Cells[5].Text == "&nbsp;")
                {
                    e.Row.Cells[5].Text = "<b><font color=\"red\">DELETED</font></b>";
                }
            }
        }

    }
    protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }

    protected void gvUser_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Failed method..
        /*
        int iIndex;
        if (e.CommandName == "View")
        {
            iIndex = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("UserDetail.aspx?id=" + gvUser.DataKeys[iIndex]["ID"].ToString());
        }
        else if (e.CommandName == "Edit")
        {
            //iIndex = Convert.ToInt32(e.CommandArgument);
            //Response.Redirect("EditUser.aspx?id=" + gvUser.DataKeys[iIndex]["ID"].ToString());
            //Response.Redirect("EditUser.aspx?id=" + gvUser.DataKeys[gvUser.SelectedIndex]["ID"].ToString());

            GridViewRow selectedRow = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            DataKey rowKey = gvUser.DataKeys[selectedRow.RowIndex];
            Response.Redirect("EditUser.aspx?id=" + rowKey[0].ToString());
        }
        else if (e.CommandName == "Delete")
        {
            iIndex = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("DeleteUser.aspx?id=" + gvUser.DataKeys[iIndex]["ID"].ToString());

        }
         */

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblBreadCrumb.Text = "<a href=\"./\">Home</a> :: <a href=\"./UserMgr.aspx\">User Manager</a>";
    }
}
