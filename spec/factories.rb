Factory.define(:evaluation) do |f|
  f.sequence(:name) { |n| "Evaluation #{n}" }
end

Factory.define(:criterion) do |f|
  f.association(:evaluation)
  f.sequence(:prompt) { |n| "Criterion #{n}" }
  f.sequence(:position)
end

Factory.define(:alternative) do |f|
  f.association(:criterion)
  f.sequence(:label) { |n| "Alternative #{n}" }
  f.sequence(:position)
end

Factory.define(:user) do |f|
  f.sequence(:email) { |n| "test#{n}@example.com" }
end
