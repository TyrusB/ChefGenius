json.(@user, :email, :user_name, :about_me, :location, :phrase, :location, :age)

unless @user.recipes.nil?
  @user.recipes.each do |recipe|
    render json.partial('recipes/recipe', :recipe => recipe)
  end
end

unless @user.annotations.nil?
  @user.annotations.each do |annotation|
    render json.partial('annotations/annotation', :annotation => annotation)
  end
end

unless @user.suggestions.nil?
  @user.suggestions.each do |suggestion|
    render json.partial('suggestions/suggestion', :suggestion => suggestion)
  end
end