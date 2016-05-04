require_relative './item'

class GildedRose
  LEGENDARY_ITEM = 'Sulfuras, Hand of Ragnaros'

  RARE_ITEMS = {
    aged_brie: 'Aged Brie',
    backstage: 'Backstage passes to a TAFKAL80ETC concert',
    conjured: 'Conjured, Hand of God'
  }

  def initialize(items)
    @items = items
  end


  def update_quality
    @items.each do |item|
      next if item.name == LEGENDARY_ITEM

      item.quality += addend(item)
      item.sell_in -= 1

      fix_item(item)
    end
  end

private

  def addend(item)
    RARE_ITEMS.values.include?(item.name) ? rare(item) : common(item)
  end

  def fix_item(item)
    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.quality < 0
  end

  def common(item)
    item.sell_in <= 0 ? -2 : -1
  end

  def rare(item)
    return aged_brie.call(item) if RARE_ITEMS[:aged_brie] == item.name
    return backstage.call(item) if RARE_ITEMS[:backstage] == item.name
    return -2                   if RARE_ITEMS[:conjured] == item.name
  end

  # Rare items addends
  #
  def aged_brie
    lambda { |item| item.sell_in <= 0 ? 2 : 1 }
  end

  def backstage
    lambda do |item|
     return 1 if item.sell_in > 10
     return 2 if item.sell_in >= 6
     return 3 if item.sell_in >= 1

     -(item.quality)
   end
  end

end

