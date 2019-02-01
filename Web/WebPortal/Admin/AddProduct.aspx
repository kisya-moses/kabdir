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
                <div id="form-product" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class=""><a href="#tab-general" data-toggle="tab" aria-expanded="false">General</a></li>
                        <li class="active"><a href="#tab-data" data-toggle="tab" aria-expanded="true">Data</a></li>
                        <li class=""><a href="#tab-discount" data-toggle="tab" aria-expanded="false">Discount</a></li>
                        <li class=""><a href="#tab-image" data-toggle="tab" aria-expanded="false">Image</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane" id="tab-general">
                            <ul class="nav nav-tabs" id="language">
                                <li class="active"><a href="#language1" data-toggle="tab" aria-expanded="false">
                                    <img src="language/en-gb/en-gb.png" title="English">
                                    English</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="language1">
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name1">Product Name</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox type="text" name="product_description[1][name]" value="" placeholder="Product Name" id="input-name1" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-description1">Description</label>
                                        <div class="col-sm-10">
                                            <textarea name="product_description[1][description]" 
                                                placeholder="Description" 
                                                id="input-description1" data-toggle="summernote" 
                                                data-lang="" class="form-control" 
                                                style="display: none;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane active" id="tab-data">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-model">Model</label>
                                <div class="col-sm-10">
                                    <input type="text" name="model" value="" placeholder="Model" id="input-model" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip" title="" data-original-title="Stock Keeping Unit">SKU</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="sku" value="" placeholder="SKU" id="input-sku" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-upc"><span data-toggle="tooltip" title="" data-original-title="Universal Product Code">UPC</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="upc" value="" placeholder="UPC" id="input-upc" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-ean"><span data-toggle="tooltip" title="" data-original-title="European Article Number">EAN</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="ean" value="" placeholder="EAN" id="input-ean" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-jan"><span data-toggle="tooltip" title="" data-original-title="Japanese Article Number">JAN</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="jan" value="" placeholder="JAN" id="input-jan" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip" title="" data-original-title="International Standard Book Number">ISBN</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="isbn" value="" placeholder="ISBN" id="input-isbn" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-mpn"><span data-toggle="tooltip" title="" data-original-title="Manufacturer Part Number">MPN</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="mpn" value="" placeholder="MPN" id="input-mpn" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-location">Location</label>
                                <div class="col-sm-10">
                                    <input type="text" name="location" value="" placeholder="Location" id="input-location" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-price">Price</label>
                                <div class="col-sm-10">
                                    <input type="text" name="price" value="" placeholder="Price" id="input-price" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-tax-class">Tax Class</label>
                                <div class="col-sm-10">
                                    <select name="tax_class_id" id="input-tax-class" class="form-control">
                                        <option value="0">--- None --- </option>
                                        <option value="9">Taxable Goods</option>
                                        <option value="10">Downloadable Products</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-quantity">Quantity</label>
                                <div class="col-sm-10">
                                    <input type="text" name="quantity" value="1" placeholder="Quantity" id="input-quantity" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip" title="" data-original-title="Force a minimum ordered amount">Minimum Quantity</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="minimum" value="1" placeholder="Minimum Quantity" id="input-minimum" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-subtract">Subtract Stock</label>
                                <div class="col-sm-10">
                                    <select name="subtract" id="input-subtract" class="form-control">
                                       <option value="1" selected="selected">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="" data-original-title="Status shown when a product is out of stock">Out Of Stock Status</span></label>
                                <div class="col-sm-10">
                                    <select name="stock_status_id" id="input-stock-status" class="form-control">
                                        <option value="6">2-3 Days</option>
                                        <option value="7">In Stock</option>
                                        <option value="5">Out Of Stock</option>
                                        <option value="8">Pre-Order</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Requires Shipping</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="shipping" value="1" checked="checked">
                                        Yes
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="shipping" value="0">
                                        No
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-date-available">Date Available</label>
                                <div class="col-sm-3">
                                    <div class="input-group date">
                                        <input type="text" name="date_available" value="2019-01-30" placeholder="Date Available" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-length">Dimensions (L x W x H)</label>
                                <div class="col-sm-10">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <input type="text" name="length" value="" placeholder="Length" id="input-length" class="form-control">
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" name="width" value="" placeholder="Width" id="input-width" class="form-control">
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="text" name="height" value="" placeholder="Height" id="input-height" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-length-class">Length Class</label>
                                <div class="col-sm-10">
                                    <select name="length_class_id" id="input-length-class" class="form-control">
                                       <option value="1" selected="selected">Centimeter</option>
                                       <option value="2">Millimeter</option>
                                        <option value="3">Inch</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-weight">Weight</label>
                                <div class="col-sm-10">
                                    <input type="text" name="weight" value="" placeholder="Weight" id="input-weight" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-weight-class">Weight Class</label>
                                <div class="col-sm-10">
                                    <select name="weight_class_id" id="input-weight-class" class="form-control">
                                        <option value="1" selected="selected">Kilogram</option>
                                        <option value="2">Gram</option>
                                        <option value="5">Pound </option>
                                        <option value="6">Ounce</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status">Status</label>
                                <div class="col-sm-10">
                                    <select name="status" id="input-status" class="form-control">




                                        <option value="1" selected="selected">Enabled</option>
                                        <option value="0">Disabled</option>




                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-sort-order">Sort Order</label>
                                <div class="col-sm-10">
                                    <input type="text" name="sort_order" value="1" placeholder="Sort Order" id="input-sort-order" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-links">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Manufacturer</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="manufacturer" value="" placeholder="Manufacturer" id="input-manufacturer" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                                    <input type="hidden" name="manufacturer_id" value="0">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Categories</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="category" value="" placeholder="Categories" id="input-category" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                                    <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Filters</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="filter" value="" placeholder="Filters" id="input-filter" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                                    <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Stores</label>
                                <div class="col-sm-10">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="product_store[]" value="0" checked="checked">
                                                Default
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Downloads</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="download" value="" placeholder="Downloads" id="input-download" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                                    <div id="product-download" class="well well-sm" style="height: 150px; overflow: auto;"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Related Products</span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="related" value="" placeholder="Related Products" id="input-related" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                                    <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-discount">
                            <div class="table-responsive">
                                <table id="discount" class="table table-striped table-bordered table-hover">
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
                        <div class="tab-pane" id="tab-image">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td class="text-left">Image</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-left"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">
                                                <img src="http://localhost:8001/opencart/image/cache/no_image-100x100.png" alt="" title="" data-placeholder="http://localhost:8001/opencart/image/cache/no_image-100x100.png"></a>
                                                <input type="hidden" name="image" value="" id="input-image"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table-responsive">
                                <table id="images" class="table table-striped table-bordered table-hover">
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
                                                <button type="button" onclick="addImage();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Image"><i class="fa fa-plus-circle"></i></button>
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
