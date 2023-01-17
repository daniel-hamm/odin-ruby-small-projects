
# get text and the cipher key from opening arguments ARGV
# open with args: ruby caesar-cipher.rb 'My text is awesome!' 3
text = ARGV[0]
key = ARGV[1]

def convert_letter_to_number(letter)
    case letter
    when "a"
        return 1
    when "b"
        return 2
    when "c"
        return 3
    when "d"
        return 4
    when "e"
        return 5
    when "f"
        return 6
    when "g"
        return 7
    when "h"
        return 8
    when "i"
        return 9
    when "j"
        return 10
    when "k"
        return 11
    when "l"
        return 12
    when "m"
        return 13
    when "n"
        return 14
    when "o"
        return 15
    when "p"
        return 16
    when "q"
        return 17
    when "r"
        return 18
    when "s"
        return 19
    when "t"
        return 20
    when "u"
        return 21
    when "v"
        return 22
    when "w"
        return 23
    when "x"
        return 24
    when "y"
        return 25
    when "z"
        return 26
    end
end

def convert_number_to_text(number)
    case number
    when 1
        return "a"
    when 2
        return "b"
    when 3
        return "c"
    when 4
        return "d"
    when 5
        return "e"
    when 6
        return "f"
    when 7
        return "g"
    when 8
        return "h"
    when 9
        return "i"
    when 10
        return "j"
    when 11
        return "k"
    when 12
        return "l"
    when 13
        return "m"
    when 14
        return "n"
    when 15
        return "o"
    when 16
        return "p"
    when 17
        return "q"
    when 18
        return "r"
    when 19
        return "s"
    when 20
        return "t"
    when 21
        return "u"
    when 22
        return "v"
    when 23
        return "w"
    when 24
        return "x"
    when 25
        return "y"
    when 26
        return "z"
    end
end

def convert(text, key)

    # split the string to an array
    text = text.split("")

    # convert the single letters inside the array to numbers; a = 1, b = 2 etc.
    text.each_with_index do |value, index|

        # only convert to number if the letter is in the alphabet, no special characters or numbers
        if text[index].match?(/[A-Za-z]/)
            text[index] = convert_letter_to_number(value)
        end

    end

    # convert the numbers inside the array to the given cipher key
    text.each_with_index do |value, index|

        # only convert if the value is an integer, no special characters
        if text[index].class == Integer

            # calculate the new value; if the key is 3: z = 26 + 3 = 29
            new_value = value + key.to_i

            # if the value is above 26, start at 1 respectively the letter a
            # 29 => 29 - 26 = 3 => letter: c
            # else just return the new value
            if new_value > 26
                text[index] = new_value - 26
            else
                text[index] = new_value
            end

        end

    end

    # convert the single numbers inside the array to letters; 1 = a, 2 = b etc.
    text.each_with_index do |value, index|

        # only convert if the value is an integer, no special characters
        if text[index].class == Integer
            text[index] = convert_number_to_text(value)
        end

    end

    puts text.join("")

end

convert(text, key)