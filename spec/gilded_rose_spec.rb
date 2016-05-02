require 'spec_helper'

describe GildedRose do

  describe "#update_quality" do
    it 'any item other than Hand of Ragnaros decreases sell_in date by 1' do
      item = Item.new 'Common shit item', 10, 20

      gilded_rose = GildedRose.new([item])
      gilded_rose.update_quality
      expect(item.sell_in).to eq 9
    end

    context 'Common Item' do
      it 'quality of an item is never negative' do
        item = Item.new 'Common shit item', 0, 0

        gilded_rose = GildedRose.new([item])
        gilded_rose.update_quality
        expect(item.quality).to eq 0
      end

      it 'quality of an item is never more than 50' do
        agedbrie = Item.new 'Aged Brie', 0, 50
        backstage = Item.new 'Backstage passes to a TAFKAL80ETC concert', 3, 50

        gilded_rose = GildedRose.new([agedbrie, backstage])
        gilded_rose.update_quality
        expect(agedbrie.quality).to eq 50
        expect(backstage.quality).to eq 50
      end

      it 'degrades consistently by 1' do
        item = Item.new 'Common shit item', 5, 20

        gilded_rose = GildedRose.new([item])
        gilded_rose.update_quality
        expect(item.quality).to eq 19
      end

      it 'degrades twice once sell_in date is <= 0' do
        item = Item.new 'Common shit item', 0, 20

        gilded_rose = GildedRose.new([item])
        gilded_rose.update_quality
        expect(item.quality).to eq 18
      end
    end

    context 'Aged Brie' do
      it 'increases in quality as it gets older' do
        item = Item.new 'Aged Brie', 1, 20

        gilded_rose = GildedRose.new([item])
        gilded_rose.update_quality
        expect(item.quality).to eq 21
      end

      it 'increases twice on quality if the sell in is <= 0' do
        item = Item.new 'Aged Brie', 0, 20

        gilded_rose = GildedRose.new([item])
        gilded_rose.update_quality
        expect(item.quality).to eq 22
      end
    end

    context 'Backstage passes to a TAFKAL80ETC concert' do
      it 'increases quality by 1 when sell_in is >= 10' do
        item = Item.new 'Backstage passes to a TAFKAL80ETC concert', 12, 20

        gilded_rose = GildedRose.new([item])
        gilded_rose.update_quality
        expect(item.quality).to eq 21
      end

      it 'increases quality by 2 when sell_in >= 6 AND <= 10' do
        item_1 = Item.new 'Backstage passes to a TAFKAL80ETC concert', 10, 20
        item_2 = Item.new 'Backstage passes to a TAFKAL80ETC concert', 6, 20

        gilded_rose = GildedRose.new([item_1, item_2])
        gilded_rose.update_quality
        expect(item_1.quality).to eq 22
        expect(item_2.quality).to eq 22
      end

      it 'increases quality by 3 when sell_in >= 1 AND <= 5' do
        item_1 = Item.new 'Backstage passes to a TAFKAL80ETC concert', 5, 20
        item_2 = Item.new 'Backstage passes to a TAFKAL80ETC concert', 1, 20

        gilded_rose = GildedRose.new([item_1, item_2])
        gilded_rose.update_quality
        expect(item_1.quality).to eq 23
        expect(item_2.quality).to eq 23
      end

      it 'drops quality into 0 when sell_in reaches 0 or less' do
        item = Item.new 'Backstage passes to a TAFKAL80ETC concert', 0, 20

        gilded_rose = GildedRose.new([item])
        gilded_rose.update_quality
        expect(item.quality).to eq 0
      end
    end

    context 'Sulfuras, Hand of Ragnaros' do
      it 'is a god(never sells)' do
        item_1 = Item.new 'Sulfuras, Hand of Ragnaros', 0, 80
        item_2 = Item.new 'Sulfuras, Hand of Ragnaros', 10, 80
        gilded_rose = GildedRose.new([item_1, item_2])
        gilded_rose.update_quality
        expect(item_1.quality).to eq 80
        expect(item_1.sell_in).to eq 0

        expect(item_2.quality).to eq 80
        expect(item_2.sell_in).to eq 10
      end
    end

    context 'Conjured, Hand of God' do
      it 'degrades twice as any item' do
        item = Item.new 'Conjured, Hand of God', 20, 50

        gilded_rose = GildedRose.new([item])
        gilded_rose.update_quality
        expect(item.quality).to eq 48
      end
    end

  end

end