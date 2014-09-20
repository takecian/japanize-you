require 'rails_helper'

RSpec.describe "names/edit", :type => :view do
  before(:each) do
    @name = assign(:name, Name.create!(
      :name => "MyString",
      :hiragana => "MyString",
      :katakana => "MyString"
    ))
  end

  it "renders the edit name form" do
    render

    assert_select "form[action=?][method=?]", name_path(@name), "post" do

      assert_select "input#name_name[name=?]", "name[name]"

      assert_select "input#name_hiragana[name=?]", "name[hiragana]"

      assert_select "input#name_katakana[name=?]", "name[katakana]"
    end
  end
end
