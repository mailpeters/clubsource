<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClubWizard.aspx.cs" Inherits="StrictlyClubs.Club.ClubWizard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
<style>


.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}


        .wizard {
            margin: 2px auto;
            background: #fff;
        }

        .wizard .nav-tabs {
            position: relative;
            margin: 0px auto;
            margin-bottom: 0;
            border-bottom-color: #e0e0e0;
                 
        }

        .wizard > div.wizard-inner {
            position: relative;

        }

        .connecting-line {
            height: 2px;
            background: #e0e0e0;
            position: absolute;
            width: 80%;
            margin: 0 auto;
            left: 0;
            right: 0;
            top: 50%;
            z-index: 1;
        }

        .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
            color: #555555;
            cursor: default;
            border: 0;
            border-bottom-color: transparent;
        }

        span.round-tab {
            width: 70px;
            height: 70px;
            line-height: 70px;
            display: inline-block;
            border-radius: 100px;
            background: #fff;
            border: 2px solid #e0e0e0;
            z-index: 2;
            position: absolute;
            left: 0;
            text-align: center;
            font-size: 25px;
        }
        span.round-tab i{
            color:#555555;
        }
        .wizard li.active span.round-tab {
            background: #fff;
            border: 2px solid #5bc0de;
    
        }
        .wizard li.active span.round-tab i{
            color: #5bc0de;
        }

        span.round-tab:hover {
            color: #333;
            border: 2px solid #333;
        }

        .wizard .nav-tabs > li {
            width: 25%;
            top: 0px;
            left: 0px;
        }

        .wizard li:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 0;
            margin: 0 auto;
            bottom: 0px;
            border: 5px solid transparent;
            border-bottom-color: #5bc0de;
            transition: 0.1s ease-in-out;
        }

        .wizard li.active:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 1;
            margin: 0 auto;
            bottom: 0px;
            border: 10px solid transparent;
            border-bottom-color: #5bc0de;
        }

        .wizard .nav-tabs > li a {
            width: 70px;
            height: 70px;
            margin: 20px auto;
            border-radius: 100%;
            padding: 0;
        }

        .wizard .nav-tabs > li a:hover {
            background: transparent;
        }

        .wizard .tab-pane {
            position: relative;
            padding-top: 50px;
        }

        .wizard h3 {
            margin-top: 0;
        }

    @media( max-width : 585px ) {

    .wizard {
        width: 90%;
        height: auto !important;
    }

    span.round-tab {
        font-size: 16px;
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard .nav-tabs > li a {
        width: 50px;
        height: 50px;
        line-height: 50px;
    }

    .wizard li.active:after {
        content: " ";
        position: absolute;
        left: 35%;
    }
}


#wizHeader li .prevStep
{
    background-color: #669966;
}
#wizHeader li .prevStep:after
{
    border-left-color:#669966 !important;
}
#wizHeader li .currentStep
{
    background-color: #C36615;
}
#wizHeader li .currentStep:after
{
    border-left-color: #C36615 !important;
}
#wizHeader li .nextStep
{
    background-color:#C2C2C2;
}
#wizHeader li .nextStep:after
{
    border-left-color:#C2C2C2 !important;
}
#wizHeader
{
    list-style: none;
    overflow: hidden;
    font: 18px Helvetica, Arial, Sans-Serif;
    margin: 0px;
    padding: 0px;
}
#wizHeader li
{
    float: left;
}
#wizHeader li a
{
    color: white;
    text-decoration: none;
    padding: 10px 0 10px 55px;
    background: brown; /* fallback color */
    background: hsla(34,85%,35%,1);
    position: relative;
    display: block;
    float: left;
}
#wizHeader li a:after
{
    content: " ";
    display: block;
    width: 0;
    height: 0;
    border-top: 50px solid transparent; /* Go big on the size, and let overflow hide */
    border-bottom: 50px solid transparent;
    border-left: 30px solid hsla(34,85%,35%,1);
    position: absolute;
    top: 50%;
    margin-top: -50px;
    left: 100%;
    z-index: 2;
}
#wizHeader li a:before
{
    content: " ";
    display: block;
    width: 0;
    height: 0;
    border-top: 50px solid transparent;
    border-bottom: 50px solid transparent;
    border-left: 30px solid white;
    position: absolute;
    top: 50%;
    margin-top: -50px;
    margin-left: 1px;
    left: 100%;
    z-index: 1;
}        
#wizHeader li:first-child a
{
    padding-left: 10px;
}
#wizHeader li:last-child 
{
    padding-right: 50px;
}
#wizHeader li a:hover
{
    background: #FE9400;
}
#wizHeader li a:hover:after
{
    border-left-color: #FE9400 !important;
}        
.content
{
    height:150px;           
    padding-top:75px;
    text-align:center;
    background-color:#F9F9F9;
    font-size:48px;
        width: 1146px;
    }

.FormatRadioButtonList label
{
         white-space: nowrap;
        margin-right:20px;

}

</style>

    
    <!-- Text input

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    -->

    <asp:Wizard ID="Wizard1" OnNextButtonClick="Wizard1_NextButtonClick"  runat="server" DisplaySideBar="false" OnFinishButtonClick="Wizard1_FinishButtonClick" ActiveStepIndex="0" CancelButtonType="Button" StartNextButtonText="Save and Continue" StepNextButtonText="Save and Continue">
           <WizardSteps >
               <asp:WizardStep ID="WizardStep1" runat="server" Title="Owner Information">
          
    <label class="col-lg-12 control-label">Tell us about who owns/manages the club</label>  
                                          
    <div id="toppage" class="form-group">
      <label class="col-lg-3 control-label">First Name</label>  
      <div class="col-lg-9 inputGroupContainer">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input runat="server" id="firstname" name="firstname" placeholder="First Name" class="form-control"  type="text"/>
      </div>
      </div>

    </div>

    <!-- Text input-->

    <div class="form-group">
      <label class="col-lg-3 control-label" >Last Name</label> 
        <div class="col-lg-9 inputGroupContainer">
        <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input  runat="server" id="lastname" name="lastname" placeholder="Last Name" class="form-control"  type="text"/>
      </div>          
      </div>
                

    </div>

    <!-- Text input-->
           <div class="form-group">
      <label class="col-lg-3 control-label">E-Mail</label>  
        <div class="col-lg-9 inputGroupContainer">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      <input runat="server"  id="email" name="email" placeholder="E-Mail Address" class="form-control"  type="text">
            </div>
      </div>                
    </div>

    <!-- Text input-->
     <div class="form-group">
      <label class="col-lg-3 control-label">Company Name</label>  
        <div class="col-lg-9 inputGroupContainer">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      <input runat="server"  id="companyname"  class="form-control"  type="text">
            </div>
      </div>                   
    </div>

     <div class="form-group">
      <label class="col-lg-3 control-label">Password</label>  
        <div class="col-lg-9 inputGroupContainer">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
           <input runat="server"  id="password" name="password" placeholder="*********" class="form-control"  type="password">
            </div>
      </div>
               
    </div>




    <!-- Text input-->
       
    <div class="form-group">
      <label class="col-lg-3 control-label">Work Phone #</label>  
        <div class="col-lg-4 inputGroupContainer">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
            <input runat="server" id="workphone" name="workphone" placeholder="(845)555-1212" class="form-control" type="text">
            </div>
      </div>
     <div class="col-lg-3 inputGroupContainer">
        <div class="input-group">           
            <input runat="server" id="extension" name="extension" class="form-control" type="text"/>
         </div>
      </div>
    </div>

                     
    <div class="form-group">
      <label class="col-lg-3 control-label">Cell Phone #</label>  
        <div class="col-lg-9 inputGroupContainer">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
            <input runat="server" id="cellphone" name="cellphone" placeholder="(845)555-1212" class="form-control" type="text">    
            </div>
      </div>
    </div>

                   
                     
    <div class="form-group">
      <label class="col-lg-3 control-label">FAX Phone #</label>  
        <div class="col-lg-9 inputGroupContainer">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
            <input runat="server" id="faxphone"  name="faxphone" placeholder="(845)555-1212" class="form-control" type="text">      
            </div>
      </div>
    </div>


                    <div class="form-group">
                      <label class="col-lg-3 control-label">Home Phone #</label>  
                        <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="homephone" name="homephone" placeholder="(845)555-1212" class="form-control" type="text"/>
                        </div>
                      </div>
                    </div>

                                  <!-- Textarea -->
                    <div class="form-group">
                      <label class="col-lg-3 control-label" for="textarea">Club Slogan</label>
                      <div class="col-lg-9">                     
                             <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                              <textarea runat="server"  class="form-control" id="slogan" name="textarea">your slogan here</textarea>
                            </div>
                      </div>
                    </div>




                    <!-- radio group -->
                    <div class="form-group">
                             <label class="col-lg-3 control-label" for="textarea">Contact Method</label>                
                                    <asp:RadioButtonList CssClass="FormatRadioButtonList" ID="contactmethod" runat="server"  RepeatDirection="Horizontal" CellSpacing="40" CellPadding="40" RepeatLayout="Table">
                                 <asp:ListItem>tet</asp:ListItem>
                                 <asp:ListItem>34243243</asp:ListItem>
                                 <asp:ListItem>234324 23 3243</asp:ListItem>
                             </asp:RadioButtonList>      
                    
                           </div>

                   
                    <!-- radio group -->
                    <div class="form-group">
                             <label class="col-lg-3 control-label" for="textarea">Club Type</label>                
                            <asp:DropDownList ID="clienttypelist" runat="server"></asp:DropDownList>           
                           </div>


              

               </asp:WizardStep>
               
               <asp:WizardStep ID="WizardStep2" runat="server" Title="Business Addresses">     

                       <label class="col-lg-12 control-label">Enter Business Address</label>           
                       <div class="form-group">
                        <label class="col-lg-3 control-label">Mailing Address</label>  
                        <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="address1"  name="address1" placeholder="address line 1" class="form-control" type="text">
                        </div>
                        </div>
                      </div>

                       <div class="form-group">
                        <label class="col-lg-3 control-label"></label>  
                        <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="address2"  name="address2" placeholder="" class="form-control" type="text">
                        </div>
                        </div>
                      </div>

                       <div class="form-group">
                        <label class="col-lg-3 control-label">City</label>  
                        <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" ID="city"  name="city" placeholder="city" class="form-control" type="text">
                        </div>
                        </div>
                      </div>

                  <div class="form-group"> 
                          <label class="col-lg-3 control-label">State</label>
                        <div class="col-lg-9 selectContainer">
                        <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <asp:DropDownList ID="DropDownListState" runat="server">
	                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
	                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
	                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	                        <asp:ListItem Value="CA">California</asp:ListItem>
	                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
	                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
	                        <asp:ListItem Value="FL">Florida</asp:ListItem>
	                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
	                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
	                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
	                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
	                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
	                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
	                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	                        <asp:ListItem Value="ME">Maine</asp:ListItem>
	                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
	                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
	                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
	                        <asp:ListItem Value="MT">Montana</asp:ListItem>
	                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
	                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	                        <asp:ListItem Value="NY">New York</asp:ListItem>
	                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
	                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
	                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	                        <asp:ListItem Value="TX">Texas</asp:ListItem>
	                        <asp:ListItem Value="UT">Utah</asp:ListItem>
	                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
	                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
	                        <asp:ListItem Value="WA">Washington</asp:ListItem>
	                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        </div>
                        </div>



                       <div class="form-group">
                        <label class="col-lg-3 control-label">ZIP Code</label>  
                        <div class="col-lg-3 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="zip"  name="zip" placeholder="" class="form-control" type="text">
                        </div>
                        </div>
                      </div>

                                  
                   <asp:Button ID="CopyAddressBtn" runat="server" Text="Copy Address Below" OnClick="CopyAddressBtn_Click1" />


                       <div class="form-group">

                        <label class="col-lg-12 control-label">Enter Billing Address</label>                                      
                        <label class="col-lg-3 control-label">Address</label>  
                        <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="billaddress1"  name="billaddress1" placeholder="address line 1" class="form-control" type="text">
                        </div>
                        </div>
                      </div>

                       <div class="form-group">
                        <label class="col-lg-3 control-label"></label>  
                        <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="billaddress2"  name="billaddress2" placeholder="" class="form-control" type="text">
                        </div>
                        </div>
                      </div>

                       <div class="form-group">
                        <label class="col-lg-3 control-label">City</label>  
                        <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="billcity"  name="billcity" placeholder="city" class="form-control" type="text">
                        </div>
                        </div>
                      </div>

                       <div class="form-group"> 
                          <label class="col-lg-3 control-label">State</label>
                            <div class="col-lg-9 selectContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <asp:DropDownList ID="DropDownListBillState" runat="server">
	                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
	                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
	                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	                        <asp:ListItem Value="CA">California</asp:ListItem>
	                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
	                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
	                        <asp:ListItem Value="FL">Florida</asp:ListItem>
	                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
	                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
	                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
	                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
	                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
	                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
	                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	                        <asp:ListItem Value="ME">Maine</asp:ListItem>
	                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
	                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
	                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
	                        <asp:ListItem Value="MT">Montana</asp:ListItem>
	                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
	                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	                        <asp:ListItem Value="NY">New York</asp:ListItem>
	                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
	                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
	                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	                        <asp:ListItem Value="TX">Texas</asp:ListItem>
	                        <asp:ListItem Value="UT">Utah</asp:ListItem>
	                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
	                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
	                        <asp:ListItem Value="WA">Washington</asp:ListItem>
	                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        </div>
                        </div>


                       <div class="form-group">
                        <label class="col-lg-3 control-label">ZIP Code</label>  
                        <div class="col-lg-3 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="billzip"  name="billzip" placeholder="" class="form-control" type="text"/>
                       </div>
                        </div>
                      </div>
               </asp:WizardStep>


        <asp:WizardStep ID="WizardStep3" runat="server" Title="System Users">

        <label class="col-lg-12 control-label">Click "New User" to enter few users/employees that have access to this software.  You may enter more later.</label>  
	  
        <div>
	    <asp:ScriptManager ID="ScriptManager2" runat="server" />
	    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
	        <ContentTemplate>
	            <div>                  
	               <asp:GridView ID="UserGrid" runat="server"
	                        Width="940px"  HorizontalAlign="Center"
	                        OnRowCommand="UserGridRowCommand"
	                        AutoGenerateColumns="false"   AllowPaging="false"
	                        DataKeyNames="userID" 
	                        CssClass= "table table-striped table-bordered table-condensed" >
	                <Columns>
	                <asp:BoundField DataField="username" HeaderText="User Name" />
	                <asp:BoundField DataField="firstname" HeaderText="First Name" />
	                <asp:BoundField DataField="lastname" HeaderText="Last Name" />
	                <asp:BoundField DataField="initial" HeaderText="Initial" />
	                <asp:BoundField DataField="email" HeaderText="E-mail" />
	                 <asp:ButtonField CommandName="detail" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText=""  />   
	               </Columns>                   
	               </asp:GridView>       
               <asp:Button ID="InsertUser" ControlStyle-CssClass="btn btn-info" runat="server" Text="New User" OnClick="InsertUser_Click" />    
	            </div>
	        </ContentTemplate>
	    </asp:UpdatePanel>
	    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
	        <ProgressTemplate>	           	 
	        <img src="" alt="Loading.. Please wait!"/>
	        </ProgressTemplate>
	    </asp:UpdateProgress>
	    </div>

  
        <div class="modal fade" id="myModal2">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Edit User</h4>
                        </div>
                        <div class="modal-body">

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">username</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userusername" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">first name</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userfirstname" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Last</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="userlastname" class="form-control" type="text"/>
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
                                        <label class="col-lg-3 control-label">email</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input runat="server" id="useremail" class="form-control" type="text"/>
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
                                        <label class="col-lg-3 control-label">notes</label>
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
                                                  <label><input runat="server"  id="useractive" type="checkbox" value="">Active</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">User Access</label>
                                        <div class="col-lg-9 inputGroupContainer">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                  <label><input runat="server"  id="usersuperuser" type="checkbox" value="">SuperUser</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   


                                </ContentTemplate>
                            </asp:UpdatePanel>

                                                                     <!-- radio group
   
            userpassword.value = "";
            useruseraddressID.value = "";
        
            userpwexpiredate.value = "";
                                                 -->
   

                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSaveUser" runat="server" Text="Save"  class="btn btn-primary" onclick="btnSaveUser_Click" />  
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

               </asp:WizardStep>
               
               <asp:WizardStep ID="WizardStep4" runat="server" Title="Club Location">        
               <label class="col-lg-12 control-label">Enter the club details</label>  
                                                       
                <div class="form-group">
                    <label class="col-lg-3 control-label">Club Name</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="clubname" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>
                     <div class="form-group">
                    <label class="col-lg-3 control-label">Club Email</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="clubemail" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>
                  
                 <label class="col-lg-12 control-label"> *</label>


                <div class="form-group">
                    <label class="col-lg-3 control-label">Address</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="clubaddress1" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label"></label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="clubaddress2" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">City</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="clubcity" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>

                  <div class="form-group"> 
                        <label class="col-lg-3 control-label">State, ZIP</label>
                        <div class="col-lg-3 selectContainer">
                        <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <asp:DropDownList ID="clubstateDDL" runat="server">
	                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
	                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
	                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	                        <asp:ListItem Value="CA">California</asp:ListItem>
	                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
	                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
	                        <asp:ListItem Value="FL">Florida</asp:ListItem>
	                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
	                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
	                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
	                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
	                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
	                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
	                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	                        <asp:ListItem Value="ME">Maine</asp:ListItem>
	                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
	                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
	                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
	                        <asp:ListItem Value="MT">Montana</asp:ListItem>
	                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
	                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	                        <asp:ListItem Value="NY">New York</asp:ListItem>
	                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
	                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
	                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	                        <asp:ListItem Value="TX">Texas</asp:ListItem>
	                        <asp:ListItem Value="UT">Utah</asp:ListItem>
	                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
	                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
	                        <asp:ListItem Value="WA">Washington</asp:ListItem>
	                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        </div>
                            <div class="col-lg-6 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                    <input runat="server" id="clubzip" class="form-control" type="text"/>
                                </div>
                            </div>
                        </div>

                 <label class="col-lg-12 control-label"> *</label>
                   
                <div class="form-group">
                    <label class="col-lg-3 control-label">Manager first name</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="managerfirst" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Manager last name</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="managerlast" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Manager Phone</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="managerphone" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">manager email</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="manageremail" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>
                       

              <label class="col-lg-12 control-label"> *</label>
              <div class="form-group">
                    <label class="col-lg-3 control-label">Club Logo File</label>
                    <div class="col-lg-9 inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input runat="server" id="logofilelocation" class="form-control" type="text"/>
                        </div>
                    </div>
                </div>
                                  
               </asp:WizardStep>

               <asp:WizardStep ID="WizardStep5" runat="server" Title="Club Options">

                   <label class="col-lg-12 control-label">Choose your club options</label>  
                   <div class="content">This is Step 4</div>
               </asp:WizardStep>
      

          </WizardSteps>

           <HeaderTemplate>
               <ul id="wizHeader">
                   <asp:Repeater ID="SideBarList" runat="server">
                       <ItemTemplate>
                           <li><a class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Name")%>">
                               <%# Eval("Name")%></a> </li>
                       </ItemTemplate>
                   </asp:Repeater>
               </ul>
           </HeaderTemplate>

       </asp:Wizard>


</asp:Content>
