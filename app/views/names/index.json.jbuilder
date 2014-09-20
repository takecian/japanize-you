json.array!(@names) do |name|
  json.extract! name, :id, :name, :hiragana, :katakana
  json.url name_url(name, format: :json)
end
