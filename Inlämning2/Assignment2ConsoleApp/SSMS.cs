using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;


namespace Assignment2ConsoleApp
{
    public class SSMS
    {
        public static string connString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        SqlConnection cn = new SqlConnection(connString);
        SqlCommand cmd;
        string type;
        public List<Product> ProductList { get; set; }

        public void GetProductIDAndUnitPrice()
        {
            ProductList = new List<Product>();
            OpenConnection();
            cmd.CommandText = "SELECT ProductID, UnitPrice FROM Products";
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Product product = new Product();
                product.ProductID = reader.GetInt32(0);
                product.UnitPrice = reader.GetDecimal(1);
                ProductList.Add(product);
            }
            cn.Close();
        }
        public void InsertProduct(List<string> productAnswer)
        {
            OpenConnection();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertProduct";
            cmd.Parameters.AddWithValue("@ProductName", productAnswer[0]);
            cmd.Parameters.AddWithValue("@SupplierID", productAnswer[1]);
            cmd.Parameters.AddWithValue("@CategoryID", productAnswer[2]);
            cmd.Parameters.AddWithValue("@QuantityPerUnit", productAnswer[3]);
            cmd.Parameters.AddWithValue("@UnitPrice", productAnswer[4]);
            cmd.Parameters.AddWithValue("@UnitsInStock", productAnswer[5]);
            cmd.Parameters.AddWithValue("@UnitsOnOrder", productAnswer[6]);
            cmd.Parameters.AddWithValue("@ReorderLevel", productAnswer[7]);
            cmd.Parameters.AddWithValue("@Discontinued", productAnswer[8]);
            type = "product";
            CloseConnection(type);
        }
        public void InsertCustomer(List<string> customerAnswer)
        {
            OpenConnection();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertCustomer";
            cmd.Parameters.AddWithValue("@CustomerID", customerAnswer[0]);
            cmd.Parameters.AddWithValue("@CompanyName", customerAnswer[1]);
            cmd.Parameters.AddWithValue("@ContactName", customerAnswer[2]);
            cmd.Parameters.AddWithValue("@ContactTitle", customerAnswer[3]);
            cmd.Parameters.AddWithValue("@Address", customerAnswer[4]);
            cmd.Parameters.AddWithValue("@City", customerAnswer[5]);
            cmd.Parameters.AddWithValue("@Region", customerAnswer[6]);
            cmd.Parameters.AddWithValue("@PostalCode", customerAnswer[7]);
            cmd.Parameters.AddWithValue("@Country", customerAnswer[8]);
            cmd.Parameters.AddWithValue("@Phone", customerAnswer[9]);
            cmd.Parameters.AddWithValue("@Fax", customerAnswer[10]);
            type = "customer";
            CloseConnection(type);
        }
        public void UpdateProduct(List<string> productAnswer)
        {
            OpenConnection();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateProductPrice";
            cmd.Parameters.AddWithValue("@ProductID", productAnswer[0]);
            cmd.Parameters.AddWithValue("@UnitPrice", productAnswer[1]);
            type = "updated product";
            CloseConnection(type);
        }
        void OpenConnection()
        {
            cn.Open();
            cmd = cn.CreateCommand();
        }
        void CloseConnection(string type)
        {
            try
            {
                cmd.ExecuteNonQuery();
                if (type == "customer")
                    Console.WriteLine("you successfully created a customer!");
                else if (type == "product")
                    Console.WriteLine("you successfully created a product!");
                else if (type == "updated product")
                    Console.WriteLine("you successfully updated a product!");

            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("truncated"))
                    Console.WriteLine("error: you typed to many letters");

                else if (ex.Message.Contains("primary key".ToUpper()))
                    Console.WriteLine("error: this user is already registered in the database");
                else if (ex.Message.Contains("Error converting"))
                    Console.WriteLine("error: you wrote a letter where you should have written a number");
                else
                    Console.WriteLine("error: an sql exception occurred");

            }
            cn.Close();
        }
    }
}
