class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.length - @text.split.count + 1

    #Make a loop to count occurances 
  
    @lowercase_text = @text.downcase.gsub(/[^a-z0-9\s]/i, "")
    @loop_array = @lowercase_text.split
    @a = []
    @b = []

    while @loop_array.count > @a.count
      
      if @loop_array[@a.count] == @special_word
        
          @b.push(@special_word)
      
      end

      @a.push(1) 

    end

    @occurrences = @b.count

    # @occurrences = @special_word.in?(@text.downcase)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @r = @apr / 1200
    @n = @years * 12 
    
    @monthly_payment = @principal * ( (@r * (1 + @r) ** @n) / ( (1 + @r) ** @n - 1) )

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    
    @seconds = "Replace this string with your answer."
    @minutes = "Replace this string with your answer."
    @hours = "Replace this string with your answer."
    @days = "Replace this string with your answer."
    @weeks = "Replace this string with your answer."
    @years = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum
 
    @median = ((@sorted_numbers[(@count - 1) / 2] + @sorted_numbers[@count / 2]) / 2).to_f

    @sum = @numbers.sum

    @mean = @sum / @count

    @placeholder = 0
    @counter = 0
    
    while @counter < @count
    
      @placeholder = ( ( @numbers[@counter] - @mean ) ** 2 ) + @placeholder
      @counter = @counter + 1
  
    end

    @variance = @placeholder / @count

    @standard_deviation = Math.sqrt(@variance)

    @placeholder1 = 0
    @counter = 0
    @how_many = 0
    @streak = 0
    @winner = 0
    
    while @counter < (@count - 1)
    
      @how_many = @numbers.count(@numbers[@counter])
      
      if @how_many > @streak
        
        @streak = @how_many
        @winner = @numbers[@counter]

      end
    
      @counter = @counter + 1
      
    end

    @mode = @winner

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
