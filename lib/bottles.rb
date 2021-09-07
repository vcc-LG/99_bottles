class Bottles
  def get_bottle_nouns(number_of_bottles)
    return %w[bottles bottle] if number_of_bottles == 2
    return %w[bottle bottles] if number_of_bottles == 1

    %w[bottles bottles]
  end

  def get_bottle_numbers(number_of_bottles)
    return [number_of_bottles, 'no more'] if number_of_bottles == 1
    return ['no more', 99] if number_of_bottles.zero?

    [number_of_bottles, number_of_bottles - 1]
  end

  def get_turnaround(number_of_bottles)
    return 'Go to the store and buy some more' if number_of_bottles.zero?
    return 'Take it down and pass it around' if number_of_bottles == 1

    'Take one down and pass it around'
  end

  def get_verse(bottle_nouns, bottle_numbers, turnaround)
    "#{bottle_numbers[0].to_s.capitalize} #{bottle_nouns[0]} of beer on the wall, #{bottle_numbers[0]} #{bottle_nouns[0]} of beer.\n#{turnaround}, #{bottle_numbers[1]} #{bottle_nouns[1]} of beer on the wall."
  end

  def verse(number_of_bottles)
    bottle_nouns = get_bottle_nouns(number_of_bottles)
    bottle_numbers = get_bottle_numbers(number_of_bottles)
    turnaround = get_turnaround(number_of_bottles)
    verse_string = get_verse(bottle_nouns, bottle_numbers, turnaround)
    "#{verse_string}\n"
  end

  def verses(*args)
    output = ''
    bottle_numbers = (args.max).downto(args.min)
    bottle_numbers.each do |number_of_bottles|
      bottle_nouns = get_bottle_nouns(number_of_bottles)
      bottle_numbers = get_bottle_numbers(number_of_bottles)
      turnaround = get_turnaround(number_of_bottles)
      output += get_verse(bottle_nouns, bottle_numbers, turnaround)
      output += "\n       \n" if number_of_bottles != args.min
    end
    <<~VERSES
      #{output}
    VERSES
  end

  def song
    verses(99, 0)
  end
end

puts Bottles.new.song
