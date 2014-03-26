json.(note, :id, :description)

unless note.annotations.empty?
  json.annotations(note.annotations) do |annotation|
    json.partial!("annotations/annotation", :annotation => annotation)
  end
end