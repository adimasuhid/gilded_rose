require_relative './item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'
      item.sell_in = item.sell_in - 1
    end

  end
end
