﻿using Common.Data;
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
    public class RecipeDB
    {
        public List<RecipeData> GetRecipeList()
        {
            try
            {
                string SpName = "dbo.Recipe_Get";
                List<RecipeData> ListRecipe = new List<RecipeData>();
                using (SqlConnection SqlConn = new SqlConnection())
                {
                    SqlConn.ConnectionString = SystemConfigurations.EateryConnectionString;
                    SqlConn.Open();
                    SqlCommand SqlCmd = new SqlCommand(SpName, SqlConn);
                    SqlCmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader Reader = SqlCmd.ExecuteReader())
                    {
                        if (Reader.HasRows)
                        {
                            while (Reader.Read())
                            {
                                RecipeData recipe = new RecipeData();
                                recipe.RecipeID = Convert.ToInt32(Reader["RecipeID"]);
                                recipe.DishID = Convert.ToInt32(Reader["DishID"]);
                                recipe.RecipeName = Convert.ToString(Reader["RecipeName"]);
                                recipe.RecipeDescription = Convert.ToString(Reader["RecipeDescription"]);
                                ListRecipe.Add(recipe);
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

        public List<RecipeData> GetRecipeByDishID(int dishID)
        {
            try
            {
                string SpName = "dbo.Recipe_GetByDishID";
                List<RecipeData> ListRecipe = new List<RecipeData>();
                using (SqlConnection SqlConn = new SqlConnection())
                {
                    SqlConn.ConnectionString = SystemConfigurations.EateryConnectionString;
                    SqlConn.Open();
                    SqlCommand SqlCmd = new SqlCommand(SpName, SqlConn);
                    SqlCmd.CommandType = CommandType.StoredProcedure;
                    SqlCmd.Parameters.Add(new SqlParameter("@DishID", dishID));
                    using (SqlDataReader Reader = SqlCmd.ExecuteReader())
                    {
                        if (Reader.HasRows)
                        {
                            while (Reader.Read())
                            {
                                RecipeData recipe = new RecipeData();
                                recipe.RecipeID = Convert.ToInt32(Reader["RecipeID"]);
                                recipe.DishID = Convert.ToInt32(Reader["DishID"]);
                                recipe.RecipeName = Convert.ToString(Reader["RecipeName"]);
                                recipe.RecipeDescription = Convert.ToString(Reader["RecipeDescription"]);
                                ListRecipe.Add(recipe);
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

        public RecipeData GetRecipeByID(int recipeID)
        {
            try
            {
                string SpName = "dbo.Recipe_GetByID";
                RecipeData recipe = null;
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
                            Reader.Read();
                            recipe = new RecipeData();
                            recipe.RecipeID = Convert.ToInt32(Reader["RecipeID"]);
                            recipe.DishID = Convert.ToInt32(Reader["DishID"]);
                            recipe.RecipeName = Convert.ToString(Reader["RecipeName"]);
                            recipe.RecipeDescription = Convert.ToString(Reader["RecipeDescription"]);
                        }
                    }
                    SqlConn.Close();
                }
                return recipe;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int DeleteRecipes(string recipeIDs, SqlTransaction SqlTran)
        {
            try
            {
                string SpName = "dbo.Recipe_Delete";
                SqlCommand SqlCmd = new SqlCommand(SpName, SqlTran.Connection, SqlTran);
                SqlCmd.CommandType = CommandType.StoredProcedure;
                SqlCmd.Parameters.Add(new SqlParameter("@RecipeIDs", recipeIDs));
                return SqlCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int InsertUpdateRecipe(RecipeData recipe, SqlTransaction SqlTran)
        {
            try
            {
                string SpName = "dbo.Recipe_InsertUpdate";
                SqlCommand SqlCmd = new SqlCommand(SpName, SqlTran.Connection, SqlTran);
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlCmd.Parameters.Add(new SqlParameter("@RecipeID", recipe.RecipeID));
                SqlCmd.Parameters.Add(new SqlParameter("@DishID", recipe.DishID));
                SqlCmd.Parameters.Add(new SqlParameter("@RecipeName", recipe.RecipeName));
                SqlCmd.Parameters.Add(new SqlParameter("@RecipeDescription", recipe.RecipeDescription));
                return SqlCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
