<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recipe.aspx.cs" Inherits="EateryDuwamish.Recipe" %>
<%@ Register Src="~/UserControl/NotificationControl.ascx" TagName="NotificationControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script type="text/javascript">
        $(function () {
            var table = null;
            if ($.fn.dataTable.isDataTable('#<%= RecipeGridView.ClientID %>')) {
               
                table = $('#<%= RecipeGridView.ClientID %>').DataTable();
            }
            else {
                table = $('#<%= RecipeGridView.ClientID %>').DataTable({
                    stateSave: false,
                    order: [[1, "asc"]],
                    columnDefs: [{ orderable: false, targets: [0] }]
                });
            }
            return table;
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <uc1:NotificationControl ID="notifDish" runat="server" />

    <div class="header">
        <div>
            <h2 class="title">Recipe Page</h2>
        </div>
        <div class="add-delete-button-div">
            <asp:Button CssClass="btn btn-primary" Width="100" ID="AddButton" runat="server" Text="ADD" OnClick="AddButton_Click" />
            <asp:Button CssClass="btn btn-danger" Width="100" ID="DeleteButton" runat="server" Text="DELETE" OnClick="DeleteButton_Click" />
        </div>
    </div>

    <asp:Panel CssClass="post-add-div" ID="RecipeFormPanel" runat="server" Visible="false">
        <div>
            <p>Recipe Name</p>
            <asp:TextBox ID="RecipeNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="SubmitValidationGroup" runat="server" ControlToValidate="RecipeNameTextBox" ForeColor="Red" ErrorMessage="Please fill this field"></asp:RequiredFieldValidator>
        </div>

        <br />

        <asp:Button CssClass="btn btn-primary" Width="100" ID="SubmitButton" ValidationGroup="SubmitValidationGroup" runat="server" Text="Submit" OnClick="SubmitButton_Click"  />
    </asp:Panel>

    <br />

    <asp:GridView ID="RecipeGridView" runat="server" AutoGenerateColumns="false" DataKeyNames="RecipeID" ShowHeaderWhenEmpty="true">
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
                    <asp:Button CssClass="btn btn-primary" Width="100" ID="DetailButton" runat="server" Text="Detail" OnClick="DetailButton_Click" CommandName="Select" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
