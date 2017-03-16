<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeadmanagerFrm.aspx.cs" Inherits="StrictlyClubs.Lead.LeadmanagerFrm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	
    <div class="container">

        <div class="panel panel-default">

            <div class="panel-body">

                <div>
                    <h4 class="modal-title">Leads</h4>
                    <asp:GridView ID="LeadGrid" runat="server"
                        Width="940px" HorizontalAlign="Center"
                        OnRowCommand="LeadGridRowCommand"
                        AutoGenerateColumns="false" AllowPaging="false"
                        DataKeyNames="leadID"
                        CssClass="table table-striped table-bordered table-condensed">
                        <Columns>
                            <asp:BoundField DataField="firstname" HeaderText="First Name" />
                            <asp:BoundField DataField="lastname" HeaderText="Last Name" />
                            <asp:BoundField DataField="homephone" HeaderText="Home" />
                            <asp:BoundField DataField="cellphone" HeaderText="Cell" />
                            <asp:BoundField DataField="email" HeaderText="E-mail" />
                            <asp:ButtonField CommandName="detail" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="" />
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="Insertlead" CssClass="btn btn-info" runat="server" Text="New Lead" OnClick="InsertLead_Click" />
                    <br />

                </div>


            </div>


        </div>

    </div>


</asp:Content>
