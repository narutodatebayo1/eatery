<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ingredient.aspx.cs" Inherits="EateryDuwamish.Ingredient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="post-add-div" id="postAddDiv" runat="server" visible="false">
            Form Dish
            <div>
                <div>
                    <asp:TextBox ID="IngredientIDTextBox" runat="server" Visible="false"></asp:TextBox>
                </div>
                <div>
                    <p>Ingredient Name</p>
                    <asp:TextBox ID="IngredientNameTextBox" runat="server"></asp:TextBox>
                </div>
                <div>
                    <p>Ingredient Quantity</p>
                    <asp:TextBox ID="IngredientQuantityTextBox" runat="server"></asp:TextBox>
                </div>
                <div>
                    <p>Ingredient Unit</p>
                    <asp:TextBox ID="IngredientUnitTextBox" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
        </div>
        <asp:Button ID="AddButton" runat="server" Text="ADD" OnClick="AddButton_Click" />
        <asp:Button ID="DeleteButton" runat="server" Text="DELETE" OnClick="DeleteButton_Click" />


        <asp:GridView ID="IngredientGridView" runat="server" AutoGenerateColumns="false" DataKeyNames="IngredientID">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="IngredientID" HeaderText="Ingredient ID" Visible="false" />
                <asp:BoundField DataField="IngredientName" HeaderText="Ingredient" />
                <asp:BoundField DataField="IngredientQuantity" HeaderText="Quantity" />
                <asp:BoundField DataField="IngredientUnit" HeaderText="Unit" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        Toggle
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Button ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:TextBox ID="DescriptionTextBox" runat="server" Enabled="false"></asp:TextBox>
        <asp:Button ID="EditDescriptionButton" runat="server" Text="Edit" OnClick="EditDescriptionButton_Click" />
        <asp:Button ID="CancelDescriptionButton" runat="server" Text="Cancel" OnClick="CancelDescriptionButton_Click" Visible="false" />
        <asp:Button ID="SaveDescriptionButton" runat="server" Text="Save" OnClick="SaveDescriptionButton_Click" />
    </div>
    </form>
</body>
</html>--%>


<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Ingredient.aspx.cs" Inherits="EateryDuwamish.Ingredient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="post-add-div" id="postAddDiv" runat="server" visible="false">
            Form Dish
            <div>
                <div>
                    <asp:TextBox ID="IngredientIDTextBox" runat="server" Visible="false"></asp:TextBox>
                </div>
                <div>
                    <p>Ingredient Name</p>
                    <asp:TextBox ID="IngredientNameTextBox" runat="server"></asp:TextBox>
                </div>
                <div>
                    <p>Ingredient Quantity</p>
                    <asp:TextBox ID="IngredientQuantityTextBox" runat="server"></asp:TextBox>
                </div>
                <div>
                    <p>Ingredient Unit</p>
                    <asp:TextBox ID="IngredientUnitTextBox" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
        </div>
        <asp:Button ID="AddButton" runat="server" Text="ADD" OnClick="AddButton_Click" />
        <asp:Button ID="DeleteButton" runat="server" Text="DELETE" OnClick="DeleteButton_Click" />


        <asp:GridView ID="IngredientGridView" runat="server" AutoGenerateColumns="false" DataKeyNames="IngredientID">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="IngredientID" HeaderText="Ingredient ID" Visible="false" />
                <asp:BoundField DataField="IngredientName" HeaderText="Ingredient" />
                <asp:BoundField DataField="IngredientQuantity" HeaderText="Quantity" />
                <asp:BoundField DataField="IngredientUnit" HeaderText="Unit" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        Toggle
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Button ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:TextBox ID="DescriptionTextBox" runat="server" Enabled="false"></asp:TextBox>
        <asp:Button ID="EditDescriptionButton" runat="server" Text="Edit" OnClick="EditDescriptionButton_Click" />
        <asp:Button ID="CancelDescriptionButton" runat="server" Text="Cancel" OnClick="CancelDescriptionButton_Click" Visible="false" />
        <asp:Button ID="SaveDescriptionButton" runat="server" Text="Save" OnClick="SaveDescriptionButton_Click" />
</asp:Content>
