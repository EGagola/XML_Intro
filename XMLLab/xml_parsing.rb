require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def evaluate_prices max_price
    prices_string = @menu.search('price').inner_html
    prices_array = prices_string.split('£')
    correctly_priced_items = 0
    prices_array.each do |price|
      if price.to_i <= max_price
        correctly_priced_items += 1
      end
    end
    if correctly_priced_items == prices_array.length
      true
    end
  end

  def evaluate_calories max_calories
    calories_array = @menu.xpath('//calories')
    names_array = @menu.search('name')
    non_full_english_dishes = 0
    low_calorie_dishes = 0
    text_val_array = []
    calories_array.each do |value|
      text_val_array << value.text.to_i
    end
    for i in 0 ... text_val_array.length do
      if names_array[i].text == "Full Breakfast"
      else
        non_full_english_dishes += 1
        if text_val_array[i] <= max_calories
          low_calorie_dishes += 1
        end
      end
    end
    if low_calorie_dishes == non_full_english_dishes
      true
    end
  end

  def check_waffle_number
    description = @menu.xpath('/breakfast_menu/food/description')
    waffle_dish_count = 0
    correct_description = 0
    description.each do |desc|
      if desc.text.upcase.include? "WAFFLES" or desc.text.include? "2"
        waffle_dish_count += 1
      end
      if desc.text.upcase.include? "TWO" and desc.text.upcase.include? "WAFFLES"
        correct_description += 1
      end
    end
    if waffle_dish_count == correct_description
      true
    end
  end
end
