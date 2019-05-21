using Syncfusion.Reporting.Models.ReportDesigner;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReportsWebFormsSamples.Views.Designer
{
    public partial class Designer : Preview
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.designer.ToolbarSettings.Items = Syncfusion.Reporting.ReportDesignerEnums.ToolbarItems.All & ~Syncfusion.Reporting.ReportDesignerEnums.ToolbarItems.Save;
            this.designer.ReportItemExtensions = new List<ReportItemExtensionsModule>();
            this.designer.ReportItemExtensions.Add(new ReportItemExtensionsModule()
            {
                Name = "barcode",
                ClassName = "EJBarcode",
                ImageClass = "customitem-barcode",
                DisplayName = "1D Barcode",
                Category = "Barcodes"
            });
            this.designer.ReportItemExtensions.Add(new ReportItemExtensionsModule()
            {
                Name = "qrbarcode",
                ClassName = "EJQRBarcode",
                ImageClass = "customitem-qrbarcode",
                DisplayName = "QR Barcode",
                Category = "Barcodes"
            });

        }
    }
}