json.(step, :id, :description, :created_at)

unless step.annotations.empty?
  json.annotations(step.annotations) do |annotation|
    json.partial!("annotations/annotation", :annotation => annotation)
  end
end