using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class DeleteRequester : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Request.QueryString["fn"] != null) && (Request.QueryString["ln"] != null))
        {
            string strFN = Server.UrlDecode(Request.QueryString["fn"].ToString());
            string strLN = Server.UrlDecode(Request.QueryString["ln"].ToString());
            try
            {
                dsRequestorsTableAdapters.requestorsTableAdapter requestorsTA = new dsRequestorsTableAdapters.requestorsTableAdapter();
                dsRequestors.requestorsDataTable requestorsDT = new dsRequestors.requestorsDataTable();
                requestorsDT = requestorsTA.GetAllRequestors();
                dsRequestors.requestorsRow requestorsR = requestorsDT.FindByfirstnamelastname(strFN, strLN);

                dsRequestorsTableAdapters.legacyusersTableAdapter legacyusersTA = new dsRequestorsTableAdapters.legacyusersTableAdapter();
                dsRequestors.legacyusersDataTable legacyusersDT = new dsRequestors.legacyusersDataTable();
                legacyusersDT = legacyusersTA.GetDataByRequestorID(requestorsR.id);
                foreach(DataRow row in legacyusersDT.Rows)
                {
                    row["RequestorID"] = DBNull.Value;
                }
                legacyusersTA.Update(legacyusersDT);

                requestorsR.Delete();
                requestorsTA.Update(requestorsDT);

                Session["name"] = strFN + " " + strLN;
                Response.Redirect("RequesterMgr.aspx", true);
            }
            catch (SqlException se)
            {
                if (se.Message.IndexOf("FK_licensee_requestors") >= 0)
                {
                    Response.Redirect("RequesterMgr.aspx?did=" + Request.QueryString["id"].ToString(), true);

                }
                else
                {
                    throw se;
                }
            }
        }
    }
}
