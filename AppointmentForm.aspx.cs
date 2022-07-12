using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;

namespace DoctorsAppointmentForm
{
    public partial class AppointmentForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            checkdate();
        }

        public void insertrecord()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("InsertAppointmentDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Name", txtname.Text);
                cmd.Parameters.AddWithValue("Age", txtage.Text);
                cmd.Parameters.AddWithValue("DateOfBirth", txtdob.Text);
                cmd.Parameters.AddWithValue("BloodGroup", txtblood.Text);
                cmd.Parameters.AddWithValue("Address", txtadd.Text);
                cmd.Parameters.AddWithValue("EmailID", txtemail.Text);
                cmd.Parameters.AddWithValue("MobileNumber", txtno.Text);
                cmd.Parameters.AddWithValue("DateOfAppointment", txtdateapp.Text);
                cmd.Parameters.AddWithValue("PatientReport", fileupload.FileName);
                con.Open();
                int k = cmd.ExecuteNonQuery();

                if (k != 0)
                {
                    lblmsg.Text = (txtname.Text + "Your Appointment Is Fixed On Date" + txtdateapp.Text);
                    lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message;
            }
            finally
            {

            }
        }

        public void checkdate()
        {
            string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("checkdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "checkdate";
            cmd.Parameters.AddWithValue("@DateOfAppointment", SqlDbType.Date).Value = txtdateapp.Text;
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable()
            con.Open();
            //da.Fill(dt);
            int k = cmd.ExecuteNonQuery();
            if (k != 0)
            {
                insertrecord();
                savefile();
                lblmsg.Text = (txtname.Text + " Your Appointment Is Fixed On Date " + txtdateapp.Text);
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblmsg.Text = (txtname.Text + "Your Appointment  is Not Fixed On Date" + txtdateapp.Text + "Please Select Another Date");
            }
            con.Close();
            sendemail();
           
        }

      
        public void savefile()
        {
            if (fileupload.HasFile)  //fileupload control contains a file  
               
                {
                    fileupload.SaveAs("C:\\roshan/DoctorsAppointmentForm/DoctorsAppointmentForm/PatientReport/PatientReportFile" + fileupload.FileName);          // file path where you want to upload  

                }
        }

        public void sendemail()
        {
            try
            {
                MailMessage message = new MailMessage();
                message.Subject = "City Hospital Doctor Appointment Booking";
                message.Body = (txtname.Text + "Your appointment is fixed on date" + txtdateapp.Text);
                message.To.Add(txtemail.Text);
                message.From = new MailAddress("cityhospital@gmail.com");
                SmtpClient smtp = new SmtpClient();
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "127.0.0.1";
                smtp.Port = 25;
                smtp.Send(message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Response.Redirect("AppointmentForm.aspx");
            }

        }




    }
}