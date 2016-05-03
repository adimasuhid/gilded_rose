require 'spec_helper'

describe GildedRose do
  describe "#update_quality" do
    context "Normal Item" do
      it "decrement by 1 when Selln value approaches" do

      end
    end

    context "Sulfuras" do
      it "does not to be sold or decreases in quality" do
        expect(false).to eq true
      end
    end

    context "Aged Brie" do
      it "does increase in quality the older it gets" do
        expect(false).to eq true
      end
    end

    context "Backstage Passes" do
      it "increases in quality as it's Selln value approaches" do
        expect(false).to eq true
      end

      it "quality increases by 2 when Selln date is 10 or lesser" do
        expect(false).to eq true
      end

      it "quality increases by 3 when Selln date is 5 or lesser" do
        expect(false).to eq true
      end

      it "quality drops to 0 when Selln is negative" do
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