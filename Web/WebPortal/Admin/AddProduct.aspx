<%@ Page Title="" Language="C#" MasterPageFile="~/MainTpl.Master" AutoEventWireup="true"
    CodeBehind="~/Admin/AddProduct.aspx.cs" Inherits="WebPortal.Admin.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateData" runat="server">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <asp:Button runat="server" ID="EditProfile"
                    data-toggle="tooltip" title="Save"
                    CssClass="btn btn-primary"
                    Text="Update Profile" OnClick="EditProfile_Click" />
                <a href="#" data-toggle="tooltip" title="Cancel" class="btn btn-default">
                    <i class="fa fa-reply"></i>
                </a>
            </div>
            <ul class="breadcrumb">
                <li><a href="<%=Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/')%>">Home</a></li>
                <li><a href="#">Add Product</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="alert alert-success alert-dismissible">
            <i class="fa fa-check-circle"></i>
            <asp:Literal ID="msg" runat="server" />
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i>Add Product</h3>
            </div>
            <div class="panel-body">
                <div ID="form-product" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab" aria-expanded="false">General</a></li>
                        <li class=""><a href="#tab-data" data-toggle="tab" aria-expanded="true">Data</a></li>
                        <li class=""><a href="#tab-discount" data-toggle="tab" aria-expanded="false">Discount</a></li>
                        <li class=""><a href="#tab-image" data-toggle="tab" aria-expanded="false">Image</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane" ID="tab-general">
                            <div class="tab-content">
                                <div class="tab-pane active" ID="language1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Manufacturer</span></label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList runat="server" name="manufacturer"
                                                ID="inputmanufacturer" class="form-control"></asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name1">Product Name</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox type="text" runat="server" name="product_description[1][name]" value="" 
                                                placeholder="Product Name" ID="inputname1" class="form-control" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-description1">Description</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox runat="server" TextMode="MultiLine" Rows="5" name="product_description[1][description]" 
                                                placeholder="Description" 
                                                ID="inputdescription1" data-toggle="summernote" 
                                                data-lang="" class="form-control" 
                                                ></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane active" ID="tab-data">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip" title="" data-original-title="International Standard Book Number">ISBN</span></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" type="text" name="isbn" value="" placeholder="ISBN" ID="inputisbn" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-price">Price</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" type="text" name="price" value="" placeholder="Price" ID="inputprice" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-quantity">Quantity</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" type="text" name="quantity" value="1" placeholder="Quantity" ID="inputquantity" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-subtract">Subtract Stock</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList name="subtract" ID="inputsubtract" runat="server" class="form-control">
                                       <asp:ListItem Value="1" Text="Yes" Selected="True">Yes</asp:ListItem>
                                        <asp:ListItem Value="0" Text="No">No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-length">Dimensions (L x W x H)</label>
                                <div class="col-sm-10">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" type="text" name="length" value="" placeholder="Length" ID="inputlength" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" type="text" name="width" value="" placeholder="Width" ID="inputwidth" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-4">
                                            <asp:TextBox runat="server" type="text" name="height" value="" placeholder="Height" ID="inputheight" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-length-class">Length Class</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList runat="server" name="length_class_id" ID="inputlengthclass" class="form-control">
                                        <asp:ListItem Value="IN" Text="Inches" />
                                        <asp:ListItem Value="M" Text="Meters" />
                                        <asp:ListItem Value="CM" Text="Centimeters" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-weight">Weight</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" type="text" name="weight" value="" placeholder="Weight" ID="inputweight" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-weight-class">Weight Class</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList runat="server" name="weight_class_id" ID="inputweightclass" class="form-control">
                                        <asp:ListItem Value="KGS" Text="KiloGrams" />
                                        <asp:ListItem Value="GRM" Text="Grams" />
                                        <asp:ListItem Value="MGS" Text="Miligrams" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status">Status</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList runat="server" name="status" ID="inputstatus" class="form-control">
                                        <asp:ListItem Value="1" Selected="True">Enabled</asp:ListItem>
                                        <asp:ListItem Value="0">Disabled</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" ID="tab-discount">
                            <div class="table-responsive">
                                <table ID="discount" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td class="text-left">Customer Group</td>
                                            <td class="text-right">Quantity</td>
                                            <td class="text-right">Priority</td>
                                            <td class="text-right">Price</td>
                                            <td class="text-left">Date Start</td>
                                            <td class="text-left">Date End</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>

                                    <tfoot>
                                        <tr>
                                            <td colspan="6"></td>
                                            <td class="text-left">
                                                <button type="button" onclick="addDiscount();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Discount"><i class="fa fa-plus-circle"></i></button>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" ID="tab-image">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td class="text-left">Image</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-left"><a href="" ID="thumb-image" data-toggle="image" class="img-thumbnail">
                                                <img src="http://localhost:8001/opencart/image/cache/no_image-100x100.png" alt="" title="" data-placeholder="http://localhost:8001/opencart/image/cache/no_image-100x100.png"></a>
                                                <asp:HiddenField runat="server" value="" ID="inputimage"></asp:HiddenField>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table-responsive">
                                <table ID="images" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td class="text-left">Additional Images</td>
                                            <td class="text-right">Sort Order</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="2"></td>
                                            <td class="text-left">
                                                <button type="button" onclick="addImage();" 
                                                    data-toggle="tooltip" title="" class="btn btn-primary" 
                                                    data-original-title="Add Image">
                                                    <i class="fa fa-plus-circle"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
