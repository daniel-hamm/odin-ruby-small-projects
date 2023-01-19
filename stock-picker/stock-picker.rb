# method to return the best day to buy stock and the best day to sell stock
def stock_picker(array)

    # create an array to store the result
    result = Array.new

    # variable to store the current highest difference between buying and selling
    current_value = 0

    # variable to store the current calculated difference between buying and selling
    diff = 0

    # counter variable for the inner loop
    i = 0

    # counter variable for the outer loop
    k = 1

    # two nested loops
    # the outer loop: loops through every array object
    # the inner loop: calculate the difference of current outer loop object with the other objects in the array

    # lets say we have the current stock: [17,3,6,9,15,8,6,1,10]
    # we want to substract the buy value from the sell value
    # we have to buy first before selling, so calculation starts from the end of the loop
    # first round:  10 - 1; 10 - 6; 10 - 8; and so on...
    # second round: 1 - 6; 1 - 8; 1 - 15; and so on...
    # the current difference gets stored in a variable, if's higher than the one before
    # and we also save that position in the array, if that's the case

    while k < array.length do

        while i < array.length do

            # get the current position of the SELL object (depends on the outer loop)
            array_position_to_substract_from = array.length - k

            # get the current position of the BUY object (depends on the inner loop)
            array_position_to_substract = array.length - 1 - i

            # calculate the difference between BUY and SELL
            diff = array[array_position_to_substract_from] - array[array_position_to_substract]

            # if the difference is higher than before
            if diff > current_value

                # save the new higher difference
                current_value = diff

                # save the SELL position
                result[0] = array_position_to_substract_from

                # save the BUY position
                result[1] = array_position_to_substract
            end
            
            # increment the inner loop
            i += 1

        end

        # set the inner loops counter to the outer loops counter
        # we don't want to buy after we sold
        # like in the example above, when we start with 10; just substract every number before with it: 1, 6, 8, 15 ...
        # same for the next round: we start with 1; substract: 6, 8, 15 etc. NOT 10
        i = k

        # increment the outer loop
        k += 1

    end

    # return the result
    result

end

# create the stock
stock = [17,3,6,9,15,8,6,1,10]

# call the stock picker function and print the return
p stock_picker(stock)