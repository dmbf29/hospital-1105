class Room
  class CapacityReachedError < StandardError; end
  attr_reader :capacity
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] # integer
    @patients = [] # an array of PATIENTS (instances)
  end


  def full?
    @capacity <= @patients.length
  end

  # vip.add_patient(kevin) => self IS the vip
  def add_patient(patient)
    unless full?
      @patients << patient
      # we need to also give the room to the patient
      patient.room = self
    else
      raise CapacityReachedError, 'The room is full'
    end
  end
end
