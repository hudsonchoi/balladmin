using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class deleteWallpaper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            dsWallpaperTableAdapters.wallpaperTableAdapter wpTA = new dsWallpaperTableAdapters.wallpaperTableAdapter();
            dsWallpaper.wallpaperDataTable wpDT = wpTA.GetWallpaperByID(Convert.ToInt32(Request.QueryString["id"]));
            File.Delete(Server.MapPath("~/images/wallpaper/"+wpDT.Rows[0]["filename"].ToString()));

            wpTA.uspDeleteWallpaperByID(Convert.ToInt32(Request.QueryString["id"]));
            Response.Redirect("./wallpaper.aspx");
        }
    }
}