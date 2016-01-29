# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.new
admin.email = "admin@urlpad.com"
admin.password = "India@123!"
admin.password_confirmation = "India@123!"
admin.save!
Link.where(user_id: nil).update_all(user_id: admin.id)