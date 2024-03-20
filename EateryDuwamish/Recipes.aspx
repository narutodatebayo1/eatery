<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="EateryDuwamish.Recipes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Recipes</h1>

        <div class="post-add-div" id="postAddDiv" runat="server" visible="false">
            Form Dish
            <div>
                <div>
                    <p>Recipe Name</p>
                    <asp:TextBox ID="RecipeNameTextBox" runat="server"></asp:TextBox>
                </div>
                <asp:Button CssClass="button blue-background" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click"  />
            </div>
        </div>
        <asp:Button CssClass="button blue-background" ID="AddButton" runat="server" Text="ADD" OnClick="AddButton_Click" />
        <asp:Button CssClass="button red-background" ID="DeleteButton" runat="server" Text="DELETE" OnClick="DeleteButton_Click" />

        <asp:GridView ID="RecipeGridView" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="RecipeGridView_SelectedIndexChanged" DataKeyNames="RecipeID">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RecipeID" HeaderText="Recipe ID" Visible="false" />
            <asp:BoundField DataField="RecipeName" HeaderText="Recipe Name" />
            <asp:TemplateField>
                <HeaderTemplate>
                    Toggle
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button ID="DetailButton" runat="server" Text="Detail" OnClick="DetailButton_Click" CommandName="Select" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    </div>
    </form>
</body>
</html>--%>




<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="EateryDuwamish.Recipes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Recipes</h1>

        <div class="post-add-div" id="postAddDiv" runat="server" visible="false">
            Form Dish
            <div>
                <div>
                    <p>Recipe Name</p>
                    <asp:TextBox ID="RecipeNameTextBox" runat="server"></asp:TextBox>
                </div>
                <asp:Button CssClass="button blue-background" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click"  />
            </div>
        </div>
        <asp:Button CssClass="button blue-background" ID="AddButton" runat="server" Text="ADD" OnClick="AddButton_Click" />
        <asp:Button CssClass="button red-background" ID="DeleteButton" runat="server" Text="DELETE" OnClick="DeleteButton_Click" />

        <asp:GridView ID="RecipeGridView" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="RecipeGridView_SelectedIndexChanged" DataKeyNames="RecipeID">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RecipeID" HeaderText="Recipe ID" Visible="false" />
                <asp:BoundField DataField="RecipeName" HeaderText="Recipe Name" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        Toggle
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Button ID="DetailButton" runat="server" Text="Detail" OnClick="DetailButton_Click" CommandName="Select" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</asp:Content>