class CompanyRequirementsController < ApplicationController
def new
	@types = Type.all
	@new = CompanyRequirement.new
	@company = Company.find(params[:id])
	@reqids = CompanyRequirement.find(:all,:select => "requirement_id",:conditions=>{:company_id => @company.id}).collect(&:requirement_id)
end 

def create
	@company = Company.find(params[:id])
	@comreq = CompanyRequirement.new
	@req = params[:requirements_ids]
	@value = params[:company_requirement]
	@max = params[:requirement_id]
	@reqids = CompanyRequirement.find(:all,:select => "requirement_id",:conditions=>{:company_id => @company.id}).collect(&:requirement_id)
if !@req.blank?
@req.each do |r|
	@m = @max[r.to_s]
	@v = @value[r.to_s]
	if !@reqids.blank?
		@record = CompanyRequirement.where(:company_id => @company.id , :requirement_id => r)
		if @record.blank?
			if @m.blank? && @v.blank?
			@comreq = CompanyRequirement.create(:company_id => @company.id , :requirement_id => r)
			else
			@comreq = CompanyRequirement.create(:company_id => @company.id , :requirement_id => r , :max => @m , :value =>@v)
		end
		end
else 
	if @m.blank? && @v.blank?
			@comreq = CompanyRequirement.create(:company_id => @company.id , :requirement_id => r)
			else
			@comreq = CompanyRequirement.create(:company_id => @company.id , :requirement_id => r , :max => @m , :value =>@v)
		end
end
end
end
redirect_to(:controller => 'companies' , :action=> 'show' , :id => @company.id)
end

def edit
@types =Type.all
@company = Company.find(params[:id])
@val =""
@Maximum = false
@drop=false
@reqids = CompanyRequirement.find(:all,:select => "requirement_id",:conditions=>{:company_id => @company.id}).collect(&:requirement_id)
end	

def update
	@company = Company.find(params[:id])
	@comreq = CompanyRequirement.new
	@req = params[:requirements_ids]
	@value = params[:company_requirement]
	@max = params[:requirement_id]
	@reqids = CompanyRequirement.find(:all,:select => "requirement_id",:conditions=>{:company_id => @company.id}).collect(&:requirement_id)
if !@req.blank?
	@reqids.each do |id|
		if @req.include?(id.to_s)
			@req.each do |r|
				@v = @value[r.to_s]
				@m = @max[r.to_s]
				@record = CompanyRequirement.where(:company_id=>@company.id , :requirement_id=>r)
				@pre_m = @record.max
				if @record.blank?
					if @m.blank? && @v.blank?
						@record = CompanyRequirement.create(:company_id => @company.id, :requirement_id => r)
					else
						@record = CompanyRequirement.create(:company_id => @company.id, :requirement_id => r , :max => @m , :value =>@v)
					end	
				else
					if @m.blank? && @v.blank?
						@record.update_all(:company_id => @company.id , :requirement_id => r)
					else
						if @m.blank? && !@v.blank?	
						@record.update_all(:company_id => @company.id , :requirement_id => r , :value => @v)
						else
						@record.update_all(:company_id => @company.id , :requirement_id => r , :max => @m , :value => @v)
						end
					end
				end
			end
		else
			@record = CompanyRequirement.where(:company_id=> @company.id , :requirement_id => id).destroy_all
		end
	end
	else
		@record = CompanyRequirement.where(:company_id=> @company.id).destroy_all
end
 redirect_to(:controller => 'companies' , :action=> 'show' , :id => @company.id)
end


end
