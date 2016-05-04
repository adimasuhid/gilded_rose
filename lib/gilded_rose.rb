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


  def update_quality()
    @items.each do |item|
      next if item.name == LEGENDARY_ITEM

      item.quality += addends(item)
      item.quality = 50 if item.quality > 50
      item.quality = 0 if item.quality < 0
      item.sell_in -= 1
    end
  end

private

  def addends(item)
    RARE_ITEMS.values.include?(item.name) ? rare(item) : common(item)
  end

  def common(item)
    item.sell_in <= 0 ? -2 : -1
  end

  def rare(item)
    if item.name == RARE_ITEMS[:aged_brie] 
      aged_brie(item)
    elsif item.name == RARE_ITEMS[:backstage]
      backstage(item)
    elsif item.name == RARE_ITEMS[:conjured]
      -2
    end
  end

  def aged_brie(item)
    item.sell_in <= 0 ? 2 : 1
  end

  def backstage(item)
    n = 1

    if item.sell_in > 10
      1
    elsif item.sell_in >= 6 && item.sell_in <= 10
      2
    elsif item.sell_in <= 5 && item.sell_in >= 1
      3
    else
      -(item.quality)
    end
  end

end

