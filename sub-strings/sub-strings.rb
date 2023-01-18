def substrings(word, dictionary)

    result = Array.new

    word = word.split("")

    word.each_with_index do |letter, index|

        dictionary.each do |word|
            
            if word == letter
                result.push(word)
            end

        end

    end

    #dictionary.find do |data|
    #    data == word
    #end

    result
    
end

dictionary = ["below","b","w","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

print substrings("below", dictionary)