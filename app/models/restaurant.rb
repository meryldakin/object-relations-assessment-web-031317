class Restaurant
  attr_accessor :name

  ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  # class

  def self.all
    ALL
  end

  def self.find_by_name(name)
    all.find do |restaurant|
      restaurant.name
    end
  end

  # instance

  def reviews
    Review.all.find_all do |review|
      review.restaurant == self
    end
  end

  def customers
    reviews_array = Review.all.find_all do |review|
      review.restaurant == self
    end
    customers = reviews_array.map do |review|
      review.customer
    end
    customers

  end

end
