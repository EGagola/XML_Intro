require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('xml_menu.xml'))
  end

  def get_all_prices_as_floats
    prices_array = []
    @menu.xpath('//price').each do |price|
      prices_array << price.text.gsub('£','').to_f
    end
    prices_array
  end

  def get_all_food_items
    @menu.search('food')
  end
end
