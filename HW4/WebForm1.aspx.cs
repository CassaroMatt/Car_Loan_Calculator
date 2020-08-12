using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HW4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {       
            args.IsValid = (args.Value.Length >= 10000);
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value.Length >= 0);
        }

        protected void calculateButton_Click(object sender, EventArgs e)
        {
            principalText.Visible = true;
            interestRateAsDecimalText.Visible = true;
            monthlyPaymentText.Visible = true;
            totalPaymentText.Visible = true;
            totalInterestPaidText.Visible = true;



            double monthlyInterestRate;
            double monthlyPayment;
            double paymentOverNumMonths;
            double totalInterestPaid;
            int principal;
            int totalMonths = Int32.Parse(loanPeriodTextBox.Text);
            int purchasePrice = Int32.Parse(vehiclePriceTextBox.Text);
            int downPayment = Int32.Parse(tradeInOrDownPaymentBox.Text);
            double annualInterestRate = Int32.Parse(interestRateList.SelectedValue);



            principal = purchasePrice - downPayment;
            principalText.Text = "Principal = $" + principal;
          
            monthlyInterestRate = Math.Round((annualInterestRate /12)/ 100, 4);
            interestRateAsDecimalText.Text = "Monthly Interest Rate as Decimal = " + monthlyInterestRate;


            monthlyPayment = Math.Round((principal * (monthlyInterestRate * (Math.Pow(1 + monthlyInterestRate, totalMonths)))) / (Math.Pow(1 + monthlyInterestRate, totalMonths) - 1), 2);
            monthlyPaymentText.Text = "Monthly Payment = $" + monthlyPayment;

            paymentOverNumMonths = Math.Round(monthlyPayment * totalMonths, 3);
            totalPaymentText.Text = "Total Payment For " + totalMonths + " months = $" + paymentOverNumMonths;

            totalInterestPaid = Math.Round(paymentOverNumMonths - principal, 3);
            totalInterestPaidText.Text = "Total Interest Paid = $" + totalInterestPaid;
        }

    }
}