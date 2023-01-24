require 'csv'

class PatientRepository
  def initialize(csv_file_path) #, room_repository)
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    # save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # convert any 'non-string' attributes
      attributes[:id] = attributes[:id].to_i
      attributes[:cured] = attributes[:cured] == 'true'
      # p attributes[:room] = @room_repository.find(attributes[:room_id].to_i)

      patient = Patient.new(attributes)
      @patients << patient
      # @next_id += 1
    end
    @next_id = @patients.any? ? @patients.last.id + 1 : 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # add the headers first
      csv << ['id', 'name', 'cured']
      # then we add all the patients
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?]
      end
    end
  end
end
