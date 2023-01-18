def remove_special_characters(word)

    i = 0

    word = word.split("")

    while i < word.length do
        if !word[i].match?(/[A-Za-z ]/)
            word.delete_at(i)
        end
        i += 1
    end

    word = word.join("")

    word = word.split(" ")

end


# method for the dictionary check
# word is the given word array. can be single letters, a two letter array etc.
def dictionary_check(word, dictionary)

    # create a new array to push the matching results to
    result = Hash.new(0)

    # loop through each value of the given word array
    word.each do |value|

        # loop through each word of the dictionary array
        dictionary.each do |word|
            
            # if a word inside the dictionary array matches the value; make it case insensitive
            if word.downcase == value.downcase

                # push the result inside the result array
                result[word] += 1

            end

        end

    end

    # return the result
    result

end

# method to split the given word into a two letter array
# example: word = "below"; result[0] = "be"; result[1] = "el"; result[2] = "lo"; result[3] = "ow"
# result = ["be", "el", "lo", "ow"]
def split_into_letters(word)

    # create a new array for the results
    result = Array.new

    # inner loop counter
    i = 0

    # middle loop counter
    k = 0

    # outer looper counter
    l = 0

    # we create three nested loops

    # outer loop
    # depends of how many words are in the given word sentence array

    # middle loop
    # 1: adjusts how many rounds the inner loop makes
    # 2: adjusts the length of the sub strings

    # the inner loop creates the sub strings and adds them to an array

    # example word: "below"
    # the amount of middle loop rounds is the words length => 0 to 4 = 5

    # round 1 (one letter strings): "b", "e", "l", "o", "w" => inner loop rounds: 5 - 0 = 5
    # "b" = word[0][0...0], "e" = word[0][1...1], "l" = word[0][2...2], "o" = word[0][3...3], "w" = word[0][4...4]

    # round 2 (two letter strings): "be", "el", "lo", "ow" => inner loop rounds: 5 - 1 = 4
    # "be" = word[0][0...1], "el" = word[0][1...2], "lo" = word[0][2...3], "ow" = word[0][3...4]

    # round 3 (three letter strings): "bel", "elo", "low" => inner loop rounds: 5 - 2 = 3
    # "bel" = word[0][0...2], "elo" = word[0][1...3], "low" = word[0][2...4]

    # round 4 (four letter strings): "belo", "elow" => inner loop rounds: 5 - 3 = 2
    # "belo" = word[0][0...3], "elow" = word[0][1...4]

    # round 5 (four letter strings): "below" => inner loop rounds: 5 - 4 = 1
    # "below" = word[0][0...4]


    # outer loop
    while l < word.length

        # middle loop
        while k < word[l].length

            # inner loop
            while i < (word[l].length - k) do
                
                # add the sub strings to the results array
                result[result.length] = word[l][i..i+k]
                
                # increment the inner loops counter
                i += 1

            end

            # set the inner loops counter to 0, so it can start again when incrementing the middle loop
            i = 0

            # increment the middle loops counter
            k += 1

        end

        # set the middle loops counter to 0, so it can start again when incrementing the outer loop
        k = 0

        # increment the outer loops counter
        l += 1

    end

    # return the result
    result

end

def substrings(word, dictionary)

    # create a new array for the results
    result = Hash.new

    # call the first check
    #result = result.push(dictionary_check(split_into_single_letters(word), dictionary))

    # call the second check
    #result = result.push(dictionary_check(split_into_two_letters(word), dictionary))

    result = dictionary_check(split_into_letters(remove_special_characters(word)), dictionary)

    # return the results
    result
    
end

# create the word we want to search substrings from
word = "Howdy partner, sit down! How's it going?"

# create the dictionay where we want to search for substrings
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings(word, dictionary)
