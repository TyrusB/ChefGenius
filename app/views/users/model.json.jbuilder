json.(@user, :email, :user_name, :about_me, :location, :phrase, :location, :age)

unless @user.recipes.nil?
  json.recipes(@user.recipes) do |recipe|
    json.partial!('recipes/recipe', :recipe => recipe)
  end
end

unless @user.annotations.nil?
  json.annotations(@user.annotations) do |annotation|
    json.partial!('annotations/annotation', :annotation => annotation)
  end
end

unless @user.suggestions.nil?
  json.suggestions(@user.suggestions) do |suggestion|
    json.partial!('suggestions/suggestion', :suggestion => suggestion)
  end
end