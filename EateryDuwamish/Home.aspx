

<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EateryDuwamish.Home" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p>
        DISHES
    </p>
    <p>
        View, manage, and choose your disired dish here.
    </p>

    <div class="post-add-div" id="postAddDiv" runat="server" visible="false">
        Form Dish
        <div>
            <div>
                <asp:TextBox ID="DishIDTextBox" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>
                <p>Dish Name</p>
                <asp:TextBox ID="DishNameTextBox" runat="server"></asp:TextBox>
            </div>
            <div>
                <p>Dish Type</p>
                <asp:DropDownList ID="DishTypeDropDownList" runat="server"></asp:DropDownList>
            </div>
            <div>
                <p>Dish Price</p>
                <asp:TextBox ID="DishPriceTextBox" runat="server"></asp:TextBox>
            </div>
            <asp:Button CssClass="button blue-background" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
        </div>
    </div>
    <asp:Button CssClass="button blue-background" ID="AddButton" runat="server" Text="ADD" OnClick="AddButton_Click" />
    <asp:Button CssClass="button red-background" ID="DeleteButton" runat="server" Text="DELETE" OnClick="DeleteButton_Click" />

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


    <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="false" DataKeyNames="DishID">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DishID" HeaderText="Dish ID" Visible="false" />
            <asp:BoundField DataField="DishName" HeaderText="Dish Name" />
            <asp:BoundField DataField="DishTypeID" HeaderText="Dish Type" />
            <asp:BoundField DataField="DishPrice" HeaderText="Dish Price" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="RecipesButton" runat="server" Text="Recipes" OnClick="RecipesButton_Click" />
                    <asp:Button ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" />
                </ItemTemplate>
                <HeaderTemplate>
                    Toggle
                </HeaderTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>