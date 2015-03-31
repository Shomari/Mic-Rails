module Api
	module V1
		class SessionsController < ApplicationController
			respond_to :json

			def index
				respond_with Session.all
			end

			def create
			end

		end
	end
end