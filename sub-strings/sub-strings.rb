def substrings(word, dictionary)

    result = Array.new
    single_letter_array = Array.new
    two_letter_array = Array.new
    i = 0

    ### first check
    # split the word into single letters for the first check
    single_letter_array = word.split("")

    # check for single letters inside the dictionary that match the given word
    single_letter_array.each do |letter|

        # loop through the dictionary array
        dictionary.each do |single_letter_array|
            
            # if a word inside the dictionary array matches a single letter
            if single_letter_array == letter

                # push the result inside the result array
                result.push(single_letter_array)

            end

        end

    end

    ### second check
    # split the word into two letter strings for the second check

    # loop through the word. one time less than the length of the word
    while i < (single_letter_array.length - 1) do

        # add two letters from the word array to a pair to create two letter strings inside a buffer array
        two_letter_array[i] = single_letter_array[i] + single_letter_array[i + 1]

        # increment the loop counter
        i += 1

    end

    print single_letter_array
    puts
    print two_letter_array
    puts

    result
    
end

dictionary = ["below","b","be","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

print substrings("below", dictionary)