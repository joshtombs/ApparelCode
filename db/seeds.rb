# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
{
  username: "user1",
  email: "user1@example.com",
  title: "Fashion Blogger",
  age: 21,
  city: "Los Angeles",
  country: "United States",
  password: "password",
  password_confirmation: "password"
},
{
  username: "user2",
  email: "user2@example.com",
  title: "Fashion Blogger",
  age: 26,
  city: "New York",
  country: "United States",
  password: "password",
  password_confirmation: "password"
},
{
  username: "user3",
  email: "user3@example.com",
  title: "Fashion Designer",
  age: 22,
  city: "Town #2",
  country: "United Kingdom",
  password: "password",
  password_confirmation: "password"
},
{
  username: "user4",
  email: "user4@example.com",
  age: 29,
  title: "Fashion Designer",
  city: "The City",
  country: "United Kingdom",
  password: "password",
  password_confirmation: "password"
}
])

Post.create([
{
  name: "post1",
  user_id: 1,
  user_name: "user1",
  description: "wow such good description",
  tags: "tag1, tag2, tag3",
  items: "item1, item2, item3, item4"
},
{
  name: "post2",
  user_id: 2,
  user_name: "user2",
  description: "wow such good description",
  tags: "tag1, tag2, tag3",
  items: "item1, item2, item3, item4"
},
{
  name: "post3",
  user_id: 3,
  user_name: "user3",
  description: "wow such good description",
  tags: "tag1, tag2, tag3",
  items: "item1, item2, item3, item4"
},
{
  name: "post4",
  user_id: 4,
  user_name: "user4",
  description: "wow such good description",
  tags: "tag1, tag2, tag3",
  items: "item1, item2, item3, item4"
},
{
  name: "post4",
  user_id: 4,
  user_name: "user4",
  description: "wow such good description",
  tags: "tag1, tag2, tag3",
  items: "item1, item2, item3, item4"
},
])
