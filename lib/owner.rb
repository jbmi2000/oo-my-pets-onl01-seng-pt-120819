require 'pry'
class Owner
  attr_reader :species, :name, :pets

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
    @pets [:cats] << Cat.new(name, self)
  end

  def buy_dog(name)
    @pets [:dogs] << Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
    # @pets[:dogs].each do |dogs|
    #   dog.mood = "happy"
    # end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet|
      pet.mood = "nervous"
    end

  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

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
