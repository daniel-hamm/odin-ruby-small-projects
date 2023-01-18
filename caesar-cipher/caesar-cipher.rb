# method for converting a string to an array of numbers
def convert_text_to_ascii(text)
    
    # split the string to an array
    text = text.split("")

    # convert the single letters inside the array to numbers; a = 97, b = 98, A = 65, B = 66 etc. according to the ASCII Table
    text.each_with_index do |value, index|

        # only convert to number if the letter is in the alphabet, no special characters or numbers
        if text[index].match?(/[A-Za-z]/)

            # return the integer ordinal of our value (ASCII)
            text[index] = value.ord

        end

    end

    # return text as array of ASCII numbers
    text

end

# method for adding the cipher key to the array of ASCII numbers
def add_cipher_key(text, key)

    # convert the numbers inside the array according to the given cipher key
    text.each_with_index do |value, index|

        # only convert if the value is an integer, no special characters
        if text[index].class == Integer

            # calculate the new value; if the key is 3: z = 26 + 3 = 29
            new_value = value + key

            # function to substract 26 from the new number values if they are above a certain number to stay inside the alphabet

            # if the ASCII value is between 97 and 122, we have downcase letters
            # due to adding the cipher key, the value can be large than 122. if so: substract 26, because the alphabet has 26 letters and we want to stay inside the alphabet
            # lets say we have a "z" as letter, which is 122 als ASCII value. if we add a key of 1, the new value is 123. So: 123 - 26 = 97. 97 to ASCII is "a"

            # if the ASCII value is between 65 and 90, we have uppercase letters
            # due to adding the cipher key, the value can be large than 90. if so: substract 26, because the alphabet has 26 letters and we want to stay inside the alphabet
            # lets say we have a "Z" as letter, which is 90 als ASCII value. if we add a key of 1, the new value is 91. So: 91 - 26 = 65. 65 to ASCII is "A"

            if (value >= 97 and value <= 122 and new_value > 122) or (value >= 65 and value <= 90 and new_value > 90)
                text[index] = new_value - 26
            else
                text[index] = new_value
            end

        end

    end

    # return text as array of ASCII numbers with added cipher key
    text

end

def convert_ascii_to_number(text)

    # convert the single numbers inside the array to letters; 1 = a, 2 = b etc.
    text.each_with_index do |value, index|

        # only convert if the value is an integer, no special characters
        if text[index].class == Integer

            # convert the ASCII numbers to letters
            text[index] = value.chr

        end

    end

    # return text as array of letters
    text

end

def convert()

    # get text and the cipher key from opening arguments ARGV
    # open with args: ruby caesar-cipher.rb 'My text is awesome!' 3
    text = ARGV[0]
    key = ARGV[1].to_i

    # add the modulo operator to the key
    # keys above 26 don't make sense, since we only have 26 letters
    # lets say we have 27 % 26 = 1; the key starts at 1 again
    key = key % 26

    # call the method to convert the given text to an array of ASCII numbers
    text = convert_text_to_ascii(text)

    # call the method to add the cipher key to the array of ASCII numbers
    text = add_cipher_key(text, key)

    # call the method to convert the array of ASCII numbers back to an array of letters / strings
    text = convert_ascii_to_number(text)

    # return the array of letters / strings and join back to a single string
    text.join("")

end

# call the convert function
puts convert()