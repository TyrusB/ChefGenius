json.(recipe, :id, :name, :notes, :cook_time, :prep_time, :created_at, :updated_at)

steps ||= nil
needs ||= nil

unless steps.nil?
  json.steps(steps) do |step|
    json.partial!("steps/step", :step => step)
  end
end

unless needs.nil?
  json.needs(needs) do |need|
    json.partial!("needs/need", :need => need)
  end
end

