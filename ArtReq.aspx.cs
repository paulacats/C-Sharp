using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data.SQLite;

namespace DocPortal
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //get current date
            var today = System.DateTime.Now.AddDays(-1);
            var chosenDate = Calendar1.SelectedDate;

            //if the selected date is less than today, display error message
            if (chosenDate < today)
            {
                lblCalDateErrorArt.Visible = true;
            }

            else
            {
                lblCalDateErrorArt.Visible = false;
            }
        }


        //this function sends an error message to the doc dept if the request is not processed
        protected void SendErrorNotice()
        {
            string toAddress = "paula.hodgkins@mycompany.com";
            string subjectLine = "Error Notice: Media Artwork Request";
            string textBody = "There was an error processing the Media Artwork request. Please contact the user at this email address: " + toCC;

            //send the email
            ProcessMail myMail = new ProcessMail();
            myMail.SendMail(toAddress, toCC, fromAddress, subjectLine, textBody); 
        }
        
        //this funciton sends the artwork request to the doc dept. It gathers the text from the form fields and adds them to the email body.
        protected void SendMediaReqMail()
        {
            string toAddress = "paula.hodgkins@mycompany.com";
            string fromAddress = txtEmail.Text.ToString();
            string subjectLine = "Media Artwork Request";
            string otherInfo;
            string reviewers;
            string dateNeeded;
            
            //check the date, if less than today (or not selected), make it today
            if (Calendar1.SelectedDate.Date < System.DateTime.Now.Date)
            {
                Calendar1.SelectedDate = System.DateTime.Now.Date;
            }
            
            //test for empty fields in form; don't include in email if empty
            if (txtOther.Text.ToString() == "")
            {
                otherInfo = "";
            }
            else
            {
                otherInfo = "<p><b>Other Info:</b> " + txtOther.Text.ToString() + "</p>";
            }

            if (txtReviewers.Text.ToString() == "")
            {
                reviewers = "";
            }
            else
            {
                reviewers = "<p><b>Reviewers:</b> " + txtReviewers.Text.ToString() + "</p>";
            }

            //test for current date and change formatting accordingly
            if (Calendar1.SelectedDate == System.DateTime.Now.Date)
            {                
                dateNeeded = "<p><font color=\"red\"><b>Date Needed By:</b> " + Calendar1.SelectedDate.ToShortDateString() + "</font></p>";
            }
            else
            {
                dateNeeded = "<p><b>Date Needed By:</b> " + Calendar1.SelectedDate.ToShortDateString() + "</p>";
            }

            string textBody = "<html><body><font face=\"verdana\"><p><b>Media Title:</b> " + txtTitle.Text.ToString() + "</p><p><b>ITAR?</b>: " + radITAR.SelectedValue.ToString() + "</p><p><b>Media Type:</b> " + radMedia.SelectedValue.ToString() + "</p><p><b>Part Number:</b> " + txtPartNum.Text.ToString() + "</p><p><b>Number of Discs:</b> " + dropDwnCDs.SelectedValue.ToString() + "</p><p><b>Project:</b> " + drpDwnProject.SelectedValue.ToString() + otherInfo + reviewers + "</p><p><b>Deliver Media To:</b> " + txtDeliver.Text.ToString() + dateNeeded + "</p><p><b>Requestor's Email Address:</b> " + txtEmail.Text.ToString() + "</p></body></html>";

            //send the message
            ProcessMail myMail = new ProcessMail();
            myMail.SendMail(toAddress, fromAddress, subjectLine, textBody);
           
        }

        protected void UpdateTheDB()
        {
            //create a new update object
            UpdateDatabase myDB = new UpdateDatabase();

            //get the data to add to database
            string addr = txtEmail.Text.ToString();
            DateTime dateNeeded = Calendar1.SelectedDate;
            int requestType = 0;//for art requests
            DateTime dateNeeded = Calendar1.SelectedDate.Date;
            DateTime dateReq = System.DateTime.Now.Date;
            TimeSpan difference = dateNeeded - dateReq;
            int daysAllowed = (int)difference.TotalDays;
            int projType = drpDwnProject.SelectedIndex;
            int numDiscs = Convert.ToInt32(dropDwnCDs.SelectedItem.Value);

            //update the database
            myDB.UpdateDB(addr, dateNeeded, requestType, daysAllowed,projType, numDiscs);
        }

       
        protected void submitButton_Click(object sender, EventArgs e)
        {
            

            try
            {
                //email the request to the doc dept
                SendMediaReqMail();
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
