require_relative 'app/models/patient'
require_relative 'app/models/room'
require_relative 'app/repositories/patient_repository'
# The REPO should be the one setting the IDs

patient_csv = '/Users/dougberks/code/lewagon/lectures/1105/hospital/data/patients.csv'
patient_repository = PatientRepository.new(patient_csv)

# create the controller
# create the router
# run the router

mehdi = Patient.new(name: 'Mehdi')
patient_repository.create(mehdi)
p patient_repository

# kris = Patient.new(name: 'Kris')
# anri = Patient.new(name: 'Anri')

# vip = Room.new(capacity: 2)
# basic = Room.new(capacity: 20)
# # p vip
# # basic
# vip.add_patient(kevin)
# vip.add_patient(kris)
# basic.add_patient(anri)

# p kevin
