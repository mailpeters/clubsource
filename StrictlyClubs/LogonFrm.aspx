<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogonFrm.aspx.cs" Inherits="StrictlyClubs.LogonFrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>
   <font face="Verdana">Logon Page</font>
</h3>
<table>
   <tr>
      <td>Email:</td>
      <td><input id="txtUserName" type="text" runat="server"></td>
      <td><ASP:RequiredFieldValidator ControlToValidate="txtUserName"
           Display="Static" ErrorMessage="*" runat="server" 
           ID="vUserName" /></td>
   </tr>
   <tr>
      <td>Password:</td>
      <td><input id="txtUserPass" type="password" runat="server"></td>
      <td><ASP:RequiredFieldValidator ControlToValidate="txtUserPass"
          Display="Static" ErrorMessage="*" runat="server" 
          ID="vUserPass" />
      </td>
   </tr>
   <tr>
      <td>Persistent Cookie:</td>
      <td><ASP:CheckBox id="chkPersistCookie" runat="server" autopostback="false" /></td>
      <td>
       </td>
   </tr>
</table>

<input type="submit" Value="Logon" runat="server" ID="cmdLogin"/><p>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
</p>

</asp:Content>
