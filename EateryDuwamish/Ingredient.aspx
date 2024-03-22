<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ingredient.aspx.cs" Inherits="EateryDuwamish.Ingredient" %>
<%@ Register Src="~/UserControl/NotificationControl.ascx" TagName="NotificationControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script type="text/javascript">
        $(function () {
            var table = null;
            if ($.fn.dataTable.isDataTable('#<%= IngredientGridView.ClientID %>')) {
               
                table = $('#<%= IngredientGridView.ClientID %>').DataTable();
            }
            else {
                table = $('#<%= IngredientGridView.ClientID %>').DataTable({
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
            <h2 class="title">Ingredient Page</h2>
        </div>
        <div class="add-delete-button-div">
            <asp:Button CssClass="btn btn-primary" Width="100" ID="AddButton" runat="server" Text="ADD" OnClick="AddButton_Click" />
            <asp:Button CssClass="btn btn-danger" Width="100" ID="DeleteButton" runat="server" Text="DELETE" OnClick="DeleteButton_Click" />
        </div>
    </div>

    <asp:Panel CssClass="post-add-div" ID="IngredientFormPanel" runat="server" Visible="false">
        <div>
            <asp:TextBox ID="IngredientIDTextBox" runat="server" Visible="false"></asp:TextBox>
        </div>
        <div>
            <p>Ingredient Name</p>
            <asp:TextBox ID="IngredientNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="SubmitValidationGroup" runat="server" ControlToValidate="IngredientNameTextBox" ForeColor="Red" ErrorMessage="Please fill this field"></asp:RequiredFieldValidator>
        </div>
        <div>
            <p>Ingredient Quantity</p>
            <asp:TextBox ID="IngredientQuantityTextBox" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="SubmitValidationGroup" runat="server" ControlToValidate="IngredientQuantityTextBox" ForeColor="Red" ErrorMessage="Please fill this field"></asp:RequiredFieldValidator>
        </div>
        <div>
            <p>Ingredient Unit</p>
            <asp:TextBox ID="IngredientUnitTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="SubmitValidationGroup" runat="server" ControlToValidate="IngredientUnitTextBox" ForeColor="Red" ErrorMessage="Please fill this field"></asp:RequiredFieldValidator>

        </div>

        <br />

        <asp:Button CssClass="btn btn-primary" Width="100" ID="SubmitButton" ValidationGroup="SubmitValidationGroup" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
    </asp:Panel>

    <br />

    <asp:GridView ID="IngredientGridView" runat="server" AutoGenerateColumns="false" DataKeyNames="IngredientID" ShowHeaderWhenEmpty="true">
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
                    <asp:Button CssClass="btn btn-primary" Width="100" ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div>
        <asp:TextBox ID="DescriptionTextBox" runat="server" Enabled="false" TextMode="MultiLine" Width="350" Height="200"></asp:TextBox>
    </div>

    <asp:Button CssClass="btn btn-primary" Width="100" ID="EditDescriptionButton" runat="server" Text="Edit" OnClick="EditDescriptionButton_Click" />
    <asp:Button CssClass="btn btn-danger" Width="100" ID="CancelDescriptionButton" runat="server" Text="Cancel" OnClick="CancelDescriptionButton_Click" Visible="false" />
    <asp:Button CssClass="btn btn-primary" Width="100" ID="SaveDescriptionButton" runat="server" Text="Save" OnClick="SaveDescriptionButton_Click" />

</asp:Content>
