require 'spec_helper'

describe Item do
  describe "#initialize" do
    it "is an Item" do
      new_item = Item.new("item_name","item_sell_in","item_quality")
      expect(new_item).to be_an_instance_of Item
    end
  end

  describe "#to_s" do
    it "returns readable name sell_in and quality" do
      new_item = Item.new("item_name","item_sell_in","item_quality")
      expect(new_item.to_s).to eq("item_name, item_sell_in, item_quality")
    end
  end

  describe "item behaviours" do
    context "sell date has passed" do
      it "quality degrades twice as fast" do
        expect(false).to eq true
      end
    end

    describe "quality of an item" do
      it "quality is never negative" do
        expect(false).to eq true
      end

      it "quality is never more than 50" do
        expect(false).to eq true
      end
    end
  end
end