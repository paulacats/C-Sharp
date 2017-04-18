using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Data.SQLite;


namespace DocPortal
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //set the default calendar date

            //get current date
            var today = System.DateTime.Now;
            
            //set the calendar date to the current date + 1 as the default
            Calendar1.SelectedDate = today.AddDays(1);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //get current date
            var today = System.DateTime.Now;
            var chosenDate = Calendar1.SelectedDate;

            //if the selected date is less than today, display error message
            if (chosenDate < today)
            {
                lblCalDateError.Visible = true;
            }

        }

        protected void SendErrorNotice()
        {
            string toAddress = "paula.hodgkins@mycompany.com";
            string subjectLine = "Error Notice: Cover Letter Request";
            string textBody = "There was an error processing the cover letter request.";
            
            //send the email
            ProcessMail myMail = new ProcessMail();
            myMail.SendMail(toAddress, subjectLine, textBody);
        }

        //this function gathers the text from the form fields and uses them to build the string used for either the cover letter file or the email body text
        protected String fieldNameConversion(Boolean x)
        {
            //declare variables
            string theDetails = "";
            string allTheDetails = "";
            string tableRow = "";
            string allTableRows = "";

            //use for loop to populate the string
            for (int i = 1; i < 13; i++)
            {
                //set the textbox ID
                string txtBoxNamePart = "";
                string txtBoxNameDesc = "";
                string txtBoxNameOther = "";
                txtBoxNamePart = "partNum" + i;
                txtBoxNameDesc = "descPartNum" + i;
                txtBoxNameOther = "otherPartNum" + i;

                //get textbox content
                TextBox theTxtBoxPart = FindControl(txtBoxNamePart) as TextBox;
                string partTxt = theTxtBoxPart.Text.ToString();
                TextBox theTxtBoxDesc = FindControl(txtBoxNameDesc) as TextBox;
                string descTxt = theTxtBoxDesc.Text.ToString();
                TextBox theTxtBoxOther = FindControl(txtBoxNameOther) as TextBox;
                string otherTxt = theTxtBoxOther.Text.ToString();

                //tested to see if could add if this field was empty caused a null exception error
                //add to the string, if the field is not empty
                if (partTxt != "")
                {
                    //build the email string
                    theDetails = "\r\n\r\nPART NUMBER " + i.ToString() + ": " + partTxt + "\r\n\r\nDESCRIPTION " + i.ToString() + ": " + descTxt + " OTHERINFO " + i.ToString() + ": " + otherTxt;
                    //add the strings together
                    allTheDetails += theDetails;

                    //build the table string
                    tableRow = @"<tr><td class=""borderRight"">" + partTxt + @"</td><td>" + descTxt + "\n<p>" + otherTxt + @"</p></td></tr>";
                    //add the strings together
                    allTableRows += tableRow;
                }

                //do not add content if the text field is empty
                else
                {
                    break;
                }

            }//end for loop

            //if the passed value is true, then return the email format; otherwise return the table format
            if (x)
            {
                return allTheDetails;
            }
            else
            {
                return allTableRows;
            }
        }

        //this function sends the cover letter request to the doc group
        protected void SendCvrLtrReqMail()
        {
            string subjectLine = "Cover Letter Request";

            //indicate which format to return
            bool emailFormat = true;
            string emailDetails = fieldNameConversion(emailFormat);

            string textBody = "COVER LETTER TITLE: " + cvrLtrTitle.Text.ToString() + emailDetails + "\r\n\r\nSW Download Instructions: " + swDownloadInst.Text.ToString() + "\r\n\r\nHSSub Documents: " + hssubReadme.Text.ToString() + "\r\n\r\nREVIEWERS: " + reviewers.Text.ToString() + "\r\n\r\nDATE NEEDED BY: " + Calendar1.SelectedDate.ToShortDateString() + "\r\n\r\nEmail Address: " + email.Text.ToString() + "\r\n\r\nDon't forget to pick up your htm file located here: " + @"\\atddat\DocDept\coverLetters";
            
            //send the email
            ProcessMail myMail = new ProcessMail();
            myMail.SendMail(subjectLine, textBody);  

        }

        //this function creates a cover letter file using the contents of the field text. It saves the file to a folder.
        protected void CreateCoverLetter()
        {
            //indicate that do not want email format for text - table format instead
            bool emailFormat = false;

            //call the field converter function
            string tableDetails = fieldNameConversion(emailFormat);

            //create the text for the cover letter htm file
            string lines = @"<?xml version=""1.0"" encoding=""utf-8""?><html xmlns:MadCap=""http:" + @"//www.madcapsoftware.com/Schemas/MadCap.xsd""><head><link href=""Resources/Stylesheets/coverLetterStyles.css"" rel=""stylesheet"" type=""text/css""/></head><body><h1>Cover Letter for " + cvrLtrTitle.Text.ToString() + @"</h1><p>Enclosed please find your <MadCap:variable name = ""Variables.ProductName""/> shipment. To obtain last-minute information about this release, see the Readme.</p><p> In addition to this cover letter, your shipment contains the following:</p><table><col/><col/><thead><tr><th class=""borderRight"">Part Number</th><th>Description</th></tr></thead><tbody>" + tableDetails + @"</tbody></table><h2>Installation and Readme</h2><p MadCap:conditions=""Default.TestSystem"">For installation information, follow the instructions on the enclosed CDs or in the readme file contained on each CD. For complete software download instructions, use the procedure located in: <div class=""filePath"">" + swDownloadInst.Text.ToString() + @".</div ></p><p MadCap:conditions=""Default.HSSub"">For installation instructions and other important information, review the High Speed Subsystem Installation Guide and High Speed Subsystem Readme files located as follows on the <span class=""title""><MadCap:variable name = ""Variables.ProductName"" ></MadCap:variable> <MadCap:variable name = ""Variables.Version"" ></MadCap:variable></span> DVD(where D: refers to the root of the DVD drive):</p><ul MadCap:conditions=""Default.HSSub""><li>D:\HSSub_Installation_Guide.htm</li><li>D:\SubSystem\Driver\HSSub_Readme.htm</li></ul><p MadCap:conditions=""Default.Instrument"">For installation instructions and other important information, review the Readme file located in the root directory of the CD/DVD.</p><h2>Documentation</h2><p>After installation, you can access the <MadCap:variable name=""Variables.ProductName"" /> documentation for this release from the Windows <em>Start</em> menu<MadCap:conditionalText MadCap:conditions= ""Default.Instrument"" >.</MadCap:conditionalText><MadCap:conditionalText MadCap:conditions= ""Default.TestSystem"" >.</MadCap:conditionalText><MadCap:conditionalText MadCap:conditions= ""Default.HSSub"" >, using the following path:</MadCap:conditionalText></p><p MadCap:conditions=""Default.HSSub"">" + hssubReadme.Text.ToString() + @"</p><h2> Quality of Shipment</h2><p>After reading this cover letter, check the contents of your shipment against the enclosed Packing List. If you find a discrepancy in your shipment, telephone the Perfect Installation Program (PIP) team at(978) 370-1818 or(978) 370-6107, or FAX them at(978) 370-6105.</p><h2>Customer Support</h2><p class=""closeFit"">Support for this product is provided through the standard Teradyne Software Support Agreement (SSA). For support or information, in North America, call Teradyne's Assembly Test Military and Aerospace Support at </p><p class=""closeFit""><em><MadCap:variable name = ""Variables.PhoneNumber"" /></em >. In all other areas, contact your Teradyne support office. You can access support and training information through the Teradyne Web site at<em> www.teradyne.com</em>.</p><h2>Training</h2><p>To arrange for training on this product, call <MadCap:variable name=""Variables.PhoneNumber"" />.</p></body></html>";

            //create the file name, using current date
            string dateText = DateTime.Now.ToString("yyyy-dd-M--HH-mm-ss");
            string myFile = "coverLetter" + dateText + ".htm";

            //establish file path
            string pathString = @"\\atddat\DocDept\coverLetters";
             
            pathString = System.IO.Path.Combine(pathString, myFile);

            System.IO.File.WriteAllText(pathString, lines);
        }

        protected void UpdateTheDB()
        {

            //create a new update object
            UpdateDatabase myDB = new UpdateDatabase();

            //get the data to add to database
            string addr = email.Text.ToString();
            DateTime dateNeeded = Calendar1.SelectedDate;
            int requestType = 1;//for cover letters
            
            //update the database
            myDB.UpdateDB(addr,dateNeeded,requestType);
          
        }


        protected void submitButton_Click(object sender, EventArgs e)
        {
           
            try
            {
                //send the email request to the doc dept
                SendCvrLtrReqMail();
                //create the cover letter file
                CreateCoverLetter();
                //let the user know thier request was processed      
                Response.Redirect("ReqSuccess.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                //update the database
                UpdateTheDB();
            }
            
            catch (Exception)
            {
                //notify Doc Dept that there was an issue
                SendErrorNotice();

                //let the user know there was an error
                Response.Redirect("ErrorMsg.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

    }
}
