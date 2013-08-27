#def either_or (arg, num1, num2)
#  if arg == true 
#    num1
#  else
#    num2
#  end
#end

def favorite_number (fav_num, guess)
  if fav_num == guess
    "You got it!"
  elsif fav_num < guess
    "Too high"
  elsif fav_num > guess
    "Too low"
  end
end

def either_or (arg, num1, num2)
   arg ? num1 : num2
   
end

require 'rspec/autorun'

describe "either_or" do
  it "should return the second argument if the first is true" do
    either_or(true, "A", "B").should eq("A")
  end
  it "should return the third argument if the first if false" do
    either_or(false, 1, 2).should eq(2)
  end
end

describe "favorite_number" do
  it "should return 'Too low' if the guess is low" do
    favorite_number(10, 1).should eq("Too low")
  end
  it "should return 'Too high' if the guess is high" do
    favorite_number(5, 11).should eq("Too high")
  end
  it "should return 'You got it!' if the guess is right" do
    favorite_number(11, 11).should eq("You got it!")
  end
end