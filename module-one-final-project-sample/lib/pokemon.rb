class Pokemon < ActiveRecord::Base
  has_many :trainer_pokemons
  has_many :trainers, through: :trainer_pokemons

  def self.find_or_create_through_hash(pokemon_hash)
    pokemon = parse_hash(pokemon_hash)
    where(pokemon).first_or_create
  end

  def self.parse_hash(pokemon_hash)
    pokemon = {}
    pokemon_hash.each do |k,v|
      if k =="id"
        pokemon["pokemon_number"] = v
      elsif k =="weight" || k=="name"
        pokemon[k] = v
      end
    end
    pokemon
  end
end
