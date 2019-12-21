class ObscuringReferences
  attr_reader :data

  def initialize(data)
    @data = data
  end

  # dataの構造に依存したメソッド
  def diameters
    data.collect { |cell|
      cell[0] + (cell[1] * 2)
    }
  end
end

class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel|
      wheel.rim + (wheel.tire * 2)
    }
  end

  Wheel = Struct.new(:rim, :tire)

  def wheelify(data)
    data.collect { |cell|
      Wheel.new(cell[0], cell[1])
    }
  end
end

data = [[622, 20], [622, 23], [559, 30], [559, 40]]
p ObscuringReferences.new(data).diameters
