using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Models
{
    public class PhonenumberTransactions
    {
        private DataRow row;

        public PhonenumberTransactions(DataRow row)
        {
            this.row = row;
            PhoneNumber = row["PhoneNumber"].ToString();
            Amount = row["Amount"].ToString();
            Name = row["Name"].ToString();
            LoanId = row["LoanID"].ToString();
            TranName = row["TranName"].ToString();
            BankTranId = row["BankTranId"].ToString();
            TranType = row["TranType"].ToString();
            RecordDateTime = row["RecordDateTime"].ToString();
        }

        public string Amount { get; private set; }
        public string BankTranId { get; private set; }
        public string LoanId { get; private set; }
        public string Name { get; private set; }
        public string RecordDateTime { get; private set; }
        public string TranName { get; private set; }
        public string TranType { get; private set; }
        private string PhoneNumber { get; set; }
    }
}