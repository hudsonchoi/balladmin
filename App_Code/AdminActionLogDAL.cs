using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminDAL
/// </summary>
public static class AdminActionLogDAL
{

    public static void LogAdminAction(int adminID, int adminActionID, string userEmail, string userFirstName, string userLastName)
    {

        SqlConnection con = null;
        SqlCommand cmd = null;
        try
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["MLBStyleGuideConnectionString1"].ConnectionString))
            {
                con.Open();
                using (cmd = con.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "mlbstyleguide.uspLogAdminAction";
                    cmd.Parameters.Add(new SqlParameter("@adminID", adminID));
                    cmd.Parameters.Add(new SqlParameter("@adminActionID", adminActionID));
                    cmd.Parameters.Add(new SqlParameter("@userEmail", userEmail));
                    cmd.Parameters.Add(new SqlParameter("@userFirstName", userFirstName));
                    cmd.Parameters.Add(new SqlParameter("@userLastName", userLastName));
                    cmd.ExecuteNonQuery();
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

}