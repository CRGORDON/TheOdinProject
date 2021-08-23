#for The Odin Project, Ruby track...some elegant solutions posted, but here's my beginner first draft.
def cypher_it(string, offset)
  offset_int = offset.to_i
  split_string_into_array = string.split(//) #make it an array
  split_string_into_array.map! {|letter| letter.ord} #convert the letters into ascii integers
  split_string_into_array.map! do |integer| #incorporate the offset
    case integer
    when 65..90 #I'm uppercase
      if integer >= (90 - offset_int) #I go past Z, wrap back to A
        y = integer + offset_int - 90
        integer = 65 + y - 1
      else
        integer += offset_int 
      end 
    when 97..122 #I'm lowercase
      if integer >= (122 - offset_int) #Going past z, wrap back to a
        y = integer - 122 + offset_int
        integer = y + 97 - 1
      else 
        integer += offset_int
      end
    else
      integer
    end
  end
  split_string_into_array.map! {|letter| letter.chr} #convert back to a letter
  p split_string_into_array.join #display as string not as array
end



puts "what string do you want to cypher?"
string = gets.chomp
puts "and how many positions to move the cypher?"
offset = gets.chomp
cypher_it(string, offset)
