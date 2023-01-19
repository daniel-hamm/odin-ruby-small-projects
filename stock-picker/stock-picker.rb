def stock_picker(array)

    result = Array.new
    current_value = 0
    diff = 0

    i = 0
    k = 1

    while k < array.length do

        while i < array.length do

            array_position_to_substract_from = array.length - k
            array_position_to_substract = array.length - 1 - i

            diff = array[array_position_to_substract_from] - array[array_position_to_substract]

            if diff > current_value
                current_value = diff
                result[0] = array_position_to_substract_from
                result[1] = array_position_to_substract
            end
            
            i += 1

        end

        i = k
        k += 1

    end

    p result

end

stock = [17,3,6,9,15,8,6,1,10]

stock_picker(stock)