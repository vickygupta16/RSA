using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.Ajax.Utilities;

namespace RSA_Payment_Web_App
{
    public partial class PaymentScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private static RSAParameters publicKey;
        private static RSAParameters privateKey;  
        protected void submit_card_details_Click(object sender, EventArgs e)
        {
            //string message = cvv_input.Text.ToString()+" "+card_number_input.Text.ToString();
            generateKeys();
            byte[] encrypted_Card_Number = Encrypt(Encoding.UTF8.GetBytes(card_number_input.Text.ToString()));
            byte[] decrypted_Card_Number = Decrypt(encrypted_Card_Number);
            ecn.Text = BitConverter.ToString(encrypted_Card_Number);
            dcn.Text = Encoding.UTF8.GetString(decrypted_Card_Number);

            byte[] encrypted_Exp_Month = Encrypt(Encoding.UTF8.GetBytes(exp_month_input.SelectedItem.Value));
            byte[] decrypted_Exp_Month = Decrypt(encrypted_Exp_Month);
            eem.Text = BitConverter.ToString(encrypted_Exp_Month);
            dem.Text = Encoding.UTF8.GetString(decrypted_Exp_Month);

            byte[] encrypted_Exp_Year = Encrypt(Encoding.UTF8.GetBytes(exp_year_input.SelectedItem.Value));
            byte[] decrypted_Exp_Year = Decrypt(encrypted_Exp_Year);
            eey.Text = BitConverter.ToString(encrypted_Exp_Year);
            dey.Text = Encoding.UTF8.GetString(decrypted_Exp_Year);

            byte[] encrypted_CVV = Encrypt(Encoding.UTF8.GetBytes(cvv_input.Text.ToString()));
            byte[] decrypted_CVV = Decrypt(encrypted_CVV);
            ecvv.Text = BitConverter.ToString(encrypted_CVV);
            dcvv.Text = Encoding.UTF8.GetString(decrypted_CVV);

            //Response.Write("<br>");
            //Response.Write("Public Key : { " + BitConverter.ToString(publicKey.Exponent) + " , " + BitConverter.ToString(publicKey.Modulus) + " }");
            //Response.Write("<br>");
            //Response.Write("Private Key : { " + BitConverter.ToString(privateKey.D) + " , " + BitConverter.ToString(privateKey.Modulus) + " }");
            //public_key.Text = publicKey.GetHashCode().ToString();
            //private_key.Text = privateKey.GetHashCode().ToString();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string query1 = "insert into Payment_RSA(Card_Number,Exp_Month,Exp_Year,CVV,Card_Number_Encrypted,Exp_Month_Encrypted,Exp_Year_Encrypted,CVV_Encrypted)" +
                "values('" + card_number_input.Text.ToString() + "','" + exp_month_input.SelectedItem.Value + "','" +
                exp_year_input.SelectedItem.Value + "','" + cvv_input.Text.ToString() + "','" +
                BitConverter.ToString(encrypted_Card_Number) + "','" +
                BitConverter.ToString(encrypted_Exp_Month) + "','" +
                BitConverter.ToString(encrypted_Exp_Year) + "','" +
                BitConverter.ToString(encrypted_CVV) + "')";
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.ExecuteNonQuery();
            string query2 = "insert into Payment_Encrypted_Details(Card_Number_Encrypted,Exp_Month_Encrypted,Exp_Year_Encrypted,CVV_Encrypted)" +
                "values('"+
                BitConverter.ToString(encrypted_Card_Number) + "','" +
                BitConverter.ToString(encrypted_Exp_Month) + "','" +
                BitConverter.ToString(encrypted_Exp_Year) + "','" +
                BitConverter.ToString(encrypted_CVV) + "')";
            SqlCommand cmd2 = new SqlCommand(query2, con);
            cmd2.ExecuteNonQuery();
            con.Close();

            //Label1.Text = "Encrypted : " + BitConverter.ToString(encrypted);
            //Label2.Text = "Decrypted : " + Encoding.UTF8.GetString(decrypted);

        }

        static void generateKeys()
        {
            using(var rsa=new RSACryptoServiceProvider(2048))
            {
                rsa.PersistKeyInCsp = false;    //don't store keys in container
                publicKey = rsa.ExportParameters(false);
                privateKey = rsa.ExportParameters(true);
            }
        }

        static byte[] Encrypt(byte[] input)
        {
            byte[] encrypted;
            using (var rsa = new RSACryptoServiceProvider(2048))
            {
                rsa.PersistKeyInCsp = false;
                rsa.ImportParameters(publicKey);
                encrypted = rsa.Encrypt(input,true);
            }

            return encrypted;
        }
        static byte[] Decrypt(byte[] input)
        {
            byte[] decrypted;
            using (var rsa = new RSACryptoServiceProvider(2048))
            {
                rsa.PersistKeyInCsp = false;
                rsa.ImportParameters(privateKey);
                decrypted = rsa.Decrypt(input, true);
            }

            return decrypted;
        }
    }
}