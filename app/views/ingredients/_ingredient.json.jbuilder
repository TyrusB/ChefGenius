json.(ingredient, :id, :description, :created_at)

unless ingredient.annotations.empty?
  json.annotations(ingredient.annotations) do |annotation|
    json.partial!("annotations/annotation", :annotation => annotation)
  end
end