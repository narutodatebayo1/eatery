using BusinessFacade;
using Common.Data;
using Common.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EateryDuwamish
{
    public partial class Recipe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void BindGridView()
        {
            List<RecipeData> recipeList = new RecipeSystem().GetRecipeByDishID(Int32.Parse(Request.QueryString["dish_id"]));
            RecipeGridView.DataSource = recipeList;
            RecipeGridView.DataBind();

            CreateHeader();
        }

        protected void CreateHeader()
        {
            RecipeGridView.UseAccessibleHeader = true;
            RecipeGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
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

                BindGridView();

                // ngosongin form biar kaya ke reload
                RecipeFormPanel.Visible = false;
                RecipeNameTextBox.Text = "";

                notifDish.Show("Data sukses disimpan", NotificationType.Success);
            }
            catch (Exception ex)
            {
                notifDish.Show($"ERROR SUBMIT DATA: {ex.Message}", NotificationType.Danger);
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            RecipeFormPanel.Visible = true;
            RecipeNameTextBox.Focus();

            CreateHeader();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
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

                if (list.Count == 0)
                {
                    notifDish.Show("NO DATA SELECTED", NotificationType.Danger);
                    CreateHeader();
                    return;
                }

                new RecipeSystem().DeleteRecipes(list);

                BindGridView();

                notifDish.Show("Data sukses dihapus", NotificationType.Success);
            }
            catch (Exception ex)
            {
                notifDish.Show($"ERROR DELETE DATA: {ex.Message}", NotificationType.Danger);
            }


        }

        protected void DetailButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            string dish_id = Request.QueryString["dish_id"];
            string recipe_id = RecipeGridView.DataKeys[row.RowIndex]["RecipeID"].ToString();

            Response.Redirect($"~/Ingredient.aspx?dish_id={dish_id}&recipe_id={recipe_id}");
        }

    }
}