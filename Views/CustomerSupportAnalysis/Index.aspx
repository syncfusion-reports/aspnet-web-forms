<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ReportsWebFormsSamples.Views.CustomerSupportAnalysis.CustomerSupportAnalysis" %>

<%@ Register Assembly="Syncfusion.Reporting.WebForms" Namespace="Syncfusion.Reporting.WebForms" TagPrefix="SF" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<SF:ReportViewer runat="server" ID="Reports" ReportPath="customer-support-analysis" ReportServiceUrl='<%# Globals.SERVICE_URL %>' OnClientToolbarRendering="onToolbarRendering" OnClientToolBarItemClick="onToolBarItemClick"></SF:ReportViewer>

</asp:Content>