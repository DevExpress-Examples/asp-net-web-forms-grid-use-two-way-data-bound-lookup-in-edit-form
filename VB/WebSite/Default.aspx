<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>How to use two-way data-bound ASPxGridLookup in edit form of ASPxGridView to edit data</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsProducts"
            KeyFieldName="ProductID" OnRowInserting="grid_RowInserting" OnRowUpdating="grid_RowUpdating">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" Visible="False"
                    VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CategoryID" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="dsCategories" TextField="CategoryName" ValueField="CategoryID"
                        ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditItemTemplate>
                        <dx:ASPxGridLookup ID="glCategory" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="dsCategories" KeyFieldName="CategoryID" OnLoad="glCategory_Load" 
                            TextFormatString="{1}" Value='<%#Bind("CategoryID")%>' Width="260px">
                            <GridViewProperties>
                                <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                            </GridViewProperties>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" 
                                    Visible="False" VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridLookup>
                    </EditItemTemplate>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn VisibleIndex="6" ShowEditButton="True" ShowNewButton="True"/>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        InsertCommand="INSERT INTO [Products] ([ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder]) VALUES (@ProductName, @CategoryID, @UnitPrice, @UnitsInStock, @UnitsOnOrder)"
        SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder] FROM [Products]"
        UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [CategoryID] = @CategoryID, [UnitPrice] = @UnitPrice, [UnitsOnOrder] = @UnitsOnOrder WHERE [ProductID] = @ProductID">
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
            <asp:Parameter Name="ProductID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
