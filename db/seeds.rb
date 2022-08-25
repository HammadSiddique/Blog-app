# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding..."

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0)

post1 = Post.create(user: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
post2 = Post.create(user: first_user, title: 'World', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
post3 = Post.create(user: first_user, title: 'Coding', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
post4 = Post.create(user: second_user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
post5 = Post.create(user: second_user, title: 'World', text: 'This is my second post', comments_counter: 0, likes_counter: 0)


Comment.create(post: post1, user: second_user, text: 'Hi Tom!' )
Comment.create(post: post1, user: second_user, text: 'Amazing!' )
Comment.create(post: post1, user: second_user, text: 'Thank you for this information!' )
Comment.create(post: post2, user: second_user, text: 'Hi Tom!' )
Comment.create(post: post2, user: second_user, text: 'That is cool' )
Comment.create(post: post4, user: first_user, text: 'Hi Lilly!' )
Comment.create(post: post4, user: first_user, text: 'Great' )
Comment.create(post: post4, user: first_user, text: 'Wow, that is astonishing' )
Comment.create(post: post5, user: first_user, text: 'Hi Lilly!' )
Comment.create(post: post5, user: first_user, text: 'That is amazing!' )


puts "Seeding done."