json.partial!("annotations/annotation", :annotation => @annotation)

unless @suggestions.nil?
  json.suggestions(@suggestions) do |suggestion|
    json.partial!("suggestions/suggestion", :suggestion => suggestion)
  end
end