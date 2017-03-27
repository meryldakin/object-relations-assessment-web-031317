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
