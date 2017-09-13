class Item
  @@list = []

  attr_reader :id
  attr_accessor :name, :rank

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def self.clear()
    @@list = []
  end

  def self.sort()
    @@list.sort_by! {|item| item.rank.to_i }
  end

  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def self.check_dup_name(name)
    candidate = name.downcase
    @@list.each do |item|
      if item.name.downcase == candidate
        return true
      end
    end
    return false
  end

  def self.check_dup_rank(rank)
    candidate = rank.to_i
    @@list.each do |item|
      if item.rank.to_i == candidate
        return true
      end
    end
    return false
  end

  def save()
    @@list.push(self)
  end

end
