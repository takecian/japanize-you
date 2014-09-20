require 'rails_helper'

RSpec.describe "names/new", :type => :view do
  before(:each) do
    assign(:name, Name.new(
      :name => "MyString",
      :hiragana => "MyString",
      :katakana => "MyString"
    ))
  end

  it "renders new name form" do
    render

    assert_select "form[action=?][method=?]", names_path, "post" do

      assert_select "input#name_name[name=?]", "name[name]"

      assert_select "input#name_hiragana[name=?]", "name[hiragana]"

      assert_select "input#name_katakana[name=?]", "name[katakana]"
    end
  end
end
