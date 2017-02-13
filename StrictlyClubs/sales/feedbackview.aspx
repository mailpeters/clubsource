<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="feedbackview.aspx.cs" Inherits="StrictlyClubs.sale.feedbackview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="keyfield" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="keyfield" HeaderText="keyfield" InsertVisible="False" ReadOnly="True" SortExpression="keyfield" />
            <asp:BoundField DataField="entrydate" HeaderText="entrydate" SortExpression="entrydate" />
            <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
            <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:BoundField DataField="zipcode" HeaderText="zipcode" SortExpression="zipcode" />
            <asp:BoundField DataField="website" HeaderText="website" SortExpression="website" />
            <asp:CheckBoxField DataField="hosting" HeaderText="hosting" SortExpression="hosting" />
            <asp:BoundField DataField="notes" HeaderText="notes" SortExpression="notes" />
        </Columns>
</asp:GridView>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strictlyclubsConnectionString %>" SelectCommand="SELECT * FROM [feedback]"></asp:SqlDataSource>


</asp:Content>
