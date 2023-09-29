using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace OLXPROJECT.Models
{
   
    
        public class AddlistRepo
        {
            private SqlConnection con;

            // Constructor
            public AddlistRepo()
            {
                string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
                con = new SqlConnection(constr);
            }

            public List<MyAdvertiseModel> GetAddlists()
            {
                List<MyAdvertiseModel> myads = new List<MyAdvertiseModel>();

                try
                {
                    string query = "SELECT p.advertiseTitle, p.  advertiseDescription,  a.advertiseStatus " +
                                   "FROM tbl_ProductDetails p " +
                                   "INNER JOIN tbl_Users u ON p.userId = u.userId " +
                                   "INNER JOIN tbl_Areas a ON p.areaId = a.areaId";
                    SqlCommand cmd = new SqlCommand(query, con);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        myads.Add(new MyAdvertiseModel
                        {
                            advertiseTitle = Convert.ToString(reader["advertiseTitle"]),
                            advertiseDescription = Convert.ToString(reader["advertiseDescription"]),
                            advertiseStatus = Convert.ToString(reader["advertiseStatus"])
                        });
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Handle the exception or log the error
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    con.Close();
                }

                return myads;
            }

            public void ApproveAdvertise(int advertiseId)
            {
                try
                {
                    string query = "UPDATE tbl_ProductDetails SET advertiseStatus = 'Approved' WHERE advertiseId = @AdvertiseId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@AdvertiseId", advertiseId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Handle the exception or log the error
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }

            public void RejectAdvertise(int advertiseId)
            {
                try
                {
                    string query = "UPDATE tbl_ProductDetails SET advertiseStatus = 'Rejected' WHERE advertiseId = @AdvertiseId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@AdvertiseId", advertiseId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Handle the exception or log the error
                    Console.WriteLine("Error: " + ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
