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
    public partial class Recipes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<RecipeData> recipeList = new RecipeSystem().GetRecipeByDishID(Int32.Parse(Request.QueryString["dish_id"]));
                RecipeGridView.DataSource = recipeList;
                RecipeGridView.DataBind();
            }

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            List<RecipeData> recipeList = new RecipeSystem().GetRecipeList();
            List<int> list = new List<int>();

            for (int i = 0; i < RecipeGridView.Rows.Count; i++)
            {
                var checkBox = RecipeGridView.Rows[i].FindControl("CheckBox") as CheckBox;
                if (checkBox.Checked)
                {
                    //GridView.DataKeys[i]["RecipeID"]
                    list.Add(Int32.Parse(RecipeGridView.DataKeys[i]["RecipeID"].ToString()));
                }
            }
            new RecipeSystem().DeleteRecipes(list);

            List<RecipeData> RecipeList = new RecipeSystem().GetRecipeByDishID(Int32.Parse(Request.QueryString["dish_id"]));
            RecipeGridView.DataSource = RecipeList;
            RecipeGridView.DataBind();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            postAddDiv.Visible = true;
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string name = RecipeNameTextBox.Text;

            if (new RecipeSystem().GetRecipeList().Count == 0)
            {
                new RecipeSystem().InsertUpdateRecipe(new RecipeData()
                {
                    RecipeID = 0,
                    DishID = Int32.Parse(Request.QueryString["dish_id"]),
                    RecipeName = name,
                    RecipeDescription = ""
                });
            }
            else
            {
                int id = new RecipeSystem().GetRecipeList().LastOrDefault().RecipeID;
                new RecipeSystem().InsertUpdateRecipe(new RecipeData()
                {
                    RecipeID = 0,
                    DishID = Int32.Parse(Request.QueryString["dish_id"]),
                    RecipeName = name,
                    RecipeDescription = ""
                });
            }

            List<RecipeData> RecipeList = new RecipeSystem().GetRecipeByDishID(Int32.Parse(Request.QueryString["dish_id"]));
            RecipeGridView.DataSource = RecipeList;
            RecipeGridView.DataBind();

            // ngosongin form biar kaya ke reload
            postAddDiv.Visible = false;
            RecipeNameTextBox.Text = "";
        }

        protected void RecipeGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void DetailButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            Response.Redirect("~/Ingredient.aspx?dish_id=" + Request.QueryString["dish_id"] + "&recipe_id=" + RecipeGridView.DataKeys[row.RowIndex]["RecipeID"].ToString());
        }
    }
}