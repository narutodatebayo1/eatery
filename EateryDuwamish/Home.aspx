<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EateryDuwamish.Home" %>
<%@ Register Src="~/UserControl/NotificationControl.ascx" TagName="NotificationControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script type="text/javascript">
        $(function () {
            var table = null;
            if ($.fn.dataTable.isDataTable('#<%= GridView.ClientID %>')) {
               
                table = $('#<%= GridView.ClientID %>').DataTable();
            }
            else {
                table = $('#<%= GridView.ClientID %>').DataTable({
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
            <h2 class="title">Dish Page</h2>
        </div>
        <div class="add-delete-button-div">
            <asp:Button CssClass="btn btn-primary" Width="100" ID="AddButton" runat="server" Text="ADD" OnClick="AddButton_Click" />
            <asp:Button CssClass="btn btn-danger" Width="100" ID="DeleteButton" runat="server" Text="DELETE" OnClick="DeleteButton_Click" />
        </div>
    </div>

    <asp:Panel CssClass="post-add-div" ID="DishFormPanel" runat="server" Visible="false">
        <div>
            <asp:TextBox ID="DishIDTextBox" runat="server" Visible="false"></asp:TextBox>
        </div>
        <div>
            <h5>Dish Name</h5>
            <asp:TextBox ID="DishNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="SubmitValidationGroup" runat="server" ControlToValidate="DishNameTextBox" ForeColor="Red" ErrorMessage="Please fill this field"></asp:RequiredFieldValidator>
        </div>
        <div>
            <h5>Dish Type</h5>
            <asp:DropDownList ID="DishTypeDropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="SubmitValidationGroup" runat="server" InitialValue="Select Type" ControlToValidate="DishTypeDropDownList" ForeColor="Red" ErrorMessage="Please fill this field"></asp:RequiredFieldValidator>
        </div>
        <div>
            <h5>Dish Price</h5>
            <asp:TextBox ID="DishPriceTextBox" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="SubmitValidationGroup" runat="server" ControlToValidate="DishPriceTextBox" ForeColor="Red" ErrorMessage="Please fill this field"></asp:RequiredFieldValidator>
        </div>

        <br />

        <asp:Button CssClass="btn btn-primary" Width="100" ID="SubmitButton" ValidationGroup="SubmitValidationGroup" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
    </asp:Panel>

    <br/>

    <asp:GridView CssClass="table table-borderless" ID="GridView" runat="server" AutoGenerateColumns="false" DataKeyNames="DishID" ShowHeaderWhenEmpty="true">
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
                <HeaderTemplate>
                    Toggle
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button CssClass="btn btn-primary" Width="100" ID="RecipesButton" runat="server" Text="Recipes" OnClick="RecipesButton_Click" />
                    <asp:Button CssClass="btn btn-primary" Width="100" ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
