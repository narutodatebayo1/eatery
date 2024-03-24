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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DishTypeBind();
                BindGridView();
            }
        }

        protected void DishTypeBind()
        {
            List<DishTypeData> dishDataList = new DishTypeSystem().GetDishTypeList();
            DishTypeDropDownList.DataSource = dishDataList.Select(x => x.DishTypeName);
            DishTypeDropDownList.DataBind();
            DishTypeDropDownList.Items.Insert(0, "Select Type");
        }

        protected void BindGridView()
        {
            List<DishData> DishList = new DishSystem().GetDishList();
            GridView.DataSource = DishList;
            GridView.DataBind();

            for (int i = 0; i < DishList.Count; i++)
            {
                int id = Int32.Parse(GridView.Rows[i].Cells[3].Text);
                DishTypeData DishType = new DishTypeSystem().GetDishTypeByID(id);
                GridView.Rows[i].Cells[3].Text = DishType.DishTypeName;
            }

            CreateHeader();
        }

        protected void CreateHeader()
        {
            GridView.UseAccessibleHeader = true;
            GridView.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void DeleteRecipe(int dishId)
        {
            List<int> recipeIdList = new RecipeSystem().GetRecipeByDishID(dishId).Select(x => x.RecipeID).ToList();
            foreach(int recipeId in recipeIdList)
            {
                DeleteIngredient(recipeId);
            }
            new RecipeSystem().DeleteRecipes(recipeIdList);
        }

        protected void DeleteIngredient(int recipeId)
        {
            List<int> ingredientIdList = new IngredientSystem().GetIngredientByRecipeID(recipeId).Select(x => x.IngredientID).ToList();
            new IngredientSystem().DeleteIngredients(ingredientIdList);
        }

        #region CLICK EVENT
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                string name = DishNameTextBox.Text;
                int typeID = DishTypeDropDownList.SelectedIndex;
                int price = Int32.Parse(DishPriceTextBox.Text);

                // kalo belom ada data di tabel Dish
                if (new DishSystem().GetDishList().LastOrDefault() == null)
                {
                    DishSystem ds = new DishSystem();

                    ds.InsertUpdateDish(new DishData()
                    {
                        DishID = 0,
                        DishTypeID = typeID,
                        DishName = name,
                        DishPrice = price
                    });
                }
                else
                {

                    if (DishIDTextBox.Text == "")
                    {
                        // find biggest id
                        int id = new DishSystem().GetDishList().LastOrDefault().DishID;

                        new DishSystem().InsertUpdateDish(new DishData()
                        {
                            DishID = 0,
                            DishTypeID = typeID,
                            DishName = name,
                            DishPrice = price
                        });
                    }
                    else
                    {
                        new DishSystem().InsertUpdateDish(new DishData()
                        {
                            DishID = Int32.Parse(DishIDTextBox.Text),
                            DishTypeID = typeID,
                            DishName = name,
                            DishPrice = price
                        });
                    }


                }

                BindGridView();

                // ngosongin form biar kaya ke reload
                DishFormPanel.Visible = false;
                DishIDTextBox.Text = "";
                DishNameTextBox.Text = "";
                DishPriceTextBox.Text = "";
                DishTypeDropDownList.SelectedIndex = 0;

                notifDish.Show("Data sukses disimpan", NotificationType.Success);
            }
            catch (Exception ex)
            {
                notifDish.Show($"ERROR SUBMIT DATA: {ex.Message}", NotificationType.Danger);
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {

            DishFormPanel.Visible = true;
            DishNameTextBox.Focus();

            CreateHeader();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                List<DishData> dishList = new DishSystem().GetDishList();
                List<int> list = new List<int>();

                for (int i = 0; i < GridView.Rows.Count; i++)
                {
                    var checkBox = GridView.Rows[i].FindControl("CheckBox") as CheckBox;
                    if (checkBox.Checked)
                    {
                        DeleteRecipe(dishList[i].DishID);
                        list.Add(dishList[i].DishID);
                    }
                }

                if(list.Count == 0)
                {
                    notifDish.Show("NO DATA SELECTED", NotificationType.Danger);
                    CreateHeader();
                    return;
                }

                new DishSystem().DeleteDishes(list);

                BindGridView();

                notifDish.Show("Data sukses dihapus", NotificationType.Success);
            }
            catch (Exception ex)
            {
                notifDish.Show($"ERROR DELETE DATA: {ex.Message}", NotificationType.Danger);
            }
        }

        protected void RecipesButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            string dish_id = GridView.DataKeys[row.RowIndex]["DishID"].ToString();
            Response.Redirect($"~/Recipe.aspx?dish_id={dish_id}");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            DishFormPanel.Visible = true;

            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            DishIDTextBox.Text = GridView.DataKeys[row.RowIndex]["DishID"].ToString();
            DishNameTextBox.Text = row.Cells[2].Text;

            string dishTypeName = row.Cells[3].Text;
            DishTypeData dt = new DishTypeSystem().GetDishTypeByName(dishTypeName);
            DishTypeDropDownList.SelectedIndex = dt.DishTypeID;

            DishPriceTextBox.Text = row.Cells[4].Text;


            CreateHeader();
        }
        #endregion
    }
}