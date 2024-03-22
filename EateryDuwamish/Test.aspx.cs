using BusinessFacade;
using Common.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EateryDuwamish
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<DishData> DishList = new DishSystem().GetDishList();
                GridView1.DataSource = DishList;
                GridView1.DataBind();

                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void RecipesButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            Response.Redirect("~/Recipes.aspx?dish_id=" + GridView1.DataKeys[row.RowIndex]["DishID"].ToString() + "&recipe_id=-1");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            //postAddDiv.Visible = true;

            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            //DishIDTextBox.Text = GridView.DataKeys[row.RowIndex]["DishID"].ToString();
            //DishNameTextBox.Text = row.Cells[2].Text;

            string dishTypeName = row.Cells[3].Text;
            DishTypeData dt = new DishTypeSystem().GetDishTypeByName(dishTypeName);
            //DishTypeDropDownList.SelectedIndex = dt.DishTypeID - 1;

            //DishPriceTextBox.Text = row.Cells[4].Text;
        }
    }
}