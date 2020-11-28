using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace RideSharing.DAL
{
    public class myDAL
    {
        private static readonly string connString =
        System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionName"].ConnectionString;
        public int checklogin(String _Cont,String _Pass,String _Type)
        {

            int Found = 0;
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("USER_LOGIN ", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Contact_Number", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@type", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@Contact_Number"].Value = _Cont;
                cmd.Parameters["@Password"].Value = _Pass;
                cmd.Parameters["@type"].Value = _Type;

                cmd.ExecuteNonQuery();

                // read output value 
                Found = Convert.ToInt32(cmd.Parameters["@output"].Value); //convert to output parameter to interger format

           
                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }

            return Found;

        }
        
        public int checksignup(String _a, String _b, String _c, String _d, String _f, String _g)
        {

            int Found = 0;
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SignUp ", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
               
                cmd.Parameters.Add("@u_name", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@gender", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@Contact_Number", SqlDbType.VarChar, 20);
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@type_of_user", SqlDbType.VarChar, 10);

                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@u_name"].Value = _a;
                cmd.Parameters["@email"].Value = _b;
                cmd.Parameters["@gender"].Value = _c;
                cmd.Parameters["@Contact_Number"].Value = _d;
                cmd.Parameters["@Password"].Value = _f;
                cmd.Parameters["@type_of_user"].Value = _g;

                cmd.ExecuteNonQuery();

                // read output value 
                Found = Convert.ToInt32(cmd.Parameters["@output"].Value); //convert to output parameter to interger format


                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }

            return Found;

        }

    }
}