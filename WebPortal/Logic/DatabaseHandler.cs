using System;
using System.Data.Common;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace WebPortal.Logic
{
    public class DatabaseHandler
    {
        private Database CbDatabase;
        private DbCommand command;
        public string ConnectionString = "TestDbConnection";
        //public string ConnectionString = "LiveDbConnection";

        public DatabaseHandler()
        {
            try
            {
                CbDatabase = DatabaseFactory.CreateDatabase(ConnectionString);
            }
            catch (Exception)
            {
                //throw ex;
            }
        }

        public DataTable GetData(string procedure, object[] data)
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
                //throw;
            }
            return table;
        }

        internal bool InsertData(string procedure, object [] data)
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
            catch (Exception)
            {

            }
            return inserted;
        }

        internal void LogError(string data)
        {
            //TODO LOG TO FILE
            InsertData("LogError", new string[] { data, DateTime.Now.ToString() });
        }

        public string RunQueryDirectly(string sql, string ColumnToReturn)
        {
            DataTable table = new DataTable();
            try
            {
                command = CbDatabase.GetSqlStringCommand(sql);
                table = CbDatabase.ExecuteDataSet(command).Tables[0];
            }
            catch (Exception e)
            {
                Console.Write(e.Message.ToString());
                //throw;
            }
            try
            {
                return table.Rows[0][ColumnToReturn].ToString();
            }catch(Exception)
            {
                return "--";
            }
        }

    }
}