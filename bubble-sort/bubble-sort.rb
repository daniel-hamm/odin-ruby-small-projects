# method for the bubble sort algorithm
def bubble_sort(array)

    # buffer to cache the array for sorting
    buffer = 0

    # counter variable for the loop
    i = 0

    # loop through the array of numbers
    while i < array.length - 1 do

        # if the next number in the array is smaller than the current
        # switch them
        if(array[i + 1] < array[i])

            # put the next number in a buffer
            buffer = array[i + 1]

            # set the next number to the current number
            array[i + 1] = array[i]

            # set the current number to the next number (from the buffer)
            array[i] = buffer

            # start the loop from the beginning, when we switched numbers
            i = 0

        # if there are no numbers to switch
        else

            # increment the counter, so we can check the next pair of numbers in the array
            i += 1

        end

    end

    # return the result
    array

end

# the array of numbers to sort
array = [4,3,78,2,0,2]

# call the bubble sort function and output the return
p bubble_sort(array)