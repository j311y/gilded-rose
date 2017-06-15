require 'gilded_rose'

describe GildedRose do

  context "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "foo"
    end
    it 'updates Conjured Mana Cake quality' do
      number = Random.new
      random_quality = number.rand(2..50)
      random_sell_in = random_quality / 2
      items = [Item.new('Conjured Mana Cake', random_sell_in, random_quality)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'Conjured Mana Cake'
      expect(items[0].quality).to eq(random_quality - 2)
      expect(items[0].sell_in).to eq(random_sell_in - 2)
    end
  end

  # context '#update_sell_in' do
  #   it 'updates the sell in days' do
  #     items = [Item.new('Conjured Mana Cake', 3, 6)]
  #     GildedRose.new(items).update_quality
  #     expect(items[0].sell_in).to eq 2
  #   end
  # end
  # context '#is_conjured?' do
  #   it 'checks if an item is conjured' do
  #     conjured = [Item.new('Conjured thing', 3, 6)]
  #     item = GildedRose.new(conjured).update_quality
  #     expect(item.is_conjured?).to be(true)
  #   end
  # end
end
