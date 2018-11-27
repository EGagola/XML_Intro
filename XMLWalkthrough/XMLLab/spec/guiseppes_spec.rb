describe "Guiseppes Menu" do

  before(:all) do
    @menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    @menu.get_all_prices_as_floats.each do |price|
      expect(price).to be <= 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @menu.get_all_food_items.each do |food|
      if food.element_children[0].text == "Full Breakfast"
        expect(food.element_children[3].text.to_i).to be > 1000
      else
        expect(food.element_children[3].text.to_i).to be <= 1000
      end
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @menu.get_all_food_items.each do |food|
      if food.element_children[0].text.downcase.include? 'waffles'
        expect(food.element_children[2].text.downcase).to include 'two'
      end
    end
  end
end
