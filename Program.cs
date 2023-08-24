using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace datasetExample
{
    class Program
    {
        static void Main(string[] args)
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["StockConnection"].ToString());

            SqlDataAdapter data = new SqlDataAdapter("select * from Stocks; select * from PriceHistory; select * from Users; select * from Orders;select * from Trade;", sqlcon);
            DataSet ds = new DataSet();
            data.Fill(ds);
           
            ds.Tables[0].TableName = "Stocks";
            ds.Tables[1].TableName = "PriceHistory";
            ds.Tables[2].TableName = "Users";
            ds.Tables[3].TableName = "Orders";
            ds.Tables[4].TableName = "Trade";
            

            foreach (DataRow row in ds.Tables["Stocks"].Rows)
            {
                Console.WriteLine(row["stockId"] + ", " + row["stockSymbol"] + ",  " + row["stockName"]);
            }
            Console.WriteLine();
            foreach (DataRow row in ds.Tables["PriceHistory"].Rows)
            {
                Console.WriteLine(row["priceId"] + "," + row["stockId"] + ", " + row["openPrice"] + " ," +row["highPrice"] +" ," + row["lowPrice"] +"," +row["closePrice"]);
            }
            Console.WriteLine();
            foreach (DataRow row in ds.Tables["Users"].Rows)
            {
                Console.WriteLine(row["userId"] + ", " + row["userName"] + ",  " + row["email"]);
            }
            Console.WriteLine();
            foreach (DataRow row in ds.Tables["Orders"].Rows)
            {
                Console.WriteLine(row["orderId"] + ", " + row["stockId"] + ", " + row["userId"] + "," + row["orderType"] + " ," + row["orderPrice"] + "," + row["orderQuantity"]);
            }

            Console.WriteLine();
            foreach (DataRow row in ds.Tables["Trade"].Rows)
            {
                Console.WriteLine(row["tradeId"] + ", " + row["stockId"] + "," + row["userId"] + " ," + row["tradeType"] + " ," + row["tradePrice"] + "," + row["tradeQuantity"]);
            }
            Console.WriteLine();
            Console.ReadKey();
           


        }

    }
}
