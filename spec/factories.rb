Factory.define(:evaluation) do |f|
  f.sequence(:name) { |n| "Evaluation #{n}" }
end

Factory.define(:criterion) do |f|
  f.sequence(:prompt) { |n| "Criterion #{n}" }
end

Factory.define(:alternative) do |f|
  f.sequence(:label) { |n| "Alternative #{n}" }
end

Factory.define(:user) do |f|
  f.sequence(:email) { |n| "test#{n}@example.com" }
end
