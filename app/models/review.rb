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
