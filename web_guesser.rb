require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)

def check_guess(input)
  if input.to_i > (SECRET_NUMBER + 5)
    "Way Too High!!"
  elsif input.to_i < (SECRET_NUMBER - 5)
    "Way Too Low!!"
  elsif input.to_i > SECRET_NUMBER
    "Too High!"
  elsif input.to_i < SECRET_NUMBER
    "Too Low!"
  elsif input.to_i == SECRET_NUMBER
    "You got it right! Secret number was #{SECRET_NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => SECRET_NUMBER, :message => message}
end

