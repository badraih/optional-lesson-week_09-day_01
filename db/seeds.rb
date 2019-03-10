# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all

questions = [
  {text: "what did you eat last night ?"},
  {text: "How are you ?"},
  {text: "Are you exited ?"}
]

questions.each do |question| 
 q = Question.new(question)
 q.save!
 Answer.create({ text: "this is an answer" , question_id: q.id })
 Answer.create({ text: "this is a second answer" , question_id: q.id })
 Answer.create({ text: "this is a third answer" , question_id: q.id })
end 