FactoryGirl.define do
	factory :user do
		email 								"admin@urlpad.com"
		password 							"India@123!"
		password_confirmation "India@123!"
		initialize_with { User.find_by(email: "admin@urlpad.com")}
	end
end