require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('xml_menu.xml'))
  end

  def get_menu_names
    @menu.search('name')
  end

  def get_food_items
    @menu.search('food')
  end

  def get_xpath_calories
    @menu.xpath('/breakfast_menu/food/calories')
  end

  def get_xpath_names
    @menu.xpath('//name') # Double // allows you to not put the full path
  end
end

guiseppes = GuiseppesMenu.new

# Different ways of accessing data

# puts guiseppes.get_menu_names   # Standard function
# puts guiseppes.get_menu_names.last   # Works with ruby methods
# puts guiseppes.get_menu_names[3]  # Works like an array
# puts guiseppes.get_menu_names.length
# puts guiseppes.get_menu_names.last.text # Gets rid of tags
# puts guiseppes.get_menu_names.last.inner_html # Works like text
# puts guiseppes.get_xpath_calories
puts guiseppes.get_xpath_names
