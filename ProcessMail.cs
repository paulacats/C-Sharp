using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Data.SQLite;

namespace DocPortal
{
    public class ProcessMail
    {
        //Properties
        string toAddress { get; set; }
        string fromAddress { get; set; }
        string subjectLine { get; set; }
        string textBody { get; set; }

        //default constructor
        public ProcessMail()
        {
            toAddress = "paula.hodgkins@mycompany.com";
            fromAddress = "DocDept.Admin@mycompany.com";
            subjectLine = "Default Subject Line";
            textBody = "";
        }

        public void SendMail(string to, string from, string subj, string body)
        {
            this.toAddress = to;
            this.fromAddress = from;
            this.subjectLine = subj;
            this.textBody = body;

            //create a new mail object
            MailMessage msg = new MailMessage();

            //add the mailing address
            msg.To.Add(toAddress);

            //add the subject line
            msg.Subject = subjectLine;

            //set the sender's email address, convert mail object to string
            msg.From = new MailAddress(fromAddress);

            //create the body of the message
            msg.Body = textBody;

            //smtp settings
            SmtpClient client = new SmtpClient("mailhost-ec.mycompany.com");
            client.Port = 25;
            client.EnableSsl = false;

            //send the message
            client.Send(msg);

        }

        public void SendMail(string to, string subj, string body)
        {
            this.toAddress = to;
            this.subjectLine = subj;
            this.textBody = body;

            //create a new mail object
            MailMessage msg = new MailMessage();

            //add the mailing address
            msg.To.Add(toAddress);

            //add the subject line
            msg.Subject = subjectLine;

            //set the sender's email address, convert mail object to string
            msg.From = new MailAddress(fromAddress);

            //create the body of the message
            msg.Body = textBody;

            //smtp settings
            SmtpClient client = new SmtpClient("mailhost-ec.mycompany.com");
            client.Port = 25;
            client.EnableSsl = false;

            //send the message
            client.Send(msg);

        }

        public void SendMail(string subj, string body)
        {
            this.subjectLine = subj;
            this.textBody = body;

            //create a new mail object
            MailMessage msg = new MailMessage();

            //add the mailing address
            msg.To.Add(toAddress);

            //add the subject line
            msg.Subject = subjectLine;

            //set the sender's email address, convert mail object to string
            msg.From = new MailAddress(fromAddress);

            //create the body of the message
            msg.Body = textBody;

            //smtp settings
            SmtpClient client = new SmtpClient("mailhost-ec.mycompany.com");
            client.Port = 25;
            client.EnableSsl = false;

            //send the message
            client.Send(msg);

        }
    }


}
