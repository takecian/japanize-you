require 'rails_helper'

RSpec.describe "names/show", :type => :view do
  before(:each) do
    @name = assign(:name, Name.create!(
      :name => "Name",
      :hiragana => "Hiragana",
      :katakana => "Katakana"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Hiragana/)
    expect(rendered).to match(/Katakana/)
  end
end
