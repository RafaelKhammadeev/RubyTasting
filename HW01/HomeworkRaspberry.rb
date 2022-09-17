# require - это штуки для импорта причем они отличаются
# require_relative

class Raspberry
  @states = { 0 => 'Отсутствует', 1 => 'Цветение', 2 => 'Зеленая', 3 => 'Красная' }

  def initialize(index = 0, state = 0)
    @index = index
    # state > 3 ? @state = 3 : @state = state
    @state = state > 3 ? 3 : state
  end

  # @return [Integer]
  def get_state
    @state
  end

  def grow!
    # если статус меньше 3(максимально созревшая), то она вырастает на +1
    @state < 3 ? @state += 1 : @state
  end

  def ripe?
    @state == 3
  end
end

class RaspberryBash
  def initialize(count)
    @raspberries = []
    count.times do |index|
      raspberry = Raspberry.new(index)
      @raspberries << raspberry
    end
  end

  def get_raspberries
    puts @raspberries.to_s
  end

  def grow_all!
    @raspberries.each(&:grow!)
  end

  def ripe_all?
    # all проверяет если один не true то все false
    @raspberries.map(&:ripe?).all?
  end

  def give_away_all!
    # Функцию удаления элементов nil массива выполняет метод .compact например:
    @raspberries.map { |raspberries| raspberries.get_state == 3 ? nil : raspberries }.compact
  end
end

class Human
  def initialize(name, plant)
    @name = name
    # за место plant поступает raspberry_bash
    @plant = plant
  end

  def work
    @plant.grow_all!
  end

  def harvest
    if @plant.ripe_all?
      @plant.give_away_all!
      puts 'Малинки собраны'
    else
      puts 'Малинки еще не дозрели'
    end
  end

  # через self создается статический метод
  def self.knowledge_base
    puts "Сажают малину весной, осенью, зеленые черенки — летом.\nПочву готовят заранее: при осенней посадке — где-тоза \nмесяц, при весенней — с осени. Если не успели, то весной,\nгде-то недели за 2-3, перед тем как соберетесь сажать."
  end
end

if __FILE__ == $PROGRAM_NAME
  Human.knowledge_base

  puts "\n"
  raspberry_bash = RaspberryBash.new(5)
  user = Human.new('Rafael', raspberry_bash)
  user.work
  user.work
  user.harvest
  user.work

  puts "\n"
  user.harvest
end
#
