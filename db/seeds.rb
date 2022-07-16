# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

USERS = 3
POSTS_PER_USER = 100
COMMENTS_PER_POST = 10

if User.count != 0
  abort 'already exists'
end

USERS.times do |u|
  user = User.find_or_create_by!(name: "user_#{u}")
  POSTS_PER_USER.times do |p|
    post = user.posts.create!(title: "#{u}_#{p}", body: "hello")
    COMMENTS_PER_POST.times do |c|
      post.comments.create!(body: c.to_s, created_by: user)
    end
  end
end
