using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace crudOperation
{
    class Program
    {
        static void Main(string[] args)
        {

            Program p = new Program();
            //p.insertrecordThroughSP();
           // p.updaterecordThrough();
            p.deleterecordThrough();
            Console.ReadKey();
        }

        public void insertrecordThroughSP()
        {

            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["StockConnection"].ToString());


            string query = "insertdata";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@stockId", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@stockSymbol", SqlDbType.VarChar).Value = "APPL";
            cmd.Parameters.Add("@stockName", SqlDbType.VarChar).Value = "Apple inc.";
            cmd.Parameters.Add("@createdOn", SqlDbType.DateTime).Value = DateTime.Now;

            sqlcon.Open();
            int rowaffected = cmd.ExecuteNonQuery();
            sqlcon.Close();
            
        }
        public void updaterecordThrough()
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["StockConnection"].ToString());

            //string query = "update Stocks set stockSymbol='FB',stockName='Facebook inc.' where stockId=3";

            string updatequery = "updatedata";
            SqlCommand cmd = new SqlCommand(updatequery, sqlcon);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@stockId", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@stockSymbol", SqlDbType.VarChar).Value = "fb";
            cmd.Parameters.Add("@stockName", SqlDbType.VarChar).Value ="facebook" ;
            cmd.Parameters.Add("@createdOn", SqlDbType.DateTime).Value = DateTime.Now;

            sqlcon.Open();
            int rowaffected = cmd.ExecuteNonQuery();
            sqlcon.Close();
             
        }
        public void deleterecordThrough()
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["StockConnection"].ToString());

            //string query = "delete from Stocks where stockId=10";

            string deletequery = "deletedata";
            SqlCommand cmd = new SqlCommand(deletequery, sqlcon);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@stockId", SqlDbType.Int).Value = 10;

            

            sqlcon.Open();
            int rowaffected = cmd.ExecuteNonQuery();
            sqlcon.Close();
          }

        public void Datashow()
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["StockConnection"].ToString());

            string query = "select stockSymbol,stockName from Stocks";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            sqlcon.Open();
            SqlDataReader read = cmd.ExecuteReader();
            
            
                while (read.Read())
                {
                    Console.WriteLine("{0} {1}", read.GetString(0), read.GetString(1));

                }
            
            read.Close();
            Console.ReadKey();




        }

    }
   
}
