require_relative './item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'
      item.sell_in = item.sell_in - 1
      if item.quality > 0
        n = item.sell_in <= 0 ? 2 : 1
        item.quality = item.quality - n  
      end
    end

  end
end
