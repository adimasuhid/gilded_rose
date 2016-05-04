require 'spec_helper'

describe GildedRose do

  describe "#update_quality" do
    let(:common)    { Item.new('Common Item', 10, 20) }
    let(:aged_brie) { Item.new('Aged Brie', 20, 20) }
    let(:backstage) { Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 20) }
    let(:conjured)  { Item.new('Conjured, Hand of God', 20, 20) }
    let(:sulfuras)  { Item.new('Sulfuras, Hand of Ragnaros', 0, 80) }


    let(:gilded_rose) do
      items = [common, aged_brie, backstage, conjured, sulfuras] 
      GildedRose.new items
    end

    it 'all items except Sulfuras decreases sell_in date by 1' do
      gilded_rose.update_quality

      expect(common.sell_in).to eq 9
    end

    context 'Common Item' do
      it 'quality of an item is never negative' do
        common.quality = 0
        common.sell_in = 0

        gilded_rose.update_quality
        expect(common.quality).to eq 0
      end

      it 'quality of an item is never more than 50' do
        aged_brie.quality = 50
        aged_brie.sell_in = 0
        backstage.quality = 50
        backstage.sell_in = 3

        gilded_rose.update_quality
        expect(aged_brie.quality).to eq 50
        expect(backstage.quality).to eq 50
      end

      it 'degrades consistently by 1' do
        gilded_rose.update_quality

        expect(common.quality).to eq 19
      end

      it 'degrades twice once sell_in date is less than or equal to 0' do
        common.sell_in = 0

        gilded_rose.update_quality
        expect(common.quality).to eq 18
      end
    end

    context 'Aged Brie' do
      it 'increases in quality by 1 as it gets older' do
        aged_brie.sell_in = 1
        gilded_rose.update_quality
        
        expect(aged_brie.quality).to eq 21
      end

      it 'increases twice on quality if the sell in is less than or equal to 0' do
        aged_brie.sell_in = 0
        gilded_rose.update_quality

        expect(aged_brie.quality).to eq 22
      end
    end

    context 'Backstage passes to a TAFKAL80ETC concert' do
      it 'increases quality by 1 when sell_in is greater than 10' do
        gilded_rose.update_quality
        
        expect(backstage.quality).to eq 21
      end

      it 'increases quality by 2 when sell_in >= 6 AND <= 10' do
        backstage.sell_in = 6
        gilded_rose.update_quality

        expect(backstage.quality).to eq 22
      end

      it 'increases quality by 3 when sell_in >= 1 AND <= 5' do
        backstage.sell_in = 5
        gilded_rose.update_quality

        expect(backstage.quality).to eq 23
      end

      it 'drops quality into 0 when sell_in reaches 0 or less' do
        backstage.sell_in = 0
        gilded_rose.update_quality
        
        expect(backstage.quality).to eq 0
      end
    end

    context 'Sulfuras, Hand of Ragnaros' do
      it 'is a god(never sells)' do
        gilded_rose.update_quality
        
        expect(sulfuras.quality).to eq 80
        expect(sulfuras.sell_in).to eq 0
      end
    end

    context 'Conjured, Hand of God' do
      it 'degrades twice as any item' do
        gilded_rose.update_quality
        
        expect(conjured.quality).to eq 18
      end
    end

  end

end