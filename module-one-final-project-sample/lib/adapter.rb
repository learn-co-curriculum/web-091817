class Adapter
  attr_accessor :path

  ROUTE = "http://pokeapi.co/api/v2/pokemon/"

  def self.get_route
    ROUTE
  end

  def self.random_number
    rand(1..151)
  end

  def self.get_random_pokemon
    route = "#{get_route}#{random_number}"
    response = open("#{route}").read
    JSON.parse(response)
  end

end
