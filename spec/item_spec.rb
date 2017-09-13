require('item')

RSpec.describe("Item") do
  before() do
   Item.clear()
  end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos")
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      item = Item.new("tacos")
      item.save()
      expect(Item.all()).to(eq([item]))
    end
  end
  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      item = Item.new("tacos")
      item.save()
      item2 = Item.new("pizza")
      item2.save()
      expect(item.id()).to eq(1)
      expect(item2.id()).to eq(2)
    end
  end
end
