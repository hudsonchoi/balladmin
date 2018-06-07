using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Reset the session variables to make it sense
        Session["legacyusersDT"] = null;
        dsWallpaperTableAdapters.wallpaperTableAdapter wpTA = new dsWallpaperTableAdapters.wallpaperTableAdapter();
        dsWallpaper.wallpaperDataTable wpDT = wpTA.GetActiveWallpaper();

        hlWallPaper.NavigateUrl = "./images/wallpaper/" + wpDT.Rows[0]["filename"].ToString();
        imgWallpaper.ImageUrl = "./images/wallpaper/" + wpDT.Rows[0]["filename"].ToString();



    }

}
