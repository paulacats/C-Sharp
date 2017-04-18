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
    public class UpdateDatabase
    {

        public UpdateDatabase() { }

        public void UpdateDB(string emailAddr, DateTime dateNeed, int reqType)
        {
            string name, fName, lName;

            //get the data to add to database
            //stackoverflow.com/questions/4443225/parse-plain-email-address-into-2-parts#4443326
            MailAddress addr = new MailAddress(emailAddr);
            name = addr.User;
            if (name.Contains('.')) {
                //split the name
                String[] parts = name.Split(new[] { '.' });
                fName = parts[0];
                lName = parts[1];
             }
            else
            {
                fName = name;
                lName = "";
            }
            DateTime dateReq = System.DateTime.Now;
            DateTime dateNeeded = dateNeed;

            int requestType = reqType;//1 for cover letters, 0 for artwork

            //create the sql query
            string txtSqlQuery = @"INSERT INTO workRequests (fName, lName, dateReq, dateNeeded, requestType) VALUES(@fName,@lName,@dateReq,@dateNeeded,@requestType)";

            //path and name of sqlite database           
            const string filename = @"\\atddat\DocDept\SQLiteDB\workRequests.sqlite";

            //const string filename = @"C:\SQLiteDB\workRequests.sqlite";//for testing

            //set the connection string
            //stackoverflow.com/questions/10875612/sqlite-c-unable-to-open-the-database-file#22328198
            //msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand.parameters(v=vs.110).aspx
            using (SQLiteConnection connection = new SQLiteConnection("Data Source=" + filename + ";Version=3;", true))
            {
                //stackoverflow.com/questions/19479166/sqlite-simple-insert-query#19489736
                //stackoverflow.com/questions/15257369/cannot-implicitly-convert-type-string-to-system-data-commandtype
                SQLiteCommand insertSQL = new SQLiteCommand(txtSqlQuery, connection);
                insertSQL.Parameters.AddWithValue("@fName", fName);
                insertSQL.Parameters.AddWithValue("@lName", lName);
                insertSQL.Parameters.AddWithValue("@dateReq", dateReq);
                insertSQL.Parameters.AddWithValue("@dateNeeded", dateNeeded);
                insertSQL.Parameters.AddWithValue("@requestType", requestType);
                try
                {
                    //open the DB connection
                    connection.Open();
                    insertSQL.ExecuteNonQuery();
                    connection.Close();
                }

                catch (Exception)
                {
                    //if error notify DBA
                    string toAddress = "paula.hodgkins@mycompany.com";
                    string subjectLine = "Error Notice: Database";
                    string textBody = "There was an error opening the database.";

                    //send the email
                    ProcessMail myMail = new ProcessMail();
                    myMail.SendMail(toAddress, subjectLine, textBody);

                }
            }
        }
    }
}
