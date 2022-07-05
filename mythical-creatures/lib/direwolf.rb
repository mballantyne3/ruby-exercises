class Direwolf
  attr_reader :name, :size, :home, :starks_to_protect

  def initialize(name, home = "Beyond the Wall", size = "Massive")
    @name = name
    @size = size
    @home = home
    @starks_to_protect = []
  end

  def protects(stark)
    if starks_to_protect.count < 2
      if stark.location == home
        @starks_to_protect << stark
        stark.safe = true
      end
    end
  end

  def hunts_white_walkers?
    @starks_to_protect.empty?
  end

  def leaves(stark)
    starks_to_protect.delete(stark)
    stark.safe = false
    stark
  end

end

class Stark
  attr_reader :name, :location
  attr_writer :safe

  def initialize(name, location = "Winterfell")
    @name = name
    @location = location
    @safe = false
  end

  def safe?
    @safe
  end

  def house_words
    "Winter is Coming"
  end

end
