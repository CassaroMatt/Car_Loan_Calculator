<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="hw4.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {background-color: tan;}
        
        .errorMessage {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h1>Car Loan Calculator</h1>
            
            <asp:Label ID="Label1"  runat="server" Text="Vehicle Price">Vehicle Purchase Price</asp:Label> <br />
                <asp:TextBox ID="purchaseTextbox" runat="server"  TextMode="Number" min="10000"  OnTextChanged="purchaseTextbox_TextChanged" AutoPostBack="True" CausesValidation="True" >10000</asp:TextBox>  
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                  runat="server" 
                  ErrorMessage="Required" 
                  ControlToValidate="purchaseTextbox" 
                  Display="Dynamic" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                ErrorMessage="$10k minimum" CssClass="errorMessage" 
                Display="Dynamic" ControlToValidate="purchaseTextbox" 
                Operator="GreaterThanEqual" ValueToCompare="10000" 
                Type="Integer"></asp:CompareValidator>
            <br />
           <br />

                <asp:Label ID="Label2" runat="server" Text="Trade In/Down Payment"></asp:Label><br />
                <asp:TextBox ID="downTextbox" runat="server"  TextMode="Number" min="0" AutoPostBack="True" CausesValidation="True" OnTextChanged="downTextbox_TextChanged" >0</asp:TextBox>    
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                  runat="server" ErrorMessage="Required" 
                  ControlToValidate="downTextbox" CssClass="errorMessage" 
                  Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="Must be less than purchase price" 
                    ControlToValidate="downTextbox" 
                    ControlToCompare="purchaseTextbox" 
                    Operator="LessThan" Type="Integer" 
                    Display="Dynamic" CssClass="errorMessage"></asp:CompareValidator>
            <asp:CompareValidator ID="CompareValidator4" runat="server" 
                ErrorMessage="0 minimum" CssClass="errorMessage" 
                Display="Dynamic" ControlToValidate="downTextbox" 
                Operator="GreaterThanEqual" ValueToCompare="0" 
                Type="Integer"></asp:CompareValidator>
           
            <br />
                         <br />   
            
            <asp:Label ID="Label4" runat="server" Text="Annual Interest Rate"></asp:Label><br />
                 <asp:RadioButtonList ID="rateRadioList" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" CausesValidation="True" OnSelectedIndexChanged="rateRadioList_SelectedIndexChanged">
                    <asp:ListItem  Value="0.03" Selected="True">3%</asp:ListItem>
                    <asp:ListItem Value="0.05">5%</asp:ListItem>                                                                                         
                    <asp:ListItem Value="0.07">7%</asp:ListItem>                                                                                         
                </asp:RadioButtonList>
             
            <br />
            <asp:Label ID="Label5" runat="server" Text="Loan Period (36 to 60 months)"></asp:Label><br />
            <asp:TextBox ID="monthsTextBox" runat="server" TextMode="Number" min="36" Max="60" AutoPostBack="True" CausesValidation="True" OnTextChanged="monthsTextBox_TextChanged">60</asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" CssClass="errorMessage" Display="Dynamic" ControlToValidate="monthsTextbox"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" min="36" max="60" runat="server" ErrorMessage="36 to 60 months" Type="Integer" MaximumValue="60" MinimumValue="36" ControlToValidate="monthsTextbox" CssClass="errorMessage"></asp:RangeValidator>
               <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Calculate Loan" OnClick="Button1_Click" />
            <br />
            <br />
             <asp:Label ID="principalTextbox" runat="server" Text=""></asp:Label><br />
             <asp:Label ID="monthlyrateTextbox" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="monthlypaymentTextbox" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="totalpaymentsTextbox" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="totalinterestTextbox" runat="server" Text=""></asp:Label><br />

         </div>
    </form>
</body>
</html>
