class UsersController < ApplicationController

	def user_params
	    params.require(:user).permit(:country, :gender, :age, :profile_name)
	end
end
