require "colorize"

### Pseudocode ###

# Дізнатися в юзера його бажану команду
# Поставити протилежну команду комп'ютеру
# Запитати в юзера бажане місце для знаку
# Поставити в це бажане місце знак
# Вибрати рандомом місце для знаку комп'ютера
# Поставити в рандомне місце знак комп'ютера
#
# Коли будь-який гравець досяг 3-ох поставлених знаків, перевірити, чи не стоять
# чиїсь знаки в ряд чи діагонально
# Якщо стоять, цей гравець -- переможець
# Якщо ні, продовжити розставляння знаків по черзі
# Якщо кількість усіх поставлених знаків == 9 -- нічия
#
# Відобразити результати гри

### Classes ###

class Game
  protected
  
  def get_user_team
    team = ""
    loop do
      puts "Pick a team (X or O):"
      team = gets.chomp.upcase
      break if team == "X" || team == "O"
      puts "You should choose between X or O. Please try again:"
    end
    team
  end
  
  def set_teams
    if @user_team == "X"
      @computer_team = "O"
    elsif @user_team == "O"
      @computer_team = "X"
    end
  end

  def colorize_coord(coordinate)
    if coordinate.is_a?(Integer)
      coordinate.to_s.gray
    elsif coordinate == user_team
      coordinate.magenta
    else coordinate end
  end

  def show_table
    puts "    ___________________
    |     |     |     |
    |  #{colorize_coord(@table[1])}  |  #{colorize_coord(@table[2])}  |  #{colorize_coord(@table[3])}  |
    |_____|_____|_____|
    |     |     |     |
    |  #{colorize_coord(@table[4])}  |  #{colorize_coord(@table[5])}  |  #{colorize_coord(@table[6])}  |
    |_____|_____|_____|
    |     |     |     |
    |  #{colorize_coord(@table[7])}  |  #{colorize_coord(@table[8])}  |  #{colorize_coord(@table[9])}  |
    |_____|_____|_____|
    "
  end

  def put_mark
    puts "Enter a number where you want to put your mark:"
    pos = gets.chomp.to_i
    if @table[pos].is_a?(Integer)
      @table[pos] = user_team
    elsif @table[pos].nil?
      puts "Invalid input. Please try again."
    else
      puts "That square is already marked. Let's choose another one."
    end
  end
  
  attr_accessor :computer_team, :user_team

  def initialize
    @computer_team = nil
    @user_team = get_user_team
    set_teams
    @table = {
      1 => 1,   2 => 2,   3 => 3,
      4 => 4,   5 => 5,   6 => 6,
      7 => 7,   8 => 8,   9 => 9
    }
    @winner = nil
  end

  public
  
  def play_game
    loop do
      show_table
      put_mark
    end
  end
end

### Program ###

game_object = Game.new 
game_object.play_game
