<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtReq.aspx.cs" Inherits="DocPortal.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" lang="en">
    <title>Media Artwork Request Form</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="scripts/modernizr-2.6.2.js"></script>
    <script src="scripts/jquery-1.10.2.js"></script>   
    <script src="scripts/jquery-1.10.2.min.js"></script>
    <script src="scripts/_references.js"></script>
    <script src="scripts/bootstrap.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/respond.js"></script>
    <script src="scripts/respond.min.js"></script>
    
    <script src="scripts/WebForms/Menu.js"></script>
    <script src="scripts/WebForms/MenuStandards.js"></script>
   
    <script src="scripts/WebForms/WebForms.js"></script>
    <script src="scripts/WebForms/WebParts.js"></script>

<link rel="stylesheet" type="text/css" href="Content/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="Content/Site.css" />
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
  <a class="navbar-brand" href="Default.aspx">Home</a>                  
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        
                        <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >Forms<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Forms.aspx">About Forms</a></li>
                                <li><a href="ArtReq.aspx">Artwork Request Form</a></li>
                                <li><a href="CvrLtrReq.aspx">Cover Letter Request Form</a></li>
                            </ul>
                        </li>
                        <li><a href="Templates.aspx">Templates</a></li>
                        <!--<li><a href="ProgDoc.aspx">Program Docs</a></li> -->                    
                        <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >Product Docs<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="ProdDoc.aspx">Product Docs</a></li>
                                <li><a href="ZTSeriesDocumentation.htm">ZT Docs</a></li>                              
                            </ul>
                        </li>
                        <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" >About<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Projects.aspx">Project Assignments</a></li>
                                <li><a href="Contact.aspx">Contact</a></li>
                                <li><a href="../webHelp/KnowledgeBase.htm">Doc Dept KB</a></li>
                            </ul>
                        </li>
                        <li><a href="Feedback.aspx">Tell Us</a></li>
                        
                    </ul>
                    
                </div>
           
            </div>
        </div>
        <div class="container body-content">
    <form id="form1" runat="server">
    <div>
    <h1>Media Artwork Request Form</h1>
    <p>CD/DVD Title: 
        <asp:TextBox ID="txtTitle" runat="server" Width="250px"></asp:TextBox>
        <span class="top">*</span><asp:RequiredFieldValidator ID="reqFieldTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="Enter a title." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>Part Number: 
            <asp:TextBox ID="txtPartNum" runat="server" Width="250px"></asp:TextBox>
        <span class="top">*</span><asp:RequiredFieldValidator ID="reqFieldPart" runat="server" ControlToValidate="txtPartNum" ErrorMessage="Enter a part number." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>

        <p>Project: 
            <asp:DropDownList ID="drpDwnProject" runat="server" Width="247px" ForeColor="#003893">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Ai-710</asp:ListItem>
                <asp:ListItem>Ai-760</asp:ListItem>
                <asp:ListItem>Bi4-Series</asp:ListItem>
                <asp:ListItem>Boundary Scan</asp:ListItem>
                <asp:ListItem>CATE</asp:ListItem>
                <asp:ListItem>CShell</asp:ListItem>
                <asp:ListItem>CTS</asp:ListItem>
                <asp:ListItem>Diagnostics</asp:ListItem>
                <asp:ListItem>Digital Runtime</asp:ListItem>
                <asp:ListItem>Di-Series</asp:ListItem>
                <asp:ListItem>eDigital</asp:ListItem>
                <asp:ListItem>Fibre Channel</asp:ListItem>
                <asp:ListItem>HSSub</asp:ListItem>
                <asp:ListItem>iStudio</asp:ListItem>
                <asp:ListItem>M9-Series</asp:ListItem>
                <asp:ListItem>MPi (Probe Buffer)</asp:ListItem>
                <asp:ListItem>Spectrum</asp:ListItem>
                <asp:ListItem>System Manager</asp:ListItem>
                <asp:ListItem>TestStudio</asp:ListItem>
                <asp:ListItem>TC Studio</asp:ListItem>
                <asp:ListItem>VERTA</asp:ListItem>
                <asp:ListItem>ZT-Series</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:DropDownList>
            <span class="top">*</span><asp:RequiredFieldValidator ID="reqValProjList" runat="server" ErrorMessage="Select a project" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red" ControlToValidate="drpDwnProject"></asp:RequiredFieldValidator>
        </p>

    <div class="row">
     
     <div class="col-md-4">
        <p>Media:<span class="top">*</span> 
            <asp:RadioButtonList ID="radMedia" runat="server" CellPadding="1" CellSpacing="1" CssClass="radio">
                <asp:ListItem>CD</asp:ListItem>
                <asp:ListItem>DVD</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="reqFieldMedia" runat="server" ControlToValidate="radMedia" ErrorMessage="Select one." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
    </div>
        <div class="col-md-4">
        <p>Number of blank discs required: 
            <asp:DropDownList ID="dropDwnCDs" runat="server" ForeColor="#003893">
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
            </asp:DropDownList>
        </p>
            </div>
   <div class="col-md-4"><p>Is this product under ITAR control:<span class="top">*</span> <asp:RadioButtonList ID="radITAR" runat="server" CssClass="radio">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="reqFieldITAR" runat="server" ControlToValidate="radITAR" ErrorMessage="Select one." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
     </div> 

    </div>      
    
        <p>Other Info: <asp:TextBox ID="txtOther" runat="server" Width="250px" MaxLength="100"></asp:TextBox>
        </p>
        <p>Reviewers: 
            <asp:TextBox ID="txtReviewers" runat="server" Width="250px" MaxLength="100"></asp:TextBox>
        </p>
        <p>Deliver Media To: 
            <asp:TextBox ID="txtDeliver" runat="server" Width="250px" MaxLength="50"></asp:TextBox>
        <span class="top">*</span><asp:RequiredFieldValidator ID="reqFieldDeliver" runat="server" ControlToValidate="txtDeliver" ErrorMessage="Enter a name." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            
            <br />Note: this is the person who will be burning the media.</p>
    <div>
    <p>Date Needed By:<span class="top">*</span> <asp:Calendar ID="Calendar1" runat="server"  SelectedDate="<%# DateTime.Today %>" Height="75px" Width="75px" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar><asp:Label ID="lblCalDateErrorArt" runat="server" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red" Text="You cannot select a date in the past." Visible="False"></asp:Label></p>
        <p>The discs will be delivered to the person indicated in the <i>Deliver media to</i> field on this date.</p></div>
    
            <p>Enter Your Email Address: <asp:TextBox ID="txtEmail" runat="server" Width="300px" MaxLength="150"></asp:TextBox>
        <span class="top">*</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter your email address in proper format." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter your email address!" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
       
        <p class="center"><asp:Button ID="btnSubmitMedia" runat="server" OnClick="submitButton_Click" Text="Submit Your Request" /></p>
    </div>
	
    </form></div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        }); 
    </script>
</body>
</html>
