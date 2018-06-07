using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Diagnostics;
using System.Web.Services;

public partial class wallpaper : System.Web.UI.Page
{
    public string strScript = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            UpdateGrid();
        }
        else
        {
            if (Request.Form["uploadPost"] != null)
            {
                string[] filenames = Request.Form["filenames"].ToString().Split(',');//From the hidden values manually inserted in jquery.uploadify.v2.1.4.js
                dsWallpaperTableAdapters.wallpaperTableAdapter wpTA = new dsWallpaperTableAdapters.wallpaperTableAdapter();
                dsWallpaper.wallpaperDataTable wpDT = wpTA.GetAllWallpaper();
                foreach (string filename in filenames)
                {
                    dsWallpaper.wallpaperRow wpRow = wpDT.NewwallpaperRow();
                    wpRow.Filename = filename;
                    wpRow.DateUploaded = DateTime.Now;
                    wpRow.Active = false;
                    wpDT.AddwallpaperRow(wpRow);
                }  
                wpTA.Update(wpDT);
                Response.Redirect("./wallpaper.aspx");
            }

        }

    }

    protected void gvWallpaper_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Literal ltrRadio = (Literal)(e.Row.FindControl("ltrRadio"));
            bool bActive = Convert.ToBoolean(ltrRadio.Text);
            if (bActive)
            {
                e.Row.BackColor = ColorTranslator.FromHtml("#0099CC");
                e.Row.ForeColor = Color.White;
                e.Row.Font.Bold = true;
            }
            
        }
    }
    protected void gvWallpaper_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "Preview")
        {
            Preview(gvWallpaper.Rows[index].Cells[1].Text);
            strScript = "window.open('/preview.asp');";
        }
        else if (e.CommandName == "Publish")
        {
            dsWallpaperTableAdapters.wallpaperTableAdapter wpTA = new dsWallpaperTableAdapters.wallpaperTableAdapter();
            wpTA.uspWallpaerResetActive();
            wpTA.uspSelectWallpaperByID(Convert.ToInt32(gvWallpaper.DataKeys[index]["ID"].ToString()));
            UpdateGrid();

            Preview(gvWallpaper.Rows[index].Cells[1].Text);

            StreamReader sr = new StreamReader(Server.MapPath("./css/preview.css"));
            StreamWriter sw = new StreamWriter(Server.MapPath("./css/mlb.css"));
            //Read the first line of text
            string line = sr.ReadLine();

            while (line != null)
            {
                sw.WriteLine(line);
                line = sr.ReadLine();
            }

            sr.Close();
            sw.Close();
            strScript = "window.open('/');";
        }
    }


    private void UpdateGrid()
    {
        dsWallpaperTableAdapters.wallpaperTableAdapter wpTA = new dsWallpaperTableAdapters.wallpaperTableAdapter();
        dsWallpaper.wallpaperDataTable wpDT = new dsWallpaper.wallpaperDataTable();
        wpDT = wpTA.GetAllWallpaper();
        gvWallpaper.DataSource = wpDT;
        gvWallpaper.DataBind();
    }

    private void Preview(string filename)
    {
        StreamReader sr = new StreamReader(Server.MapPath("./css/mlb.css"));
        StreamWriter sw = new StreamWriter(Server.MapPath("./css/preview.css"));

        string line = sr.ReadLine();

        bool updated = false;
        while (line != null)
        {
            if ((line.IndexOf("background-image") > 0) && (!updated))
            {
                line = "    background-image: url(\"../images/wallpaper/" + filename + "\");";
                updated = true;
            }
            sw.WriteLine(line);
            line = sr.ReadLine();
        }

        sr.Close();
        sw.Close();
    }

    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static string CheckFileExists(string filename) 
    {
        bool exist = false;
        string[] aFilenames = filename.Split(',');
        string badFilename = string.Empty;
        foreach (string f in aFilenames)
        {
            dsWallpaperTableAdapters.wallpaperTableAdapter wpTA = new dsWallpaperTableAdapters.wallpaperTableAdapter();
            if (Convert.ToInt32(wpTA.uspGetWallpaperByFilename(f)) == 1)
            {
                exist = true;
                badFilename = f;
                break;
            }
        }

        if (exist)
        {
            return badFilename;
        }
        else
        {
            return "";
        }

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string tempPath = Server.MapPath("~/images/wallpaper/" + FileUpload1.FileName);
            FileUpload1.SaveAs(tempPath);
            dsWallpaperTableAdapters.wallpaperTableAdapter wpTA = new dsWallpaperTableAdapters.wallpaperTableAdapter();
            dsWallpaper.wallpaperDataTable wpDT = wpTA.GetAllWallpaper();

            dsWallpaper.wallpaperRow wpRow = wpDT.NewwallpaperRow();
            wpRow.Filename = FileUpload1.FileName;
            wpRow.DateUploaded = DateTime.Now;
            wpRow.Active = false;
            wpDT.AddwallpaperRow(wpRow);

            wpTA.Update(wpDT);
            Response.Redirect("./wallpaper.aspx");
        }
        
    }
    protected void cvFileCheck_ServerValidate(object source, ServerValidateEventArgs args)
    {
        dsWallpaperTableAdapters.wallpaperTableAdapter wpTA = new dsWallpaperTableAdapters.wallpaperTableAdapter();
        if (Convert.ToInt32(wpTA.uspGetWallpaperByFilename(FileUpload1.FileName)) > 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}