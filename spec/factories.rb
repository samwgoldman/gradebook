Factory.define(:evaluation) do |f|
  f.sequence(:name) { |n| "Evaluation #{n}" }
end
