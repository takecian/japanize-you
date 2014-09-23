# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def katakana_to_hiragana katakana
  katakana.gsub!(/ヴァ|ヴィ|ヴェ|ヴォ|ヴ/, "ヴァ" => "バ", "ヴィ" => "ビ", "ヴ" => "ブ", "ヴェ" => "ベ", "ヴォ" => "ボ")
  katakana.tr('ァ-ン','ぁ-ん')
end

%w(https://www.kimonolabs.com/api/5ikszv5s?apikey=jCdRkRK3EYSQylkriV3zcQyIFbrCvE2s https://www.kimonolabs.com/api/8ir1cw98?apikey=jCdRkRK3EYSQylkriV3zcQyIFbrCvE2s https://www.kimonolabs.com/api/d9gam596?apikey=jCdRkRK3EYSQylkriV3zcQyIFbrCvE2s).each do |url|
  p url
  response = RestClient.get url
  json = JSON.parse response, { symbolize_names: true }
  names = json[:results][:collection1]
  names.each do |name|
    name[:katakana].gsub!(/（.*）/, '')

    p name[:english] + ', ' + name[:katakana] + ', ' + katakana_to_hiragana(name[:katakana])

    Name.create(name: name[:english], katakana: name[:katakana], hiragana: katakana_to_hiragana(name[:katakana]))
  end
end

#response = RestClient.get 'https://www.kimonolabs.com/api/5ikszv5s?apikey=jCdRkRK3EYSQylkriV3zcQyIFbrCvE2s'
#
#response = RestClient.get 'https://www.kimonolabs.com/api/8ir1cw98?apikey=jCdRkRK3EYSQylkriV3zcQyIFbrCvE2s'
