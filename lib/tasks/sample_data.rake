namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_tables
  end
end

namespace :db do
  desc "Fill databae with columns data"
  task popucolumns: :environment do
    make_columns
  end
end

def make_users
  admin = User.create!(name: "Example User",
                       email: "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end

def make_tables
  50.times do |n|
    name = Faker::Name.first_name
    cname = Faker::Name.last_name
    file = Faker::Name.prefix
    ptk = Faker::Name.suffix
    Table.create!(name: name,
                  cname: cname,
                  file: file,
                  ptk: ptk)
  end
end

def make_columns
  tables = Table.all(limit: 6)
  5.times do
    name = Faker::Name.first_name
    cname = Faker::Name.last_name
    dtype = Faker::Name.prefix
    null_ind = true
    pk = Faker::Name.suffix
    note = Faker::Lorem.sentence(5)
    tables.each { |user| user.columns.create!(name: name,
                                              cname: cname,
                                              dtype: dtype,
                                              null_ind: null_ind,
                                              pk: pk,
                                              note: note) }
  end
end
