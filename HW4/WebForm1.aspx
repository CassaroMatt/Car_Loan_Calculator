<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HW4.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Loan Calculator</title>

    <style>
        .errorMessage{color: red;}

        #wrapper{
            background-color: lightcyan;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id ="wrapper">
            <h1>
                Car Loan Calculator
            </h1>
            <br />

                Vehicle Purchase Price
            <asp:TextBox ID="vehiclePriceTextBox" TextMode="Number" min="10000" runat="server" Text="10000" AutoPostBack="false" ></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" CssClass="errorMessage"
                Display="Dynamic" ControlToValidate="vehiclePriceTextBox"></asp:RequiredFieldValidator>

            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="$10k minimum" Type="integer"
                MinimumValue="10000" MaximumValue="2147483647" ControlToValidate="vehiclePriceTextBox" CssClass="errorMessage" Display="Dynamic"></asp:RangeValidator>

            <br /><br />

                Trade In/Down Payment
            <asp:TextBox ID="tradeInOrDownPaymentBox" runat="server" Text="0" TextMode="Number" min="0"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" CssClass="errorMessage" 
                Display="Dynamic" ControlToValidate="tradeInOrDownPaymentBox"></asp:RequiredFieldValidator>

            <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="$0 minimum" Type="Integer"
                MinimumValue="0" MaximumValue="2147483647" ControlToValidate="tradeInOrDownPaymentBox" CssClass="errorMessage" Display="Dynamic"></asp:RangeValidator>

            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Must be less than the purchase price" 
                ControlToValidate="tradeInOrDownPaymentBox" Operator="LessThan" ControlToCompare="vehiclePriceTextBox" Type="Integer" CssClass="errorMessage"></asp:CompareValidator>

            <br /><br />

                
                Annual Interest Rate
            <asp:RadioButtonList ID="interestRateList" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="3">3%</asp:ListItem>
                <asp:ListItem Value="5">5%</asp:ListItem>
                <asp:ListItem Value="7">7%</asp:ListItem>
            </asp:RadioButtonList>
            <br />

                Loan Period(36 to 60 months)
            <asp:TextBox ID="loanPeriodTextBox" runat="server" Text="60" AutoPostBack="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" CssClass="errorMessage" 
                Display="Dynamic" ControlToValidate="loanPeriodTextBox"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="loanPeriodValidator" runat="server" ErrorMessage="36 to 60 months" CssClass="errorMessage" 
                Type="Integer" MinimumValue="36" MaximumValue="60" Display="Dynamic" ControlToValidate="loanPeriodTextBox"></asp:RangeValidator>
            <br /><br />


            <asp:Button ID="calculateButton" runat="server" Text="Calculate Loan" OnClick="calculateButton_Click" /> 
            <br />

            <asp:Label ID="principalText" runat="server" Visible="false" Text=""></asp:Label>
            <br />
            <asp:Label ID="interestRateAsDecimalText" runat="server" Visible="false" Text=""></asp:Label>
            <br />
            <asp:Label ID="monthlyPaymentText" runat="server" Visible="false" Text=""></asp:Label>
            <br />
            <asp:Label ID="totalPaymentText" runat="server" Visible="false" Text=""></asp:Label>
            <br />
            <asp:Label ID="totalInterestPaidText" runat="server" Visible="false" Text=""></asp:Label>

        </div>
    </form>
</body>
</html>
