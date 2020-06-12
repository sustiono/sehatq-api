# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Create Roles
if Role.all.empty?
  Role.create([
    { name: 'Doctor' },
    { name: 'Patient' }
  ])
end

# Create Doctors
if User.doctors.empty?
  1.upto(10) do
    User.create({
      name: Faker::Name.unique.name,
      address: Faker::Address.full_address,
      email: Faker::Internet.unique.email,
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf',
      role_id: Role.doctor.id
    })
  end
end

# Create Patients
if User.patients.empty?
  1.upto(10) do
    User.create({
      name: Faker::Name.unique.name,
      address: Faker::Address.full_address,
      email: Faker::Internet.unique.email,
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf',
      role_id: Role.patient.id
    })
  end
end

# Create Hospitals
if Hospital.all.empty?
  1.upto(10) do
    Hospital.create({
      name: "#{Faker::Company.name} Center",
      address: Faker::Address.full_address
    })
  end
end

# Create schedules for doctors
if Schedule.all.empty?
  User.doctors.each do |doctor|
    Date.current.upto(Date.current + 30.days) do |date|
      start_time = date + 9.hours
      end_time = start_time + 3.hours
      Schedule.create({
        start_time: start_time,
        end_time: end_time,
        user_id: doctor.id,
        hospital_id: Hospital.all.sample.id
      })
    end
  end
end
