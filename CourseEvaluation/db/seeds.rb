# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bcrypt'
include ActiveModel
cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
password_admin = BCrypt::Password.create('admin', cost: cost)
password_student = BCrypt::Password.create('student', cost: cost)

genders = Gender.create([{name: 'male'},{name: 'female'}])
users=User.create([{user_name: 'admin', password: 'admin', password_confirmation:'admin', email: 'admin@123.com', power: 2, gender: genders.first},
    {user_name: 'student1', password: 'student1', password_confirmation:'student1', email: 'student1@123.com', power: 1, gender: genders.second},
    {user_name: 'student2', password: 'student2', password_confirmation:'student2', email: 'student2@123.com', power: 1, gender: genders.second},
    {user_name: 'student3', password: 'student3', password_confirmation:'student3', email: 'student3@123.com', power: 1, gender: genders.second}])
    
colleges=College.create([{name: 'Computer Science'}, {name: 'Mathematical Science'}, {name: 'Physical Science'}])

majors=Major.create([{name: 'Software Engineering', college: colleges.first}, 
                     {name: 'Mathematics and Applied Mathematics', college: colleges[1]},
                     {name: 'Engineering Mechanics', college: colleges[2]}])

teachers=Teacher.create([{name: 'WeiJun', college: colleges.first, gender: genders.first, email:'weijun@123.com'},
                         {name: 'XiNanhua', college: colleges[1], gender: genders.first, email: 'XiNanhua@123.com'},
                         {name: 'LiuShuxin', college: colleges[2], gender: genders.first, email: 'LiuShuxin@123.com'}])

courses=Course.create([{name: 'Advanced Software Engineering', major: majors.first, teacher: teachers.first, year: Date.today},
    {name: 'Software Engineering', major: majors.first, teacher: teachers.first, year: Date.today},
    {name: 'Engineering', major: majors.first, teacher: teachers.first, year: Date.today},
    {name: 'Linear Algebra', major: majors[1], teacher: teachers[1], year: Date.today},
    {name: 'Calculus', major: majors[1], teacher: teachers[1], year: Date.today},
    {name: 'Mechanics', major: majors[2], teacher: teachers[2], year: Date.today}])

comments=Comment.create([{content: '老师上课寓教于乐，课程作业可以学到很多东西。', user: users.second, course: courses.first},
                        {content: '魏老师上课好帅！', user: users.last, course: courses.first},
                        {content: '认真学习考试很简单，拿高分较难。', user: users[2], course: courses.first},])

reviews=Review.create([{content: 'Agreed!', comment: comments.first, user: users.third},
                        {content: '@student2 3Q!', comment: comments.first, user: users.second}])

grades=Grade.create([{course: courses.first, user: users.second, year: Date.today}])

marks=Mark.create([{score: 5, course: courses.first, user:users.second}])

messages=Message.create([{content: 'Welcome!', from_id: 1, to_id: 2}])
