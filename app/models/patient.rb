class Patient
  attr_reader :name
  attr_accessor :room, :id

  # def initialize(name, cured, address, phone, age, insurance)
  def initialize(attributes = {})
    @id = attributes[:id]  # integer
    @name = attributes[:name] # string
    @cured = attributes[:cured] || false # boolean
    @room = attributes[:room]
  end

  # attr_reader :room
  def room
    @room # INSTANCE
  end

  def cured?
    @cured
  end
end

# when we initialize an instance, we HAVE TO give it a hash
