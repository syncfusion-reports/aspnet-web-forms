using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Hosting;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using ReportsWebFormsSamples.Models;


namespace ReportsWebFormsSamples
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Application_BeginRequest(Object sender, EventArgs e)
        {

            var sampledata = SampleData.getSampleData();
            string sampleName = sampledata.samples[0].routerPath.Value;
            string reportViewerPath = "ReportViewer/";
            string path = HttpContext.Current.Request.Path;
            string basePath = HttpContext.Current.Request.ApplicationPath == "/" ? HttpContext.Current.Request.ApplicationPath : (HttpContext.Current.Request.ApplicationPath + "/");
            HttpContext.Current.Items["isPreview"] = path.Contains("/Preview") || path.Contains("/ReportDesigner");
            bool isReportDesigner = path.Contains("/ReportDesigner");
            bool isReportViewer = path.Contains("/ReportViewer/");
            bool sourceTab = HttpContext.Current.Request.QueryString.ToString().Contains("sourceTab");
            if (sourceTab)
            {
                string res = System.IO.File.ReadAllText(HttpContext.Current.Request.PhysicalPath);
                Response.Clear();
                Response.ClearHeaders();
                Response.AddHeader("Content-Type", "text/plain");
                Response.Write(res);
                Response.Flush();
                Response.End();
            }
            else if (basePath == path || (basePath == path + "/"))
            {

                HttpContext.Current.Response.Redirect(basePath + reportViewerPath + sampleName);
            }
            else if (isReportDesigner)
            {
                Context.RewritePath(path.Replace(path, "~/Views/ReportDesigner/Index.aspx"));
            }
            else if (isReportViewer)
            {
                Regex regex = new Regex(basePath);
                string routerPath = regex.Replace(path, "", 1).Split('/')[1];
                Context.RewritePath(path.Replace(path, "~/Views/" + routerPath + "/Index.aspx"));
            }

        }
    }
}