SwimMeet.destroy_all
Student.destroy_all
Coach.destroy_all

student1 = Student.create(name: Faker::Name.first_name)
student2 = Student.create(name: Faker::Name.first_name)
student3 = Student.create(name: Faker::Name.first_name)
student4 = Student.create(name: Faker::Name.first_name)
student5 = Student.create(name: Faker::Name.first_name)
student6 = Student.create(name: Faker::Name.first_name)
student7 = Student.create(name: Faker::Name.first_name)
student8 = Student.create(name: Faker::Name.first_name)
student9 = Student.create(name: Faker::Name.first_name)
student10 = Student.create(name: Faker::Name.first_name)

coach1 = Coach.create(name: Faker::Name.first_name)
coach2 = Coach.create(name: Faker::Name.first_name)
coach3 = Coach.create(name: Faker::Name.first_name)
coach4 = Coach.create(name: Faker::Name.first_name)
coach5 = Coach.create(name: Faker::Name.first_name)

sm1 = SwimMeet.create(coach_id: Coach.all.sample.id, student_id: Student.all.sample.id, name: Faker::Address.city)
sm2 = SwimMeet.create(coach_id: Coach.all.sample.id, student_id: Student.all.sample.id, name: Faker::Address.city)
sm3 = SwimMeet.create(coach_id: Coach.all.sample.id, student_id: Student.all.sample.id, name: Faker::Address.city)






