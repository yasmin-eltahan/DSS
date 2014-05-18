class CompanyCriterionsController < ApplicationController
	def view
		@company = params[:id]
		@co = CompanyCriterion.new
		
	end
	def enter_criteria
		@company = params[:id]
		@co = CompanyCriterion.new
		@subc= CompanySubcriterion.new
		@criteria = params[:criterions_ids]
		@weight = params[:company_criterions]
		@sub = params[:subcriterions_ids]
		@sum = params[:company_criterions][:sum]

		@criteria.each do |c|

			@c = @weight[c.to_s]
		
			@co = CompanyCriterion.new(:company_id => @company , :weight => @c , :criterion_id => c)

			@check = CompanyCriterion.where(:company_id => @company , :criterion_id => c)
			if @check.blank?
				@co.save
			end
		end
		if !@sub.blank?
		@sub.each do |s|
		
			@subc = CompanySubcriterion.new(:company_id => @company, :subcriterion_id => s)
			@check = CompanySubcriterion.where(:company_id => @company , :subcriterion_id => s)
			if @check.blank?
				@subc.save
			end
		end
	end
	if @co.save && @subc.save 
		redirect_to(:controller => 'company_subcriterions' , :action =>'new' , :id=> @company)
	end
	end

	def edit
		@company = params[:id]
		@co = CompanyCriterion.where(:company_id =>@company)
		@ids = CompanyCriterion.find(:all,:select => "criterion_id",:conditions=>{:company_id => @company}).collect(&:criterion_id)
		@subids = CompanySubcriterion.find(:all,:select => "subcriterion_id",:conditions=>{:company_id => @company}).collect(&:subcriterion_id)	
	end

	def edit_criteria
		@v=""
		@company = params[:id]
		@co = CompanyCriterion.where(:company_id =>@company)
		@ids = CompanyCriterion.find(:all,:select => "criterion_id",:conditions=>{:company_id => @company}).collect(&:criterion_id)
		@subids = CompanySubcriterion.find(:all,:select => "subcriterion_id",:conditions=>{:company_id => @company}).collect(&:subcriterion_id)
		@criteria = params[:criterions_ids]
		@sub = params[:subcriterions_ids]
		@weight = params[:company_criterions]
		@sum = params[:company_criterions][:sum]
		@ids.each do|id|
			if @criteria.include?(id.to_s)
				@criteria.each do |c|
				@c = @weight[c.to_s]
				@record = CompanyCriterion.where(:company_id => @company , :criterion_id => c)
				if @record.blank?
				CompanyCriterion.create(:company_id => @company , :weight => @c , :criterion_id => c)
				else
				@record.update_all(:company_id => @company , :weight => @c , :criterion_id => c)
				end
			end		
			else
				@record = CompanyCriterion.where(:company_id => @company , :criterion_id => id).destroy_all
			
		end
	end
	@subids.each do|id|
			if @sub.include?(id.to_s)
				@sub.each do |s|
				@record = CompanySubcriterion.where(:company_id => @company , :subcriterion_id => s)
				if @record.blank?
				CompanySubcriterion.create(:company_id => @company , :subcriterion_id => s)
				else
				@record.update_all(:company_id => @company , :subcriterion_id => s)
				end
			end		
			else
				@record = CompanySubcriterion.where(:company_id => @company , :subcriterion_id => id).destroy_all
			
		end
	end
		redirect_to(:controller => 'company_subcriterions' , :action =>'edit' , :id=> @company)
	end

	
	
end
