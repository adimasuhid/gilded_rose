require 'spec_helper'

describe GildedRose do
  let!(:sulfuras) { Item.new("Sulfuras", 10, 10)  }

  describe "#update_quality" do
    context "Normal Item" do
      it "decrement by 1 when Sell in value approaches" do
      end
    end

    context "Sulfuras" do
      it "does not to be sold or decreases in quality" do
        gilded_rose = GildedRose.new([sulfuras])
        gilded_rose.update_quality

        expect(item.quality).to eq 10
      end
    end

    context "Aged Brie" do
      it "does increase in quality the older it gets" do
        expect(false).to eq true
      end
    end

    context "Backstage Passes" do
      it "increases in quality as it's Sell in value approaches" do
        expect(false).to eq true
      end

      it "quality increases by 2 when Sell in date is 10 or lesser" do
        expect(false).to eq true
      end

      it "quality increases by 3 when Sell in date is 5 or lesser" do
        expect(false).to eq true
      end

      it "quality drops to 0 when Sell in is negative" do
        expect(false).to eq true
      end
    end

    context "Conjured Items" do
      it "degrades in quality as twice as fast as normal items" do
        expect(false).to eq true
      end
    end
  end
end