class CompanyCriteriaController < ApplicationController
	def view
		@company = params[:id]
		@co = CompanyCriteria.new
		
	end
	def enter_criteria
		@company = params[:id]
		@co = CompanyCriteria.new
		@subc= CompanySubcriteria.new
		@criteria = params[:criteria_ids]
		@weight = params[:company_criteria]
		@sub = params[:subcriteria_ids]
		@sum = params[:company_criteria][:sum]
		@criteria.each do |c|

			@c = @weight[c.to_s]
		
			@co = CompanyCriteria.new(:company_id => @company , :weight => @c , :criteria_id => c)

			@check = CompanyCriteria.where(:company_id => @company , :criteria_id => c)
			if @check.blank?
				@co.save
			end
		end
		if !@sub.blank?
		@sub.each do |s|
		
			@subc = CompanySubcriteria.new(:company_id => @company, :subcriteria_id => s)
			@check = CompanySubcriteria.where(:company_id => @company , :subcriteria_id => s)
			if @check.blank?
				@subc.save
			end
		end
	end
	if @co.save && @subc.save 
		redirect_to(:controller => 'companies' , :action =>'show' , :id=> @company)
	end
	end

	def edit
		@company = params[:id]
		@co = CompanyCriteria.where(:company_id =>@company)
		@ids = CompanyCriteria.find(:all,:select => "criteria_id",:conditions=>{:company_id => @company}).collect(&:criteria_id)
		@subids = CompanySubcriteria.find(:all,:select => "subcriteria_id",:conditions=>{:company_id => @company}).collect(&:subcriteria_id)	
	end

	def edit_criteria
		@v=""
		@company = params[:id]
		@co = CompanyCriteria.where(:company_id =>@company)
		@ids = CompanyCriteria.find(:all,:select => "criteria_id",:conditions=>{:company_id => @company}).collect(&:criteria_id)
		@subids = CompanySubcriteria.find(:all,:select => "subcriteria_id",:conditions=>{:company_id => @company}).collect(&:subcriteria_id)
		@criteria = params[:criteria_ids]
		@sub = params[:subcriteria_ids]
		@weight = params[:company_criteria]
		@sum = params[:company_criteria][:sum]
		@ids.each do|id|
			if @criteria.include?(id.to_s)
				@criteria.each do |c|
				@c = @weight[c.to_s]
				@record = CompanyCriteria.where(:company_id => @company , :criteria_id => c)
				if @record.blank?
				CompanyCriteria.create(:company_id => @company , :weight => @c , :criteria_id => c)
				else
				@record.update_all(:company_id => @company , :weight => @c , :criteria_id => c)
				end
			end		
			else
				@record = CompanyCriteria.where(:company_id => @company , :criteria_id => id).destroy_all
			
		end
	end
	@subids.each do|id|
			if @sub.include?(id.to_s)
				@sub.each do |s|
				@record = CompanySubcriteria.where(:company_id => @company , :subcriteria_id => s)
				if @record.blank?
				CompanySubcriteria.create(:company_id => @company , :subcriteria_id => s)
				else
				@record.update_all(:company_id => @company , :subcriteria_id => s)
				end
			end		
			else
				@record = CompanySubcriteria.where(:company_id => @company , :subcriteria_id => id).destroy_all
			
		end
	end
		redirect_to(:controller => 'companies' , :action =>'show' , :id=> @company)
	end
	
end
