class SystemRequirementsController < ApplicationController
	def new
	@types = Type.all
	@new = SystemRequirement.new
	@system = System.find(params[:id])
	@reqids = SystemRequirement.find(:all,:select => "requirement_id",:conditions=>{:system_id => @system.id}).collect(&:requirement_id)
end 

def create
	@system = System.find(params[:id])
	@systemreq = SystemRequirement.new
	@req = params[:requirements_ids]
	@value = params[:system_requirement]
	@max = params[:requirement_id]
	@reqids = SystemRequirement.find(:all,:select => "requirement_id",:conditions=>{:system_id => @system.id}).collect(&:requirement_id)
if !@req.blank?
@req.each do |r|
	@m = @max[r.to_s]
	@v = @value[r.to_s]
	if !@reqids.blank?
		@record = SystemRequirement.where(:system_id => @system.id , :requirement_id => r)
		if @record.blank?
			if @m.blank? && @v.blank?
			@systemreq = SystemRequirement.create(:system_id => @system.id , :requirement_id => r)
			else
			@systemreq = SystemRequirement.create(:system_id => @system.id , :requirement_id => r , :max => @m , :value =>@v)
		end
		end
else 
	if @m.blank? && @v.blank?
			@systemreq = SystemRequirement.create(:system_id => @system.id , :requirement_id => r)
			else
			@systemreq = SystemRequirement.create(:system_id => @system.id , :requirement_id => r , :max => @m , :value =>@v)
		end
end
end
end
redirect_to(:controller => 'systems' , :action=> 'show' , :id => @system.id)
end

def edit
@types =Type.all
@system = System.find(params[:id])
@val =""
@Maximum = false
@drop=false
@reqids = SystemRequirement.find(:all,:select => "requirement_id",:conditions=>{:system_id => @system.id}).collect(&:requirement_id)
end	

def update
	@system = System.find(params[:id])
	@systemreq = SystemRequirement.new
	@req = params[:requirements_ids]
	@value = params[:system_requirement]
	@max = params[:requirement_id]
	@reqids = SystemRequirement.find(:all,:select => "requirement_id",:conditions=>{:system_id => @system.id}).collect(&:requirement_id)
if !@req.blank?
	@reqids.each do |id|
		if @req.include?(id.to_s)
			@req.each do |r|
				@v = @value[r.to_s]
				@m = @max[r.to_s]
				@record = SystemRequirement.where(:system_id=>@system.id , :requirement_id=>r)
				@pre_m = @record.max
				if @record.blank?
					if @m.blank? && @v.blank?
						@record = SystemRequirement.create(:system_id => @system.id, :requirement_id => r)
					else
						@record = SystemRequirement.create(:system_id => @system.id, :requirement_id => r , :max => @m , :value =>@v)
					end	
				else
					if @m.blank? && @v.blank?
						@record.update_all(:system_id => @system.id , :requirement_id => r)
					else
						if @m.blank? && !@v.blank?	
						@record.update_all(:system_id => @system.id , :requirement_id => r , :value => @v)
						else
						@record.update_all(:system_id => @system.id , :requirement_id => r , :max => @m , :value => @v)
						end
					end
				end
			end
		else
			@record = SystemRequirement.where(:system_id=> @system.id , :requirement_id => id).destroy_all
		end
	end
end
 redirect_to(:controller => 'systems' , :action=> 'show' , :id => @system.id)
end
end
