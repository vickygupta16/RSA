<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentHistory.aspx.cs" Inherits="RSA_Payment_Web_App.PaymentHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <title>Payment History</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="max-height:700px;overflow-y:scroll">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Payment_ID" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <Columns>
                            <asp:BoundField DataField="Payment_ID" HeaderText="Payment_ID" InsertVisible="False" ReadOnly="True" SortExpression="Payment_ID" />
                            <asp:BoundField DataField="Card_Number" HeaderText="Card_Number" SortExpression="Card_Number" />
                            <asp:BoundField DataField="Exp_Month" HeaderText="Exp_Month" SortExpression="Exp_Month" />
                            <asp:BoundField DataField="Exp_Year" HeaderText="Exp_Year" SortExpression="Exp_Year" />
                            <asp:BoundField DataField="CVV" HeaderText="CVV" SortExpression="CVV" />
                            <asp:BoundField DataField="Card_Number_Encrypted" HeaderText="Card_Number_Encrypted" SortExpression="Card_Number_Encrypted" />
                            <asp:BoundField DataField="Exp_Month_Encrypted" HeaderText="Exp_Month_Encrypted" SortExpression="Exp_Month_Encrypted" />
                            <asp:BoundField DataField="Exp_Year_Encrypted" HeaderText="Exp_Year_Encrypted" SortExpression="Exp_Year_Encrypted" />
                            <asp:BoundField DataField="CVV_Encrypted" HeaderText="CVV_Encrypted" SortExpression="CVV_Encrypted" />
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Payment_RSA]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <br /><br />
        <div class="container" style="max-height:700px;overflow-y:scroll">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PED_ID" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="PED_ID" HeaderText="PED_ID" InsertVisible="False" ReadOnly="True" SortExpression="PED_ID" />
                            <asp:BoundField DataField="Card_Number_Encrypted" HeaderText="Card_Number_Encrypted" SortExpression="Card_Number_Encrypted" />
                            <asp:BoundField DataField="Exp_Month_Encrypted" HeaderText="Exp_Month_Encrypted" SortExpression="Exp_Month_Encrypted" />
                            <asp:BoundField DataField="Exp_Year_Encrypted" HeaderText="Exp_Year_Encrypted" SortExpression="Exp_Year_Encrypted" />
                            <asp:BoundField DataField="CVV_Encrypted" HeaderText="CVV_Encrypted" SortExpression="CVV_Encrypted" />
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Payment_Encrypted_Details]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
