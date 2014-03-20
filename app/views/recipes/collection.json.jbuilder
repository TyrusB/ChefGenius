json.array!(@recipes) do |recipe|
  json.partial!("recipes/recipe", :recipe => recipe)
end