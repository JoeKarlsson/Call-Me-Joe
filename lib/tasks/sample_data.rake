namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Joe Karlsson AD",
                       email:    "callmejoeadmin@callmejoe.org",
                       password: "l00ph0le",
                       password_confirmation: "l00ph0le",
                       admin: true)

end