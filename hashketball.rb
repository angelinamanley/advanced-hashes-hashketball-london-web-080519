require "pry"
def game_hash
  game_hash = {
   :home => {
     :team_name => "Brooklyn Nets",
     :colors => ["Black", "White"],
     :players => [
       "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1},
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7},
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15},
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5 },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 } ]
   },
   :away => {
     :team_name => "Charlotte Hornets",
     :colors => ["Turquoise", "Purple"],
     :players => [
       "Jeff Adrien" => {
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2 },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 },
        "DeSagna Diop" => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5 },
        "Ben Gordon" => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0 },
        "Kemba Walker" => {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12 }]
  }
}
 game_hash
end

def num_points_scored(player_name)
  num_points = 0
  game_hash.each do | team, team_details |
    team_details[:players].each do | player |  #thisis an array, iterating over each of the players
      player.each do | name, details |
          num_points = player[name][:points] if name == player_name
      end
    end
  end
  num_points
end

def shoe_size(player_name)
  size = 0
  game_hash.each do | team, team_details |
    team_details[:players].each do | player |  #thisis an array, iterating over each of the players
      player.each do | name, details |
          size = player[name][:shoe] if name == player_name
      end
    end
  end
  size
end

def team_colors(team_name)
  team_color = []
  game_hash.each do | team, attributes |
    attributes.each do | attributes, details |
      if details == team_name
        team_color = game_hash[team][:colors]
      end
    end
  end
  team_color
end

#operates on the game hash to return an array of the team names.
def team_names
  names = []
  game_hash.each do | team, attributes|
    names << game_hash[team][:team_name]
  end
  return names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do | team, attributes|
    if attributes[:team_name] == team_name
      attributes[:players].each do | player |
        player.each do | name, value |
            numbers << player[name][:number]
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do | team, attributes | # e.g. | home, (:team_name, :colors, etc)
    attributes[:players].each do | player_data | #e.g. "Alan johnson => {name}"  NEED TO ACCESS THIS KEY
        if player_data.keys.include?(player_name)
              stats = player_data[player_name]
        end
    end
  end
  stats
end

#will return the number of rebounds associated with the player that has the largest shoe size.
# First, find the player with the largest shoe size
# Then, return that player's number of rebounds
def big_shoe_rebounds
    shoe_size = 0
    rebounds = 0
    game_hash.each do | team, attributes |
      attributes[:players].each do | player_data | #array
        player_data.each do | player_name, detail |
          if detail[:shoe] > shoe_size

            shoe_size = detail[:shoe]
            rebounds = detail[:rebounds]
            end
        end
      end
    end
    rebounds
end

def most_points_scored
  points_scored = 0
  winner = nil
  game_hash.each do | team, attributes |
    attributes[:players].each do | player_data | #array
      player_data.each do | player_name, detail |
        if detail[:points] > points_scored

          points_scored = detail[:shoe]
          winner = player_name
        end
      end
    end
  end
  winner
end

def winning_team
  hornets = 0
  nets = 0
  game_hash[:home][:players].each do | player_data |
    player_data.each do | player_name, detail |
      nets = nets + detail[:points]
    end
  end
  game_hash[:away][:players].each do | player_data |
    player_data.each do | player_name, detail |
      hornets = hornets + detail[:points]
    end
  end
  if hornets > nets
    return game_hash[:away][:team_name]
  else
    return game_hash[:home][:team_name]
  end
end

def player_with_longest_name
  name_length = 0
  winner = 0
  game_hash.each do | team, attributes |
    attributes[:players].each do | player_data | #array
      player_data.each do | player_name, detail |
        if player_name.length > name_length
          name_length = player_name.length
          winner = player_name
        end
      end
    end
  end
  winner
end

def long_name_steals_a_ton?
   num_steals = 0
   name_length = 0 
   winner_name = 0
   winner_steal = 0
   game_hash.each do | team, attributes |
     attributes[:players].each do | player_data | #array
       player_data.each do | player_name, detail |
         if player_name.length > name_length
           winner_name = player_name
         end
           if detail[:steals] > num_steals
               winner_steal = player_name
           end
       end
     end
   end
   winner_steal == winner_name
end
