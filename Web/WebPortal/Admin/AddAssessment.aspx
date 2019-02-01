<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true" CodeBehind="~/Admin/AddAssessment.aspx.cs" Inherits="WebPortal.Admin.AddAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
<div class="col-md-3 mb-3"></div>
    <div class="col-md-6 mb-6">
        <script type="text/javascript">
            $("#<%=TimeToRespondToEachQuestion.ClientID.ToString()%>").timepicker({format:"HH:MM:SS"});  
        </script>
        <div class="card">
        <div class="card-header info-color white-text text-center py-4">
            <strong>Add An Assessment/Quiz</strong>
        </div>
        <!--Card content-->
        <div class="card-body px-lg-5 pt-0">
            <!-- Form -->
            <div class="text-center" style="color: #757575;">
                <!-- Email -->
                <div class="md-form text-danger text-uppercase">
                    <asp:Literal ID="msg" runat="server" />
                </div>
                <div class="md-form">
                    <asp:HiddenField ID="QzID" runat="server" />
                    <asp:TextBox runat="server" ID="Title1" MaxLength="50"
                        placeholder="Quiz Title" CssClass="form-control"  required="required">
                    </asp:TextBox>
                    <label for="Title">Quiz Title</label>
                </div>
                <div class="md-form">                    
                    <asp:TextBox runat="server" ID="Description" TextMode="MultiLine" Rows="3"
                        placeholder="Quiz Description" CssClass="form-control" required="required">
                    </asp:TextBox>
                    <label for="Description">Description</label>
                </div>
                <div class="md-form">                    
                    <asp:textbox runat="server" ID="startdate" type="datetime"
                        placeholder="start date" cssclass="form-control datetime">
                    </asp:textbox>
                    <label for="startdate">start date</label>
                </div>
    
                <div class="md-form">                    
                    <asp:TextBox AutoCompleteType="None" autocomplete="never" runat="server" 
                        ID="EndDate" ClientIDMode="Static"                        
                        placeholder="End Date" CssClass="form-control"  required="required">
                    </asp:TextBox>
                    <label for="StartDate">End Date</label>
                </div>
                <div class="md-form">                    
                    <asp:TextBox 
                        runat="server" type="number"                        
                        ID="TimeToRespondToEachQuestion"  
                        placeholder="Maximum Time Per Question in Seconds" 
                        CssClass="form-control time" min="10" required="required" >
                    </asp:TextBox>
                    <label for="StartDate">Maximum Time Per Question (in Seconds)</label>
                </div>
                <!-- Sign in button -->
                <asp:Button 
                    runat="server" 
                    CssClass="btn btn-outline-primary btn-rounded btn-block my-4 waves-effect z-depth-0" 
                    Text="Add Quiz" 
                    OnClick="Add_Quiz_Click" 
                    />
                <!-- Register -->
            </div>
            <!-- Form -->
        </div>
    </div>
    </div>
    <div class="col-md-3 mb-3"></div>
</asp:Content>
