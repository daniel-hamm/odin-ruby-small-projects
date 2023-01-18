# method for the dictionary check
# word is the given word array. can be single letters, a two letter array etc.
def dictionary_check(word, dictionary)

    # create a new array to push the matching results to
    result = Array.new

    # loop through each value of the given word array
    word.each do |value|

        # loop through each word of the dictionary array
        dictionary.each do |word|
            
            # if a word inside the dictionary array matches the value
            if word == value

                # push the result inside the result array
                result.push(word)

            end

        end

    end

    # return the result
    result

end

# method to split the given word into a single letter array
def split_into_single_letters(word)

    # split the string into a single letter array
    word = word.split("")

    # return the single letter array
    word

end

# method to split the given word into a two letter array
# example: word = "below"; result[0] = "be"; result[1] = "el"; result[2] = "lo"; result[3] = "ow"
# result = ["be", "el", "lo", "ow"]
def split_into_letters(word)

    # create a new array for the results
    result = Array.new

    # loop counter
    i = 0
    k = 1   # start value = 1

    # create 
    while k < word.length
        while i < (word.length + 1 - k) do
            
            result[result.length] = word[i...i+k]
            
            i += 1

        end
        i = 0
        k += 1
    end
    # return the result
    result

end

def substrings(word, dictionary)

    # create a new array for the results
    result = Array.new

    # call the first check
    #result = result.push(dictionary_check(split_into_single_letters(word), dictionary))

    # call the second check
    #result = result.push(dictionary_check(split_into_two_letters(word), dictionary))

    result = split_into_letters(word)

    # return the results
    result
    
end

# create the word we want to search substrings from
word = "below"

# create the dictionay where we want to search for substrings
dictionary = ["below","b","ow","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings(word, dictionary)