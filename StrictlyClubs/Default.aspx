<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StrictlyClubs.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <h1> default content </h1>

        <iframe src="\banner\index.html" frameborder="0" style="margin:0;padding:0;border:none;background-color:transparent" allowtransparency="true" scrolling="no" width="900" height="350"></iframe>

   
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

   
    <input type="submit" value="SignOut" runat="server" id="cmdSignOut"/>




</asp:Content>
