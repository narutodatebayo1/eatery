using Common.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SystemFramework;

namespace DataAccess
{
    public class IngredientDB
    {
        public List<IngredientData> GetIngredientByRecipeID(int recipeID)
        {
            try
            {
                string SpName = "dbo.Ingredient_GetByRecipeID";
                List<IngredientData> ListRecipe = new List<IngredientData>();
                using (SqlConnection SqlConn = new SqlConnection())
                {
                    SqlConn.ConnectionString = SystemConfigurations.EateryConnectionString;
                    SqlConn.Open();
                    SqlCommand SqlCmd = new SqlCommand(SpName, SqlConn);
                    SqlCmd.CommandType = CommandType.StoredProcedure;
                    SqlCmd.Parameters.Add(new SqlParameter("@RecipeID", recipeID));
                    using (SqlDataReader Reader = SqlCmd.ExecuteReader())
                    {
                        if (Reader.HasRows)
                        {
                            while (Reader.Read())
                            {
                                IngredientData ingredient = new IngredientData();
                                ingredient.IngredientID = Convert.ToInt32(Reader["IngredientID"]);
                                ingredient.RecipeID = Convert.ToInt32(Reader["RecipeID"]);
                                ingredient.IngredientName = Convert.ToString(Reader["IngredientName"]);
                                ingredient.IngredientQuantity = Convert.ToInt32(Reader["IngredientQuantity"]);
                                ingredient.IngredientUnit = Convert.ToString(Reader["IngredientUnit"]);
                                ListRecipe.Add(ingredient);
                            }
                        }
                    }
                    SqlConn.Close();
                }
                return ListRecipe;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int DeleteIngredients(string ingredientIDs, SqlTransaction SqlTran)
        {
            try
            {
                string SpName = "dbo.Ingredient_Delete";
                SqlCommand SqlCmd = new SqlCommand(SpName, SqlTran.Connection, SqlTran);
                SqlCmd.CommandType = CommandType.StoredProcedure;
                SqlCmd.Parameters.Add(new SqlParameter("@IngredientIDs", ingredientIDs));
                return SqlCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int InsertUpdateIngredient(IngredientData ingredient, SqlTransaction SqlTran)
        {
            try
            {
                string SpName = "dbo.Ingredient_InsertUpdate";
                SqlCommand SqlCmd = new SqlCommand(SpName, SqlTran.Connection, SqlTran);
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlCmd.Parameters.Add(new SqlParameter("@IngredientID", ingredient.IngredientID));
                SqlCmd.Parameters.Add(new SqlParameter("@RecipeID", ingredient.RecipeID));
                SqlCmd.Parameters.Add(new SqlParameter("@IngredientName", ingredient.IngredientName));
                SqlCmd.Parameters.Add(new SqlParameter("@IngredientQuantity", ingredient.IngredientQuantity));
                SqlCmd.Parameters.Add(new SqlParameter("@IngredientUnit", ingredient.IngredientUnit));
                return SqlCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
