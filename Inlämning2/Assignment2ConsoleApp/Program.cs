using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment2ConsoleApp
{

    class Program
    {
        static void Main(string[] args)
        {
            SSMS ssms = new SSMS();
            WriteStartMenu();
            bool IsInStartMenu = true;
            bool IsInInsertCustomer = false;
            bool IsInInsertProduct = false;
            bool IsInUpdatePrice = false;
            List<string> questions = new List<string>() { "Write your company name:", "Write your contact name:", "Write your contact title:", "Write your address:", "Write your city:", "Write your region:", "Write your postal code:", "Write your country:", "Write your phone number:", "Write your fax:" };
            List<string> answers = new List<string>();

            while (true)
            {
                string input = Console.ReadLine();
                if (IsInStartMenu)
                {
                    if (input == "1")
                    {
                        Console.Clear();
                        Console.WriteLine("Write your customer id:");
                        IsInStartMenu = false;
                        IsInInsertCustomer = true;
                    }
                    else if (input == "2")
                    {
                        Console.Clear();
                        Console.WriteLine("Write your product name:");
                        IsInStartMenu = false;
                        IsInInsertProduct = true;
                    }
                    else if (input == "3")
                    {
                        Console.Clear();
                        IsInStartMenu = false;
                        IsInUpdatePrice = true;
                        ssms.GetProductIDAndUnitPrice();
                        foreach (var item in ssms.ProductList)
                        {
                            Console.WriteLine("Product ID: " + item.ProductID + " UnitPrice: " + item.UnitPrice);
                        }
                        Console.WriteLine("Write the product id you want to change the price in:");
                    }
                    else
                    {
                        Console.Clear();
                        WriteStartMenu();
                        Console.WriteLine("Please type in 1,2 or 3");
                    }
                }
                else
                {
                    answers.Add(input);
                    if (IsInInsertCustomer)
                    {
                        for (int i = 0; i < questions.Count; i++)
                        {
                            Console.WriteLine(questions[i]);
                            answers.Add(Console.ReadLine());
                        }
                        ssms.InsertCustomer(answers);
                        IsInInsertCustomer = false;
                    }
                    else if (IsInInsertProduct)
                    {
                        questions = new List<string>() { "Write the product's supplier id:", "Write the product's category id:", "Write the product's quantity per unit:", "Write the product's unit price:", "Write the product's units in stock:", "Write the product's units on order", "Write the product's reorder level", "How many times has the product been discontinued?" };
                        for (int i = 0; i < questions.Count; i++)
                        {
                            Console.WriteLine(questions[i]);
                            answers.Add(Console.ReadLine());
                        }
                        ssms.InsertProduct(answers);
                        IsInInsertProduct = false;
                    }
                    else if (IsInUpdatePrice)
                    {
                        questions = new List<string>() { "Write the new unit price" };
                        for (int i = 0; i < questions.Count; i++)
                        {
                            Console.WriteLine(questions[i]);
                            answers.Add(Console.ReadLine());
                        }
                        ssms.UpdateProduct(answers);
                        IsInUpdatePrice = false;
                    }
                }

            }

        }
        static void WriteStartMenu()
        {
            Console.Clear();
            Console.WriteLine("1. Insert a new customer.");
            Console.WriteLine("2. Insert a new product.");
            Console.WriteLine("3. Update product price.");
        }
    }
}



