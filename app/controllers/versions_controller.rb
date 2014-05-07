class VersionsController < ApplicationController
	def create 
		@system = params[:id]
		@version = Version.new(params[:version])
		if @version.save
		redirect_to(:controller => 'systems' , :action => 'show' , :id => @system)
		end	
	end 

	def update 
		@version = Version.find(params[:id])
		if @version.update_attributes(params[:version])
			redirect_to(:controller => 'systems' , :action => 'show' , :id => @version.system.id)
		end

	end 

	def destroy 
		Version.find(params[:id]).destroy
	end
end
