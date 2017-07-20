require_relative 'Jungle_beats.rb'
puts "Welcome to Jungle Beats!"
continue = true
while continue == true
  puts "Let's make a beat! Enter some sounds:"
  initial = gets.chomp
  jb = JungleBeat.new(initial)
  continue2 = true
  skip_msg = false
  until continue2 == false
    if skip_msg == false
      puts "Your beat so far is: #{jb.all}"
    end
    puts "Would you like to change your beat? Press: \n 1. To add beats to the end \n 2. To add beats to the beginning \n 3. To insert beats somewhere else in the rhythm \n 4. To delete beats \n 5. To change voices \n 6. To change the rate \n 7. If you are satisfied with your rhythm and want to hear it! \n 8. To exit"
    answer = gets.chomp.to_i
    case answer
    when 1
      puts "What would you like to add to the end?"
      app = gets.chomp
      jb.append(app)
      skip_msg = false
    when 2
      puts "What would you like to add to the beginning?"
      prep = gets.chomp
      jb.prepend(prep)
      skip_msg = false
    when 3
      puts "What would you like to insert?"
      ins1 = gets.chomp
      puts "Where would you like to insert it? (position 2 would make the word/phrase the 2nd element)"
      ins2 = gets.chomp.to_i
      jb.insert(ins2, ins1)
      skip_msg = false
    when 4
      puts "Enter a word to delete (all instances of) or a position (to delete the word in that position)"
      del = gets.chomp
      jb.delete(del)
      skip_msg = false
    when 5
      puts "Enter a new voice to sing your beat (current voice: #{jb.voice})"
      user_voice = gets.chomp
      jb.change_voice(user_voice)
      skip_msg = true
    when 6
      puts "Enter the rate at which you want your beat sang (current rate: #{jb.rate})"
      rate = gets.chomp.to_i
      jb.change_rate(rate)
      skip_msg = true
    when 7
      jb.play
      skip_msg = true
    when 8
      continue2 = false
    else
      puts "Invalid option selected"
      skip_msg = true
    end
  end
  puts "Make another beat? (y/n)"
  ans = gets.chomp
  if ans != 'y' && ans != 'Y'
    continue = false
  end
end
puts "Thanks for jamming!"
