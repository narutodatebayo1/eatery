using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EateryDuwamish
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        string dish_id;
        string recipe_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsolutePath;
            if (url.Contains("Home.aspx"))
            {
                Symbol1.Visible = false;
                Recipe.Visible = false;
                Symbol2.Visible = false;
                Ingredient.Visible = false;
            }
            else if (url.Contains("Recipes.aspx"))
            {
                Session["dish_id"] = Request.QueryString["dish_id"];
                Symbol2.Visible = false;
                Ingredient.Visible = false;
            }
            else if (url.Contains("Ingredient.aspx"))
            {
                Session["recipe_id"] = Request.QueryString["recipe_id"];
            }
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void Recipe_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Recipes.aspx?dish_id=" + Session["dish_id"] + "&recipe_id=-1");

        }

        protected void Ingredient_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Ingredient.aspx?dish_id=" + Session["dish_id"] + "&recipe_id=" + Session["recipe_id"]);

        }
    }
}