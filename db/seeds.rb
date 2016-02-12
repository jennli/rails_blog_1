# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Music", "Travel", "Work", "Education", "Programming", "Movies", "Romance","Family","Random","Books"].each { |x| Category.create(title: x)}

Post.all.each do |p|
  p.update category_id: rand(10)+1
end
