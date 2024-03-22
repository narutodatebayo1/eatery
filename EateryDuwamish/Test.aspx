<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="EateryDuwamish.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - My ASP.NET Application</title>
    <!-- jQuery -->
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="<%= ResolveClientUrl("~/assets/bootstrap/css/bootstrap.min.css") %>" />
    <!-- Optional theme -->
    <link rel="stylesheet" href="<%= ResolveClientUrl("~/assets/bootstrap/css/bootstrap-theme.min.css") %>" />
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%= ResolveClientUrl("~/assets/bootstrap/css/jquery.dataTables.css") %>" />
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="<%= ResolveClientUrl("~/lib/datatable-bootstrap/dataTables.bootstrap.css")%>" />
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">--%>
    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>
    <!-- Bootstrap-Notify -->
    <script src="<%= ResolveClientUrl("~/lib/bootstrap-growl/js/bootstrap-growl.min.js") %>" type="text/javascript"></script>
    <link href="<%= ResolveClientUrl("~/lib/bootstrap-growl/css/animate.min.css") %>" rel="stylesheet" />
    <link rel="stylesheet" href="<%= ResolveClientUrl("~/assets/main-stylesheet.css") %>" />

    <script type="text/javascript">
        $(function () {
            var table = null;
            if ($.fn.dataTable.isDataTable('#GridView1')) {
                table = $('#GridView1').DataTable();
            }
            else {
                table = $('#GridView1').DataTable({
                    stateSave: false,
                    order: [[1, "asc"]],
                    columnDefs: [{ orderable: false, targets: [0] }]
                });
            }
            return table;
        })
    </script>

</head>
<body>
    <form id="form1" runat="server">

        <div style="padding: 3rem">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-borderless" AutoGenerateColumns="false" DataKeyNames="DishID">
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
                            <asp:Button CssClass="btn btn-primary" ID="RecipesButton" runat="server" Text="Recipes" OnClick="RecipesButton_Click" />
                            <asp:Button CssClass="btn btn-primary" ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>

<%--

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
        <asp:TextBox ID="DescriptionTextBox" runat="server" Enabled="false" O></asp:TextBox>
        <asp:Button ID="EditDescriptionButton" runat="server" Text="Edit" OnClick="EditDescriptionButton_Click" />
        <asp:Button ID="CancelDescriptionButton" runat="server" Text="Cancel" OnClick="CancelDescriptionButton_Click" Visible="false" />
        <asp:Button ID="SaveDescriptionButton" runat="server" Text="Save" OnClick="SaveDescriptionButton_Click" />
    
--%>

<%--
    
    using BusinessFacade;
using Common.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EateryDuwamish
{
    public partial class Ingredient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                DescriptionTextBox.Text = new RecipeSystem().GetRecipeByID(RecipeIdInInt()).RecipeDescription;

                BindGridView();

            }
        }

        protected int RecipeIdInInt()
        {
            return Int32.Parse(Request.QueryString["recipe_id"]);
        }

        protected void BindGridView()
        {
            int recipeID = Int32.Parse(Request.QueryString["recipe_id"]);
            List<IngredientData> ingredientData = new IngredientSystem().GetIngredientByRecipeID(recipeID);
            IngredientGridView.DataSource = ingredientData;
            IngredientGridView.DataBind();
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            postAddDiv.Visible = true;
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            IngredientIDTextBox.Text = IngredientGridView.DataKeys[row.RowIndex]["IngredientID"].ToString();
            IngredientNameTextBox.Text = row.Cells[2].Text;
            IngredientQuantityTextBox.Text = row.Cells[3].Text;
            IngredientUnitTextBox.Text = row.Cells[4].Text;
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            postAddDiv.Visible = true;
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            List<int> list = new List<int>();

            for (int i = 0; i < IngredientGridView.Rows.Count; i++)
            {
                var checkBox = IngredientGridView.Rows[i].FindControl("CheckBox") as CheckBox;
                if (checkBox.Checked)
                {
                    list.Add(Int32.Parse(IngredientGridView.DataKeys[i]["IngredientID"].ToString()));
                }
            }
            new IngredientSystem().DeleteIngredients(list);

            BindGridView();


        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string name = IngredientNameTextBox.Text;
            string unit = IngredientUnitTextBox.Text;
            int quantity;
            try
            {
                quantity = Int32.Parse(IngredientQuantityTextBox.Text);
            }
            catch
            {
                return;
            }

            IngredientData ingredient = new IngredientSystem().GetIngredientByRecipeID(RecipeIdInInt()).LastOrDefault();

            if(ingredient == null)
            {
                InsertUpdateIngredient(0, RecipeIdInInt(), name, quantity, unit);
            }
            else
            {

                if (IngredientIDTextBox.Text == "")
                {
                    InsertUpdateIngredient(0, RecipeIdInInt(), name, quantity, unit);
                }
                else
                {
                    int newId = Int32.Parse(IngredientIDTextBox.Text);
                    InsertUpdateIngredient(newId, RecipeIdInInt(), name, quantity, unit);
                }
                
            }
            

            BindGridView();

            // reload
            postAddDiv.Visible = false;
            IngredientIDTextBox.Text = "";
            IngredientNameTextBox.Text = "";
            IngredientQuantityTextBox.Text = "";
            IngredientUnitTextBox.Text = "";
        }

        protected void InsertUpdateIngredient(int ingredientId, int recipeId, string name, int quantity, string unit)
        {
            IngredientData newIngredient = new IngredientData()
            {
                IngredientID = ingredientId,
                RecipeID = recipeId,
                IngredientName = name,
                IngredientQuantity = quantity,
                IngredientUnit = unit
            };
            new IngredientSystem().InsertUpdateIngredient(newIngredient);
        }

        protected void EditDescriptionButton_Click(object sender, EventArgs e)
        {
            DescriptionTextBox.Enabled = true;
            EditDescriptionButton.Visible = false;
            CancelDescriptionButton.Visible = true;
        }

        protected void CancelDescriptionButton_Click(object sender, EventArgs e)
        {
            // mengemballikan value dalam textbox ke semula
            DescriptionTextBox.Text = new RecipeSystem().GetRecipeByID(RecipeIdInInt()).RecipeDescription;

            DescriptionTextBox.Enabled = false;
            EditDescriptionButton.Visible = true;
            CancelDescriptionButton.Visible = false;
        }

        protected void SaveDescriptionButton_Click(object sender, EventArgs e)
        {
            // recipe name kosong karena yang akan di update cuma recipe description
            // jadi tidak mempengaruhi recipe name
            new RecipeSystem().InsertUpdateRecipe(new RecipeData()
            {
                RecipeID = RecipeIdInInt(),
                RecipeName = "",
                RecipeDescription = DescriptionTextBox.Text
            });

            DescriptionTextBox.Enabled = false;
            EditDescriptionButton.Visible = true;
            CancelDescriptionButton.Visible = false;
        }
    }
}

--%>