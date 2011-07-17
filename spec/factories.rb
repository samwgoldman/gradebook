Factory.define(:evaluation) do |f|
  f.sequence(:name) { |n| "Evaluation #{n}" }
end

Factory.define(:criterion) do |f|
  f.sequence(:prompt) { |n| "Criterion #{n}" }
end
