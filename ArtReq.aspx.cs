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
                lblCalDateErrorArt.Visible = true;
            }
        }


        //this function sends an error message to the doc dept if the request is not processed
        protected void SendErrorNotice()
        {
            string toAddress = "paula.hodgkins@mycompany.com";
            string subjectLine = "Error Notice: Media Artwork Request";
            string textBody = "There was an error processing the Media Artwork request.";
            //send the email
            ProcessMail myMail = new ProcessMail();
            myMail.SendMail(toAddress, subjectLine, textBody);
        }
        
        //this funciton sends the artwork request to the doc dept. It gathers the text from the form fields and adds them to the email body.
        protected void SendMediaReqMail()
        {
            string subjectLine = "Media Artwork Request";
            string textBody = "MEDIA TITLE: " + txtTitle.Text.ToString() + "\r\n\r\nITAR: " + radITAR.SelectedValue.ToString() + "\r\n\r\nMEDIA: " + radMedia.SelectedValue.ToString() + "\r\n\r\nPART NUMBER: " + txtPartNum.Text.ToString() + "\r\n\r\nOTHER INFO: " + txtOther.Text.ToString() + "\r\n\r\nREVIEWERS: " + txtReviewers.Text.ToString() + "\r\n\r\nDELIVER MEDIA TO: " + txtDeliver.Text.ToString() + "\r\n\r\nDATE NEEDED BY: " + Calendar1.SelectedDate.ToShortDateString() + "\r\n\r\nEmail Address: " + txtEmail.Text.ToString();

            //send the message
            ProcessMail myMail = new ProcessMail();
            myMail.SendMail(subjectLine, textBody);
           
        }

        protected void UpdateTheDB()
        {
            //create a new update object
            UpdateDatabase myDB = new UpdateDatabase();

            //get the data to add to database
            string addr = txtEmail.Text.ToString();
            DateTime dateNeeded = Calendar1.SelectedDate;
            int requestType = 0;//for art requests
            
            //update the database
            myDB.UpdateDB(addr, dateNeeded, requestType);
          
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
