class LookAndSay
  def initialize(count, starting_number)
    @count = count
    @starting_number = starting_number
    @array_conway = ["#{starting_number}"]
  end

  def run
    (0..@count - 1).each { |times|
      case @count
      when 0
        break

      when 1
        @array_conway.append("1" + @array_conway[0])

      else
        id = times
        subsequence = @array_conway[id].to_s.split('')
        elem = ''
        count_dup = 1
        subsequence_length = subsequence.length
        # puts subsequence_length

        # минус два, чтоб не выходить за рамки array при сравнении
        (0..subsequence_length - 1).each { |el|
          if subsequence[el] == subsequence[el + 1]
            count_dup += 1

          else
            elem = elem + count_dup.to_s + subsequence[el].to_s
            count_dup = 1

          end
        }
        @array_conway.append(elem)
      end
    }
  end

  def show
    puts @array_conway
  end
end

# count - длина последовательности + 1 (ну одно последовательност больше выдает)
# starting_number  - началеное число с которого начинается последовательность
arr = LookAndSay.new(6, 1)
arr.run
arr.show
#
