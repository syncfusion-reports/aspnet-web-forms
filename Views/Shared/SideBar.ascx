<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBar.ascx.cs" Inherits="ReportsWebFormsSamples.Common.SideBar" %>

<link href="<%=Page.ResolveUrl("~/Content/css/common/sidebar.css")%>" rel="stylesheet" />
<div class="ej-sidebar-content">
    <div class="ej-sb-home ej-sb-icons" onclick="onHomeBtnClick()">
        <span class="ej-sb-home-text">Home</span>
    </div>
    <div class="ej-sb-toc">
        <% 
            dynamic data = sampledata;
            for (int i = 0; i < data.samples.Count; i++)
            {
                string basePath = Page.ResolveUrl("~/");
                var sample = data.samples[i];
                string imagePath = basePath + "Content/assets/sidebar/" + sample.imageDetails.imageName;
                string isLandscape = (bool)sample.imageDetails.isLandscape ? "ej-landscape" : "ej-portrait";

                { %>
        <div class="ej-sb-toc-card" onclick="onTocClick({index:'<%= i %>', e:event})" data-mode="<%= isLandscape %>" tabindex="-1">
            <img src="<%= imagePath %>" alt="<%= sample.sampleName %>" />
            <div class="ej-sb-toc-title"><%=  sample.sampleName %></div>
        </div>
        <% }
            }
        %>
    </div>
</div>
<script src="<%=Page.ResolveUrl("~/Scripts/common/sidebar.js")%>"></script>

