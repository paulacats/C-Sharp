<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CvrLtrReq.aspx.cs" Inherits="DocPortal.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" lang="en">
   <title>Cover Letter Request Form</title>
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
            
            
    <h1>Cover Letter Request Form</h1>
    <form id="form1" runat="server">
    <div>
    <p>Project Name and Version (Cover Letter Title and Version)</p>        
        <asp:TextBox ID="cvrLtrTitle" runat="server" Height="57px" Width="585px" MaxLength="300"></asp:TextBox>
        <span class="top">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="cvrLtrTitle" ErrorMessage="Enter the project name." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
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
    <div class="outline">
    <h2>All Parts Included with this Shipment:</h2>
        
         <p>Part Number: <asp:TextBox ID="partNum1" runat="server" Width="100px" MaxLength="15"></asp:TextBox>
        <span class="top">*</span>
             <asp:RequiredFieldValidator ID="RequiredFieldValidatorPartNum" runat="server" ControlToValidate="partNum1" ErrorMessage="You must enter at least one part number." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
        <p>Description: <asp:TextBox ID="descPartNum1" runat="server" Width="300px" MaxLength="150"></asp:TextBox> 
        <span class="top">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidatorDesc" runat="server" ControlToValidate="descPartNum1" ErrorMessage="You must enter a description for the part number." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>Other Info: <asp:TextBox ID="otherPartNum1" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
           <p class="underline"></p>
         <p>Part Number: <asp:TextBox ID="partNum2" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
         <p>Description: <asp:TextBox ID="descPartNum2" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>        
         <p>Other Info: <asp:TextBox ID="otherPartNum2" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
        <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum3" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
          <p>Description: <asp:TextBox ID="descPartNum3" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
        <p>Other Info: <asp:TextBox ID="otherPartNum3" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
       <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum4" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
         <p>Description: <asp:TextBox ID="descPartNum4" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
         <p>Other Info: <asp:TextBox ID="otherPartNum4" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
       <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum5" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
         <p>Description: <asp:TextBox ID="descPartNum5" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
         <p>Other Info: <asp:TextBox ID="otherPartNum5" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
        <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum6" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
         <p>Description: <asp:TextBox ID="descPartNum6" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
        <p>Other Info: <asp:TextBox ID="otherPartNum6" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
        <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum7" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
          <p>Description: <asp:TextBox ID="descPartNum7" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
         <p>Other Info: <asp:TextBox ID="otherPartNum7" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
       <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum8" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
         <p>Description: <asp:TextBox ID="descPartNum8" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
        <p>Other Info: <asp:TextBox ID="otherPartNum8" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
       <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum9" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
         <p>Description: <asp:TextBox ID="descPartNum9" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
        <p>Other Info: <asp:TextBox ID="otherPartNum9" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
       <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum10" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
         <p>Description: <asp:TextBox ID="descPartNum10" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
         <p>Other Info: <asp:TextBox ID="otherPartNum10" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
       <p class="underline"></p>
        <p>Part Number: <asp:TextBox ID="partNum11" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
        <p>Description: <asp:TextBox ID="descPartNum11" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
        <p>Other Info: <asp:TextBox ID="otherPartNum11" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
       <p class="underline"></p>
          <p>Part Number: <asp:TextBox ID="partNum12" runat="server" Width="100px" MaxLength="15"></asp:TextBox></p>
         <p>Description: <asp:TextBox ID="descPartNum12" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>
         <p>Other Info: <asp:TextBox ID="otherPartNum12" runat="server" Width="300px" MaxLength="150"></asp:TextBox></p>   
 
    </div>
        
        <p>Software Download Instructions <i>(Custom Spectrum only)</i><br /><asp:TextBox ID="swDownloadInst" runat="server" Width="790px" MaxLength="150">C:\Users\Public\Teradyne\SPECTRUM 9000-Checkers\Documentation\SW Download Procedure\</asp:TextBox>
        </p>
        <p>Installation and Readme<i> (High Speed Subsystem only)</i><br /><asp:TextBox ID="hssubReadme" runat="server" Width="600px" MaxLength="150"></asp:TextBox>            
        </p>
        <p>Reviewers:<br /><asp:TextBox ID="reviewers" runat="server" Height="92px" Width="413px" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
        </p>
        <div>
        <p>Date Needed By: <asp:Calendar ID="Calendar1" runat="server" SelectedDate="<%# DateTime.Today %>" Height="75px" Width="75px" OnSelectionChanged="Calendar1_SelectionChanged"> </asp:Calendar></p>
            
           <p> <asp:Label ID="lblCalDateError" runat="server" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red" Text="You cannot select a date in the past." Visible="False"></asp:Label>        </p> </div>
            <p>Enter Your Email Address:<asp:TextBox ID="email" runat="server" Width="300px" MaxLength="150"></asp:TextBox>
        <span class="top">*</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Enter your email address in proper format." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="email" ErrorMessage="You must enter your email address!" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
       
        <p class="center"><asp:Button ID="btnSubmitLtr" runat="server" OnClick="submitButton_Click" Text="Submit Your Request" /></p>
    </div>
       
    </form> </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.dropdown-toggle').dropdown();
        }); 
    </script>
</body>
</html>
