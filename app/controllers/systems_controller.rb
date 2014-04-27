class SystemsController < ApplicationController

	def create 
		@vendor = params[:id]
		@system = System.new(params[:system])
		if @system.save
		@vr = System.find(@system.id)
		@ven = @vr.name.strip
		@v = @ven.gsub(" " , "-")
		@vr.update_attribute(:name, @v)
		redirect_to(:controller => 'vendors' , :action => 'show' , :id => @vendor)
		else 
			render('new')
		end	
	end 
end
