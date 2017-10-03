class CLI

  def welcome
    puts "Welcome to CATCH THEM ALL"
    become_trainer
  end

  def become_trainer
    puts "What would you like to do?(enter a number)"
    puts "1.Create a Trainer 2.Choose a Trainer"
    response = gets.chomp
    case response
    when "1"
      create_trainer
    when "2"
      choose_a_trainer
    when "exit"
      exit
    else
      puts "Thats option is not valid"
      become_trainer
    end
  end

  def create_trainer
    trainer ={}
    puts "What is your name?"
    trainer[:name] = gets.chomp
    puts "what town are you from?"
    trainer[:town] = gets.chomp
    @current_trainer = Trainer.create(trainer)
    trainer_choices
  end

  def choose_a_trainer
    Trainer.list_all_trainer
    puts "Which trainer would you like to be?"
    trainer_id = gets.chomp
    @current_trainer = Trainer.find_by(id: trainer_id)
    trainer_choices
  end

  def trainer_choices
    puts "Would you like to do \n1.Catch a wild Pokemon 2.View all your pokemons 3.Create a Trainer 4.Exit"
    response = gets.chomp
    case response
    when "1"
      catch_wild_pokemon
    when "2"
      display_pokemons
    when "3"
      create_trainer
    when "4"
      exit
    else
      puts "Thats option is not valid"
      trainer_choices
    end
  end

  def catch_wild_pokemon
    pokemon_hash = Adapter.get_random_pokemon
    newPokemon = @current_trainer.add_pokemon(pokemon_hash)
    Pokemon.send_number(2)
    puts"You just caught a pokemon!!!"
    puts"pokemon number: #{newPokemon.pokemon_number}, name: #{newPokemon.name}, weight: #{newPokemon.weight}"
    trainer_choices
  end

  def display_pokemons
    @current_trainer.display_pokemons
    trainer_choices
  end

end
