using Common.Data;
using System;
using BusinessFacade;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Data.SqlClient;
using System.Drawing;

namespace EateryDuwamish
{
    public partial class Home : System.Web.UI.Page
    {
        private static int selectedId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> DishTypeNameList = new DishTypeSystem().GetDishTypeList().Select(x => x.DishTypeName).ToList(); ;
                DishTypeDropDownList.DataSource = DishTypeNameList;
                DishTypeDropDownList.DataBind();

                BindGrid();
            }
        }

        protected void BindGrid()
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
        }

        #region FORM EVENT
        protected void AddButton_Click(object sender, EventArgs e)
        {
            postAddDiv.Visible = true;
        }
        

        
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            List<DishData> dishList = new DishSystem().GetDishList();
            List<int> list = new List<int>();

            for (int i=0; i<GridView.Rows.Count; i++)
            {
                var checkBox = GridView.Rows[i].FindControl("CheckBox") as CheckBox;
                if (checkBox.Checked)
                {
                    list.Add(dishList[i].DishID);
                }
            }
            new DishSystem().DeleteDishes(list);

            BindGrid();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Label1.Text = selectedId.ToString();

            string name = DishNameTextBox.Text;
            int typeID = DishTypeDropDownList.SelectedIndex + 1;
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

                Label1.Text = "p";
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

            BindGrid();

            // ngosongin form biar kaya ke reload
            postAddDiv.Visible = false;
            DishNameTextBox.Text = "";
            DishPriceTextBox.Text = "";
            DishTypeDropDownList.SelectedIndex = 0;
        }
        #endregion



        protected void RecipesButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            Response.Redirect("~/Recipes.aspx?dish_id=" + GridView.DataKeys[row.RowIndex]["DishID"].ToString() + "&recipe_id=-1");

        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            postAddDiv.Visible = true;

            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            DishIDTextBox.Text = GridView.DataKeys[row.RowIndex]["DishID"].ToString();
            DishNameTextBox.Text = row.Cells[2].Text;

            string dishTypeName = row.Cells[3].Text;
            DishTypeData dt = new DishTypeSystem().GetDishTypeByName(dishTypeName);
            DishTypeDropDownList.SelectedIndex = dt.DishTypeID - 1;

            DishPriceTextBox.Text = row.Cells[4].Text;

        }

        
    }
}