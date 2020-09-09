SwimMeet.destroy_all
Student.destroy_all
Coach.destroy_all

sm1 = SwimMeet.create(name: Faker::Company.name)

student1 = Student.create(name: Faker::Name.name)
student2 = Student.create(name: Faker::Name.name)

coach1 = Coach.create(name: Faker::Name.name)
coach2 = Coach.create(name: Faker::Name.name)

sm1.student << student1
sm1.coach << coach1



