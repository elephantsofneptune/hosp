require 'pp'

class Person
  def initialize(name)
    @name = name
  end
end

class Patient < Person
  attr_accessor :ailment

  def initialize(name, ailment)
    @name = name
    @ailment = ailment
  end
end

class Employees < Person
end

class Hospital
  attr_accessor :patients, :employees, :name

  def initialize(name)
    @name = name
    @patients = []
    @employees = []
  end

  def checkin_patient(patient)
    @patients << patient
  end

  def triage(*patients)
    patients.flatten.each { |person| checkin_patient(person) }
  end

  def patient_report
    patients.each_with_object(Hash.new(0)) { |person, report| report[person.ailment] += 1 }
  end

end

st_lukes = Hospital.new('St. Lukes')

def earthquake!
  injuries = ['broken arm', 'concussion', 'earthquake-related erectile disfunction', 'scurvy', 'hysterical blindness',
              'high cholesterol', 'man-child syndrome', 'death', 'earthquake-related gonorrhea']
  casualties = []
  100.times do |num|
    casualties << Patient.new("John Doe #{num+1}", injuries.sample)
  end
  casualties
end

st_lukes.triage(earthquake!)

pp st_lukes.patient_report
