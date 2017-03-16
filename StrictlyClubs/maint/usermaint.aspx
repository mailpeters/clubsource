<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="usermaint.aspx.cs" Inherits="StrictlyClubs.maint.usermaint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  	
  <div class="container">

  <div class="panel panel-default">

    <div class="panel-body" >
	            
        <div>
            <h4 class="modal-title">User List</h4>
            <asp:GridView ID="UserGrid" runat="server"
                Width="940px" HorizontalAlign="Center"
                OnRowCommand="UserGridRowCommand"
                AutoGenerateColumns="false" AllowPaging="false"
                DataKeyNames="userID"
                CssClass="table table-striped table-bordered table-condensed">
                <Columns>
                    <asp:BoundField DataField="username" HeaderText="User Name" />
                    <asp:BoundField DataField="firstname" HeaderText="First Name" />
                    <asp:BoundField DataField="lastname" HeaderText="Last Name" />
                    <asp:BoundField DataField="initial" HeaderText="Initial" />
                    <asp:BoundField DataField="email" HeaderText="E-mail" />
                    <asp:ButtonField CommandName="detail" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="InsertUser" CssClass="btn btn-info" runat="server" Text="New User" OnClick="InsertUser_Click" />
            <br />

        </div>

	 
   </div>
       
       <div class="panel-body">
         <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">User Details</h4>
                        </div>
                    
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Username or Email</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userusername" class="form-control" type="text" required="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">First name</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userfirstname" class="form-control" type="text"  required="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Last</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userlastname" class="form-control" type="text"  required="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Initial</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userinitial" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">E-mail Address</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="useremail" class="form-control" type="text"  required="required"/>
                                            </div>
                                        </div>
                                    </div>

                                    
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">SSN</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userSSN" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">DL Number</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userDLNumber" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">DL State</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userDLState" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>
                                                                        
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Notes</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="usernotes" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>

                                                                                                          
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Work Phone</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userworkphone" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>

                                                                                                          
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Extension</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userextension" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>

                                                                                                          
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Cell Phone</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="usercellphone" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>
                                                                                                          
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">FAX</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userfaxphone" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>

                                                                                                          
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Home Phone</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userhomephone" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>   

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">User Status</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                  <label><input runat="server"  id="useractive" type="checkbox" value=""/>Active</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">User Access Level</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                  <label><input runat="server"  id="usersuperuser" type="checkbox" value=""/>SuperUser</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   
                                              
                        <div class="modal-footer">
                            <asp:Button ID="btnSaveUser" runat="server" Text="Save"   CssClass="btn btn-primary" onclick="btnSaveUser_Click" />  
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
            </div>

  
  </div>
</div>

</asp:Content>
