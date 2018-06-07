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
public static class AdminDAL
{

    public static int CheckUser(string username, string password)
    {

        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataReader reader = null;
        try
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["MLBStyleGuideConnectionString1"].ConnectionString))
            {
                con.Open();
                using (cmd = con.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "mlbstyleguide.uspGetAdminID";
                    cmd.Parameters.Add(new SqlParameter("@username", username));
                    cmd.Parameters.Add(new SqlParameter("@password", password));
                    reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    if (reader.Read())
                    {
                        return Convert.ToInt32(reader.GetInt32(0));
                    }
                    else
                    {
                        return 0;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            //Pokemon exception handling
            return 0;
            throw ex;
        }

    }

    public static DataTable GetFileTracking(string strSection, DateTime from, DateTime to)
    {
        //List<FileTracking> FileTrackings = new List<FileTracking>();
        //FileTracking f = new FileTracking();
        //f.Email = "yes@yes.com";
        //FileTrackings.Add(f);

        DataTable dtFileTracking = new DataTable();
        DataColumn myDataColumn;
        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "Section";
        dtFileTracking.Columns.Add(myDataColumn);
 
        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "Email";
        dtFileTracking.Columns.Add(myDataColumn);
 
        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "DownloadedFile";
        dtFileTracking.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "DateDownloaded";
        dtFileTracking.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "IP";
        dtFileTracking.Columns.Add(myDataColumn);

        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataReader reader = null;
        DataRow row;
        try
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["MLBStyleGuideConnectionString1"].ConnectionString))
            {
                con.Open();
                using (cmd = con.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "mlbstyleguide.uspFilesDownloaded";
                    cmd.Parameters.Add(new SqlParameter("@section", strSection));
                    cmd.Parameters.Add(new SqlParameter("@from", from));
                    cmd.Parameters.Add(new SqlParameter("@to", to));
                    reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    while (reader.Read())
                    {
                        row = dtFileTracking.NewRow();
                        row["Section"] = reader.GetString(0);
                        row["Email"] = reader.GetString(1);
                        row["DownloadedFile"] = reader.GetString(2);
                        row["DateDownloaded"] = reader.GetDateTime(3).ToString();
                        if (!reader.IsDBNull(4))
                        {
                            row["IP"] = reader.GetString(4);
                        }
                        dtFileTracking.Rows.Add(row);
                    }
                    return dtFileTracking;
                }
            }
        }
        catch (Exception ex)
        {
            //Pokemon exception handling
            return dtFileTracking;
            throw ex;
        }
    }

}