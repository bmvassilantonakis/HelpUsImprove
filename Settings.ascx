<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="PWGR.Modules.HelpUsImprove.Settings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="dnnFormItem">
    <dnn:label id="SendMailToLabel" runat="server" controlname="SendMailTo" suffix=":"></dnn:label>
    <asp:TextBox ID="SendMailToTextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="SendMailFromLabel" runat="server" controlname="SendMailFrom" suffix=":"></dnn:label>
    <asp:TextBox ID="SendMailFromTextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="dnnFormItem">
    <dnn:label id="reCAPTCHAWebSiteLabel" runat="server" controlname="reCAPTCHAWebSite" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHAWebSiteTextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASiteKeyLabel" runat="server" controlname="reCAPTCHASiteKey" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASiteKeyTextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASecretKeyLabel" runat="server" controlname="reCAPTCHASecretKey" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASecretKeyTextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<%--<div class="dnnFormItem">
    <dnn:label id="reCAPTCHAWebSite1Label" runat="server" controlname="reCAPTCHAWebSite1" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHAWebSite1TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASiteKey1Label" runat="server" controlname="reCAPTCHASiteKey1" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASiteKey1TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASecretKey1Label" runat="server" controlname="reCAPTCHASecretKey1" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASecretKey1TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>


<div class="dnnFormItem">
    <dnn:label id="reCAPTCHAWebSite2Label" runat="server" controlname="reCAPTCHAWebSite2" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHAWebSite2TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASiteKey2Label" runat="server" controlname="reCAPTCHASiteKey2" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASiteKey2TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASecretKey2Label" runat="server" controlname="reCAPTCHASecretKey2" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASecretKey2TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="dnnFormItem">
    <dnn:label id="reCAPTCHAWebSite3Label" runat="server" controlname="reCAPTCHAWebSite3" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHAWebSite3TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASiteKey3Label" runat="server" controlname="reCAPTCHASiteKey3" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASiteKey3TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASecretKey3Label" runat="server" controlname="reCAPTCHASecretKey3" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASecretKey3TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="dnnFormItem">
    <dnn:label id="reCAPTCHAWebSite4Label" runat="server" controlname="reCAPTCHAWebSite4" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHAWebSite4TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASiteKey4Label" runat="server" controlname="reCAPTCHASiteKey4" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASiteKey4TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASecretKey4Label" runat="server" controlname="reCAPTCHASecretKey4" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASecretKey4TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>

<div class="dnnFormItem">
    <dnn:label id="reCAPTCHAWebSite5Label" runat="server" controlname="reCAPTCHAWebSite5" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHAWebSite5TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASiteKey5Label" runat="server" controlname="reCAPTCHASiteKey5" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASiteKey5TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="dnnFormItem">
    <dnn:label id="reCAPTCHASecretKey5Label" runat="server" controlname="reCAPTCHASecretKey5" suffix=":"></dnn:label>
    <asp:TextBox ID="reCAPTCHASecretKey5TextBox" runat="server" CssClass="form-control"></asp:TextBox>
</div>--%>