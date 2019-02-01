<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainTpl.Master" CodeBehind="ResetAccount.aspx.cs" Inherits="WebPortal.ResetAccount" %>

<asp:Content ContentPlaceHolderID="TemplateData" runat="server">
    <!-- Material form login -->
    <div class="col-md-1 mb-1"></div>
    <div class="col-md-8 mb-8">
        <div class="card">
            <h5 class="card-header info-color white-text text-center py-4">
                <strong>Reset Account Password</strong>
            </h5>
            <!--Card content-->
            <div class="card-body px-lg-5 pt-0">
                <!-- Form -->
                <div class="text-center" style="color: #757575;">
                    <!-- Email -->
                    <div class="md-form text-danger text-uppercase">
                        <asp:Literal ID="msg" runat="server" Text="Enter the Email You Use Here." />
                    </div>
                    <asp:PlaceHolder ID="Reset1" runat="server">
                        <div class="md-form">
                            <asp:TextBox runat="server" ID="uname"
                                placeholder="Username or E-mail" CssClass="form-control">
                            </asp:TextBox>
                            <asp:Label runat="server" Text="Email" ID="lbl1" />
                        </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="Reset2" runat="server" Visible="false">
                        <div class="md-form">
                            <asp:TextBox runat="server" ID="pwd1"
                                placeholder="Username or E-mail" CssClass="form-control">
                            </asp:TextBox>
                            <label for="email">New Password</label>
                        </div>
                        <div class="md-form">
                            <asp:TextBox runat="server" ID="pwd2"
                                placeholder="Username or E-mail" CssClass="form-control">
                            </asp:TextBox>
                            <label for="email">Confirm Password</label>
                        </div>
                        <asp:Button ID="ResetPwd" OnClick="ResetPwd_Click" runat="server" Text="Reset" />
                    </asp:PlaceHolder>
                    <!-- Sign in button -->
                    <asp:Button runat="server" CssClass="btn btn-outline-primary btn-rounded btn-block my-4 waves-effect z-depth-0" Text="RESET" OnClick="Loginbtn_Click" ID="ResetBtn" />
                    <!-- Register -->
                </div>
                <!-- Form -->

            </div>

        </div>
    </div>
    <div class="col-md-3 mb-3"></div>
</asp:Content>
