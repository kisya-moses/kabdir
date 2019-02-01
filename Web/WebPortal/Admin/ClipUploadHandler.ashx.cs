using WebPortal.Logic;
using System;
using System.IO;
using System.Web;

namespace WebPortal.Admin
{
    /// <summary>
    /// Summary description for ClipUploadHandler
    /// </summary>
    public class ClipUploadHandler : IHttpHandler
    {

        string VidPath = "~/Admin/.VID/";// + DateTime.Now.Year + "/" + DateTime.Now.Month + "/";
        string ImgPath = "~/Admin/.Images/";// + DateTime.Now.Year + "/" + DateTime.Now.Month + "/";

        DatabaseHandler dh = new DatabaseHandler();

        StringHandler str = new StringHandler();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string dirFullPath = HttpContext.Current.Server.MapPath(VidPath);
            string dirFullPath1 = HttpContext.Current.Server.MapPath(ImgPath);
            string[] files;
            int numFiles;
            if(!System.IO.Directory.Exists(dirFullPath))
            {
                System.IO.Directory.CreateDirectory(dirFullPath);
            }
            if (!System.IO.Directory.Exists(dirFullPath1))
            {
                System.IO.Directory.CreateDirectory(dirFullPath1);
            }
            files = System.IO.Directory.GetFiles(dirFullPath);
            numFiles = files.Length;
            numFiles = numFiles + 1;

            string str_image = "";

            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                //  int fileSizeInBytes = file.ContentLength;
                string fileName = file.FileName;
                string fileExtension = file.ContentType;
                string filename1, filename2;
                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);
                    string RandomStr = str.GetUniqueKey(5) + "_" + DateTime.Now.Ticks;
                    filename1 = VidPath + RandomStr + fileExtension;
                    string pathToSave_100 = HttpContext.Current.Server.MapPath(VidPath) + RandomStr + fileExtension; ;
                    filename2 = ImgPath + RandomStr + ".jpg";
                    file.SaveAs(pathToSave_100);
                    //create video thumbnail at given path
                    /////////////////////////////////////////////////////////////////////
                    //f.GetThumbnail(filename1, filename2, "640x480");
                    //////////////////////////////////////////////////////////////////////
                    string ID = "ADMINISTRATOR";// context.Session["USERIDENTITY"].ToString();// TODO: capture username from session

                    dh.InsertData("AddVideo", 
                        new object [] { 
                            ID,
                            filename1.Replace("/Admin",""), 
                            filename2.Replace("/Admin",""),
                            DateTime.Now.ToString(),
                            0
                    });
                    ////////////////////////////////////////////////////////////////////// 
                }
            }
            context.Response.Write(str_image);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}