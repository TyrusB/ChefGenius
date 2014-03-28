json.(recipe, :id, :name, :created_at, :author_id)

if recipe.title_photo
  json.photo do
    json.url recipe.title_photo.url
  end
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

