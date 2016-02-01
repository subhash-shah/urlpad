class DashboardController < ApplicationController
	before_action :load_all_tags, only: [:index]

	def index
	end
end
