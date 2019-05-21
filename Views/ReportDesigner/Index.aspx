<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.Designer.Designer" %>

<%@ Register Assembly="Syncfusion.Reporting.WebForms" Namespace="Syncfusion.Reporting.WebForms" TagPrefix="SF" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <SF:ReportDesigner ID="designer" runat="server" ServiceUrl='<%# Globals.DESIGNER_SERVICE_URL %>' OnClientCreate="controlCreate" OnClientToolbarRendering="toolbarRendering" OnClientToolbarClick="toolbarClick"></SF:ReportDesigner>

    
<script>
    function controlCreate() {
        var designer = $("<%=designer.ClientID%>").data('ejReportDesigner');
        this.openReport(location.search.split('=')[1]);
    }
    function toolbarRendering(args) {
        if ($(args.target).hasClass('e-rptdesigner-toolbarcontainer')) {
            var saveButton = ej.buildTag('li.e-rptdesigner-toolbarli e-designer-toolbar-align e-tooltxt', '', {}, {});
            var saveIcon = ej.buildTag('span.e-rptdesigner-toolbar-icon e-toolbarfonticonbasic e-rptdesigner-toolbar-save e-li-item', '', {}, { title: 'Save' });
            args.target.find('ul:first').append(saveButton.append(saveIcon));
        }
    }
    function toolbarClick(args) {
        if (args.click === 'Save') {
            args.cancel = true;
            this.saveToDevice();
        }
    }
</script>
</asp:Content>

