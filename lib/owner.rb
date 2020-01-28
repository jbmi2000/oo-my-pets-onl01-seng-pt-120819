require 'pry'
class Owner
  attr_reader :species, :name

  @@all = []

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
    @pets = {:dogs => [], :cats => []}

  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    @pets [:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets [:dogs] << Dog.new(name)
  end

  def self.dogs
    @@dogs

  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

# binding.pry


end
