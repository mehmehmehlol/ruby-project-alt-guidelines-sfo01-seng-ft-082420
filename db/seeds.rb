SwimMeet.destroy_all
Student.destroy_all
Coach.destroy_all

student1 = Student.create(name: Faker::Name.name)
student2 = Student.create(name: Faker::Name.name)
student3 = Student.create(name: Faker::Name.name)
student4 = Student.create(name: Faker::Name.name)
student5 = Student.create(name: Faker::Name.name)
student6 = Student.create(name: Faker::Name.name)
student7 = Student.create(name: Faker::Name.name)
student8 = Student.create(name: Faker::Name.name)
student9 = Student.create(name: Faker::Name.name)
student10 = Student.create(name: Faker::Name.name)

coach1 = Coach.create(name: Faker::Name.name)
coach2 = Coach.create(name: Faker::Name.name)
coach3 = Coach.create(name: Faker::Name.name)
coach4 = Coach.create(name: Faker::Name.name)
coach5 = Coach.create(name: Faker::Name.name)

sm1 = SwimMeet.create(coach_id: Coach.all.sample.id, student_id: Student.all.sample.id, name: Faker::Address.city)
sm2 = SwimMeet.create(coach_id: Coach.all.sample.id, student_id: Student.all.sample.id, name: Faker::Address.city)
sm3 = SwimMeet.create(coach_id: Coach.all.sample.id, student_id: Student.all.sample.id, name: Faker::Address.city)






