SwimMeet.destroy_all
Student.destroy_all
Coach.destroy_all

sm1 = SwimMeet.create(name: Faker::Company.name)

student1 = Student.create(name: Faker::Name.name)
student2 = Student.create(name: Faker::Name.name)

coach1 = Coach.create(name: Faker::Name.name)
coach2 = Coach.create(name: Faker::Name.name)



```
- how to run the seed.rb file
- figure out what we can use with the faker gem
- how to join the coach and student to swim meet

Tomorrow:
- what method we will be using in our data
ex. find_by_create() to avoid duplication, maximum, minimum
Create 
- Create a swim meet
Read 
- how many swim meets are there?
- how many coaches are there?
- who has the most students?
U
- update our student profile, ex. student 1 don't want to be
on swim meet 1 and move him to swim meet 2 ... something like that
Delete
- delete student 1 from swim meet 1
```