<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogonFrm.aspx.cs" Inherits="StrictlyClubs.LogonFrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">                   

   
            <asp:Button ID="closelogonbtn" onclick="closelogonbtn_Click" runat="server"  CssClass="close" Text="X" />

                    <h3>
                       Please log on
                    </h3>
                    <img height="200" width="200" class="img-circle" src="logo/gym-dumbbell-black-silhouette-icons--free-download-20.jpg" />                    

				</div>
                
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                
                    <!-- Begin # Login Form 
                    <form id="login-form">
                        -->

		                <div class="modal-body">
				    		<div id="div-login-msg">
                                <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-login-msg">Type your username and password.</span>
                            </div>
				    		<input runat="server" id="txtUserName" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required="required"/>
				    		<input runat="server" id="txtUserPass" class="form-control" type="password" placeholder="Password" required="required"/>

                            <ASP:CheckBox Visible="false" id="chkPersistCookie" runat="server" autopostback="false" />

        		    	</div>
				        <div class="modal-footer">
                            <div>
                               <asp:Button  CssClass="btn btn-primary btn-lg btn-block" ID="loginbtn" runat="server" OnClick="loginbtn_Click" Text="Login" />
                            </div>
				    	    <div>
                                <asp:LinkButton ID="forgotpass" OnClick="forgotpass_Click"  runat="server">Forgot Password?</asp:LinkButton>
                            </div>
				        </div>
                                                                            
                </div>
                  
                
			</div>

            
		</div>


</asp:Content>
