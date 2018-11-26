require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    expect(@xml_menu.evaluate_prices(10)).to be true
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    expect(@xml_menu.evaluate_calories(1000)).to eq true
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
  end

  it "should have all waffle dishes stating you get two waffles" do
    expect(@xml_menu.check_waffle_number).to eq true
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
  end
end
