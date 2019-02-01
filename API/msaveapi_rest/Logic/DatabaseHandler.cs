using System;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using log4net;
using System.Web;

namespace PortalAPI_rest.Logic
{
    public class DatabaseHandler
    {
        private Database CbDatabase;
        private DbCommand command;
        private readonly ILog Log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        public string ConnectionString = "TestCbConnectionString";
        //public string ConnectionString = "PegPayConnectionString";

        public DatabaseHandler()
        {
            try
            {
                CbDatabase = DatabaseFactory.CreateDatabase(ConnectionString);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal bool InsertData(string procedure, object[] data)
        {
            bool inserted = false;
            try
            {
                if (data == null)
                {
                    command = CbDatabase.GetStoredProcCommand(procedure);
                }
                else
                {
                    command = CbDatabase.GetStoredProcCommand(procedure, data);
                }
                int value = -1;

                value = CbDatabase.ExecuteNonQuery(command);
                if (value > 0)
                {
                    inserted = true;
                }
            }
            catch (Exception ee)
            {
                LogError("DatabaseHandler.InsertData", ee.Message,"DB EXCEPTION");
            }
            return inserted;
        }
        internal string GetSystemSetting(string systemCode, string bankCode)
        {
            string value = "";
            try
            {
                command = CbDatabase.GetStoredProcCommand("SystemSettings_SelectRow", bankCode, systemCode);
                DataTable table = CbDatabase.ExecuteDataSet(command).Tables[0];
                if (table.Rows.Count == 1)
                {
                    value = table.Rows[0]["SettingValue"].ToString();
                }
            }
            catch (Exception ee)
            {

                throw ee;
            }
            return value;
        }
        internal void LogToGeneralLogFile(
            string requestType, 
            string contentToLog
        )
        {
            try
            {
                string whatToLog = Environment.NewLine
                    + HttpContext.Current.Request.UserHostAddress + " [" + DateTime.Now.ToString() + " ]"
                    + Environment.NewLine
                    + requestType + contentToLog
                    + Environment.NewLine
                    + "------------------------------------------------";
                Log.Info(whatToLog);
            }
            catch (Exception)
            {
                //LogToFile
            }
        }

        internal void LogError(string Method, string ErrorMessage, string ErrorType)
        {
            this.InsertData("Logerror", new object[] {
                Method, ErrorMessage, ErrorType
            });
        }

        internal DataTable GetData(string procedure, object[] data)
        {
            DataTable table = new DataTable();
            try
            {
                if (data == null)
                {
                    command = CbDatabase.GetStoredProcCommand(procedure);
                }
                else
                {
                    command = CbDatabase.GetStoredProcCommand(procedure, data);
                }
                table = CbDatabase.ExecuteDataSet(command).Tables[0];
            }
            catch (Exception e)
            {
                Console.Write(e.Message.ToString());
                throw;
            }
            return table;
        }

    }
}
