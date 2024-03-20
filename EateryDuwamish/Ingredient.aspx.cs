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