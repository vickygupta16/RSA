<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentScreen.aspx.cs" Inherits="RSA_Payment_Web_App.PaymentScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <title>Payment Gateway</title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <h2 class="text-center">11-Vicky Gupta</h2>
                    <h3 class="text-center">Question 14</h3>
                    <hr />
                    <div class="card shadow-lg">
                        <div class="card-header">
                            <h4 class="text-center">Online Payment via VISA</h4>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <tr>
                                    <td class="text-right">Card Number : </td>
                                    <td colspan="2">
                                        <asp:TextBox required MaxLength="16" ID="card_number_input" runat="server" placeholder="Card Number" CssClass="form-control text-center"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right">Expiration : </td>
                                    <td>
                                        <asp:DropDownList ID="exp_month_input" runat="server" required CssClass="form-control">
                                            <asp:ListItem Text="mm" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="exp_year_input" runat="server" required CssClass="form-control">
                                            <asp:ListItem Text="yyyy" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                                            <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                                            <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                                            <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right">CVV : </td>
                                    <td colspan="2">
                                        <asp:TextBox MaxLength="3" ID="cvv_input" runat="server" required CssClass="form-control text-center" placeholder="CVV"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:Button ID="submit_card_details" runat="server" Text="Pay" CssClass="btn btn-block btn-success" OnClick="submit_card_details_Click" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="3" align="center">
                                        <a href="PaymentHistory.aspx" class="btn btn-block btn-outline-success">Show Database</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="container">
            <%--<div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Public Key</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="public_key" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Private Key</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="private_key" runat="server" Text=""></asp:Label>
                </div>
            </div>--%>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Encrypted Card Number</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="ecn" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Decrypted Card Number</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="dcn" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Encrypted Exp Month</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="eem" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Decrypted Exp Month</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="dem" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Encrypted Exp Year</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="eey" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Decrypted Exp Year</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="dey" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Encrypted CVV</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="ecvv" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row justify-content-between">
                <div class="col-2 text-center">
                    <p>Decrypted CVV</p>
                </div>
                <div class="col-10">
                    <asp:Label ID="dcvv" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
