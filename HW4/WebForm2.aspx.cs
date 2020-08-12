using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hw4
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int purchase = Int32.Parse(purchaseTextbox.Text);
            int down = Int32.Parse(downTextbox.Text);
            double rate = Double.Parse(rateRadioList.SelectedValue);
            double monthlyRate = rate / 12;
            int principal = purchase - down;
            int months = Int32.Parse(monthsTextBox.Text);
            double monthly = principal * (monthlyRate * Math.Pow((1 + monthlyRate), months) / ((Math.Pow((1 + monthlyRate), months) - 1)));
            principalTextbox.Text = "Principal = " + principal.ToString("$0.##");
            monthlyrateTextbox.Text = "Monthly Interest Rate as Decimal = " + monthlyRate.ToString("0.####");
            monthlypaymentTextbox.Text = "Monthly Payment = " + monthly.ToString("$0.##");
            double total = months * monthly;
            totalpaymentsTextbox.Text = "Total Payment For " + monthsTextBox.Text + " months = " + total.ToString("$0.##");
            totalinterestTextbox.Text = "Total Interest Paid = " + (total - principal).ToString("$0.##");
        }

        protected void clear() {
            principalTextbox.Text = "";
            monthlyrateTextbox.Text = "";
            monthlypaymentTextbox.Text = "";
            totalpaymentsTextbox.Text = "";
            totalinterestTextbox.Text = "";
        }
        protected void purchaseTextbox_TextChanged(object sender, EventArgs e)
        {
            clear();
        }

        protected void downTextbox_TextChanged(object sender, EventArgs e)
        {
            clear();
        }

        protected void rateRadioList_SelectedIndexChanged(object sender, EventArgs e)
        {
            clear();
        }

        protected void monthsTextBox_TextChanged(object sender, EventArgs e)
        {
            clear();
        }
    }
}