json.(@user, :email, :user_name, :about_me, :location, :phrase, :location, :age)

unless @user.recipes.nil?
  json.recipes(@user.recipes) do |recipe|
    json.partial!('recipes/recipe', :recipe => recipe)
  end
end

unless @user.annotations.nil?
  json.annotations(@user.annotations) do |annotation|
    json.partial!('annotations/annotation', :annotation => annotation)
    json.recipe_id annotation.recipe.id
    json.recipe_name annotation.recipe.name
  end
end

unless @user.suggestions.nil?
  json.suggestions(@user.suggestions) do |suggestion|
    json.partial!('suggestions/suggestion', :suggestion => suggestion)
    json.recipe_id suggestion.recipe.id
    json.recipe_name suggestion.recipe.name
  end
end