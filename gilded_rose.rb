class GildedRose
  #Accepts array of items
  def initialize(items)
    @items = items
  end

  #Loops through each item in the array of items
  def update_quality
    @items.each do |item|
      case item.name
        when "Sulfuras" then
          item.quality
        when "Aged Brie" then
        when "Conjured" then
        when "Backstage passes" then
        else
          # TODO
          # Normal Item
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  #Would result to: name, 10, 10
  #Whereas name is a string, sell_in is an int, quality is an int
  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

#Initializes new item
#novice_item = Item.new("Normal Item", 10, 10)
#aged_brie = Item.new("Aged Brie", 10, 10)
#sulfuras = Item.new("Sulfuras", 10, 10)
#conjured = Item.new("Conjured", 10, 10)
#backstage_passes = Item.new("Backstage passes", 10, 10)

#Passes array of items to GildedRose as params
#gilded_rose = GildedRose.new([sulfuras])
#puts gilded_rose.update_quality()
