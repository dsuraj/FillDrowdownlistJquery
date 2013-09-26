using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace FillDrowdownlistJquery
{
    public partial class Default : System.Web.UI.Page
    {
        [WebMethod]
        public static string GetResultset()
        {
            DataTable dataTable = new System.Data.DataTable("Employees");
            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT EmployeeID, FirstName + ' ' + LastName AS Name FROM Employees", sqlConnection);
                    sqlDataAdapter.Fill(dataTable);
                    return JsonConvert.SerializeObject(dataTable);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}