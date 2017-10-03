class CreateTrainerPokemons < ActiveRecord::Migration
  def change
    create_table :trainer_pokemons do |t|
      t.integer :trainer_id
      t.string :pokemon_id
    end
  end
end
