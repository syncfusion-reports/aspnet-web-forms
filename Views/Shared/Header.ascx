﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="ReportsWebFormsSamples.Header" %>
<link href="<%=Page.ResolveUrl("~/Content/css/common/header.css")%>" rel="stylesheet" />

<div class="ej-sb-header">
    <div class="ej-sb-left-side">
        <div class="ej-sb-hamburger-icon ej-sb-icons" onclick="onHamBurgerClick()"></div>
        <div class="ej-sb-platform-name">Reports for ASP.NET WebForms</div>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                <% 
                    dynamic data = sampledata;
                    { %>
                <a class="dropdown-item active"><%= data.platform %></a>
                <% }
                    foreach (var platform in data.otherPlatforms)
                    { %>
                <a class="dropdown-item" onclick='onDdlClick("<%= platform.Name%>")'><%= platform.Name %></a>
                <% }
                %>
            </div>
        </div>
    </div>
    <div class="ej-sb-right-side">
        <a href="https://reports.syncfusion.com/documentation" title="Documentation" target="_blank">
            <span class="ej-sb-header-icons sb-icon-documentation"></span>
        </a>
        <a href="https://www.syncfusion.com/reporting-tool" target="_blank" title="Product Details">
            <span class="ej-sb-header-icons sb-icon-product"></span>
        </a>
        <a href="https://www.syncfusion.com/downloads/report" target="_blank" title="Download Now">
            <span class="ej-sb-header-icons sb-icon-download"></span>
        </a>
        <div class="ej-sb-divider"></div>
        <a class="ej-sb-button" href="https://reportserver.syncfusion.com" title="Report Server" target="_blank">Explore Report Server</a>
    </div>
</div>
<script src="<%=Page.ResolveUrl("~/Scripts/common/header.js")%>"></script>
