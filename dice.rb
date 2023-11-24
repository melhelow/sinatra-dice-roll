require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do
 erb(:elephant)
end
get ("/zebra") do
  "we must add a route for each path we want to support"
end
get("/giraffe") do
  "hopefully this shows up without having to restart the server"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  outcome = " you rolled a #{first_die} and a #{second_die} for the total of #{sum}."
  "<h1>2d10</h1>
  <p>#{outcome} </p>"

end
get("/dice1/20") do 
  dice = rand(1..20)
  outcome = "you rolled the dice and the outcome is #{dice}."
  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end
get("/dice/5/4") do
  dice_one = rand(1..4)
  dice_two = rand(1..4)
  dice_three = rand(1..4)
  dice_four =  rand(1..4) 
  dice_five = rand(1..4)
  sum = dice_one + dice_two + dice_three + dice_four + dice_five
  outcome = "you have rolled a #{dice_one} and #{dice_two} and #{dice_three} and #{dice_four} and #{dice_five} and the sum of them is #{sum}."
  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end
