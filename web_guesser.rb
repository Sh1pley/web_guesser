require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)
@@background = ""

def check_guess(input)
  if input.to_i > (SECRET_NUMBER + 5)
    @@background = "crimson"
    "Way Too High!!"
  elsif input.to_i < (SECRET_NUMBER - 5)
    @@background = "crimson"
    "Way Too Low!!"
  elsif input.to_i > SECRET_NUMBER
    @@background = "lightpink"
    "Too High!"
  elsif input.to_i < SECRET_NUMBER
    @@background = "lightpink"
    "Too Low!"
  elsif input.to_i == SECRET_NUMBER
    @@background = "lime"
    "You got it right! Secret number was #{SECRET_NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => SECRET_NUMBER, :message => message, :background => @@background}
end

