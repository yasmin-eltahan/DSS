class CompanyUsersController < ApplicationController

	def create
		@company = params[:id]
		@users = params[:company_user][:user]
		@role = params[:company_user][:role]
		@user = User.find_by_email(@users.to_s)
		if !@user.blank?
			CompanyUsers.create(:company_id => @company, :user_id => @user.id , :role => @role)
		else
			flash[:notice] = "User Was NOT Added Email Entered Incorrectly."
		end 
		redirect_to(:controller => 'companies' , :action =>'show' , :id=> @company)
	end

	def destroy
		@company = params[:company]
		CompanyUsers.find(params[:id]).destroy
		redirect_to(:controller => 'companies' , :action =>'show' , :id=> @company)
	end
end
