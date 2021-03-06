json.(recipe, :id, :name, :category, :created_at)

json.authorId recipe.author.id
json.authorEmail recipe.author.email
json.numAnnotations recipe.annotation_count

if recipe.title_photo
  json.photo recipe.title_photo
end

steps ||= nil
ingredients ||= nil
info ||= nil
note ||= nil

unless ingredients.nil?
  json.ingredients(ingredients) do |ingredient|
    json.partial!("ingredients/ingredient", :ingredient => ingredient)
  end
end

unless steps.nil?
  json.steps(steps) do |step|
    json.partial!("steps/step", :step => step)
  end
end

unless info.nil?
  json.info do
    json.partial!("infos/info", :info => info)
  end
end

unless note.nil?
  json.note do
    json.partial!("notes/note", :note => note)
  end
end

