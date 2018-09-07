# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

harry = User.create(username: 'harry')
ginny = User.create(username: 'ginny')
ron = User.create(username: 'ron')
hagrid = User.create(username: 'hagrid')
dumbledore = User.create(username: 'dumbledore')

harry_poll = Poll.create(title: 'Best Spells', user_id: harry.id)

h_question_1 = Question.create(text: 'Best charms spell?', poll_id: harry_poll.id)
hq1_answer_1 = AnswerChoice.create(question_id: h_question_1.id, text: 'crucio')
hq1_answer_2 = AnswerChoice.create(question_id: h_question_1.id, text: 'accio')

h_question_2 = Question.create(text: 'Best dueling spell?', poll_id: harry_poll.id)
hq2_answer_1 = AnswerChoice.create(question_id: h_question_2.id, text: 'confundo')
hq2_answer_2 = AnswerChoice.create(question_id: h_question_2.id, text: 'imperio')

ginny_poll = Poll.create(title: 'Muggle Ratings', user_id: ginny.id)

g_question_1 = Question.create(text: 'Rate hermione?', poll_id: harry_poll.id)
gq1_answer_1 = AnswerChoice.create(question_id: g_question_1.id, text: '1')
gq1_answer_2 = AnswerChoice.create(question_id: g_question_1.id, text: '10')


ron_poll = Poll.create(title: 'Food Favorites', user_id: ron.id)

r_question_1 = Question.create(text: 'best drink?', poll_id: harry_poll.id)
rq1_answer_1 = AnswerChoice.create(question_id: r_question_1.id, text: 'butterbeer')
rq1_answer_2 = AnswerChoice.create(question_id: r_question_1.id, text: 'pumpkin juice')

response_1 = Response.create(answer_id: hq1_answer_1.id, user_id: ron.id)
response_2 = Response.create(answer_id: hq1_answer_2.id, user_id: hagrid.id)
response_3 = Response.create(answer_id: hq2_answer_1.id, user_id: ginny.id)
response_4 = Response.create(answer_id: hq2_answer_1.id, user_id: dumbledore.id)