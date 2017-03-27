class Customer
  # accessors, constants, initialize
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    ALL << self
  end

  # class methods

  def self.all
    ALL
  end

  def self.find_by_name(name)
    first_name = name.split[0]
    last_name = name.split[1]

    all.find do |customer|
      customer.first_name.downcase == first_name.downcase && customer.last_name.downcase == last_name.downcase
    end

  end

  def self.find_all_by_first_name(first_name)
    all.find_all do |customer|
      customer.first_name.downcase == first_name
    end
  end

  def self.all_names
    all.collect  do |customer|
      customer.first_name + " " + customer.last_name
    end
  end


  # instance methods


  def full_name
    "#{first_name} #{last_name}"
  end

  def add_review(restaurant, content)
    Review.new(restaurant, self, content)
  end
end


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

class Review

  #attr, constants, initialize
  attr_accessor :r_restaurant, :r_customer

  ALL = []

  def initialize(r_restaurant, r_customer, content)
    @r_restaurant = r_restaurant
    @r_customer = r_customer
    ALL << self

  end

  # class
  def self.all
    ALL
  end

  # instance

  def customer
    self.r_customer
  end

  def restaurant
    self.r_restaurant
  end


end
