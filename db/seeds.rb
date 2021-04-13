# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Test.destroy_all
User.destroy_all
Result.destroy_all
Question.destroy_all
Answer.destroy_all

users = User.create!([
  { name: 'Stas', login: 'stas01', password: '123' },
  { name: 'Igor', login: 'igor01', password: '1234' },
  { name: 'Max', login: 'max01', password: '12345' }
])

categories = Category.create!([
  { title: 'Астрономия' },
  { title: 'Спорт' },
  { title: 'Математика' }
])

tests = Test.create!([
  { title: 'Планеты солнечной системы', level: 0, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Футбол', level: 1, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Сложение чисел', level: 0, category_id: categories[2].id, author_id: users[0].id }
])

results = Result.create!([
  { status: true, user_id: users[0].id, test_id: tests[0].id },
  { status: true, user_id: users[1].id, test_id: tests[1].id },
  { status: true, user_id: users[2].id, test_id: tests[2].id }
])

questions = Question.create!([
  { body: 'Какая первая планета от Солнца?', test_id: tests[0].id },
  { body: 'Сколько будет 2+2?', test_id: tests[2].id },
  { body: 'Сколько будет 3+3?', test_id: tests[2].id },
  { body: 'Сколько человек играет в футбольной команде?', test_id: tests[1].id }
])

answers = Answer.create!([
  { body: 'Земля', question_id: questions[0].id },
  { body: 'Меркурий', question_id: questions[0].id, correct: true },
  { body: 'Марс', question_id: questions[0].id },
  { body: '3', question_id: questions[1].id },
  { body: '5', question_id: questions[1].id },
  { body: '4', question_id: questions[1].id, correct: true },
  { body: '6', question_id: questions[2].id, correct: true },
  { body: '7', question_id: questions[2].id },
  { body: '8', question_id: questions[2].id },
  { body: '10', question_id: questions[3].id },
  { body: '11', question_id: questions[3].id, correct: true },
  { body: '12', question_id: questions[3].id }
])
