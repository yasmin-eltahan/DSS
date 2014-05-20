class CompanyCriterionsController < ApplicationController
	def view
		@company = params[:id]
		@co = CompanyCriterion.new
		
	end
	def enter_criteria
		@company = params[:id]
		@co = CompanyCriterion.new
		@criteria = params[:criterions_ids]
		@weight = params[:company_criterions]
		@sum = params[:company_criterions][:sum]

		@criteria.each do |c|

			@c = @weight[c.to_s]
		
			@co = CompanyCriterion.new(:company_id => @company , :weight => @c , :criterion_id => c)

			@check = CompanyCriterion.where(:company_id => @company , :criterion_id => c)
			if @check.blank?
				@co.save
			end
		end
	if @co.save 
		redirect_to(:controller => 'company_subcriterions' , :action =>'new' , :id=> @company)
	end
	end

	def edit
		@company = params[:id]
		@co = CompanyCriterion.where(:company_id =>@company)
		@ids = CompanyCriterion.find(:all,:select => "criterion_id",:conditions=>{:company_id => @company}).collect(&:criterion_id)
			
	end

	def edit_criteria
		@v=""
		@company = params[:id]
		@co = CompanyCriterion.where(:company_id =>@company)
		@ids = CompanyCriterion.find(:all,:select => "criterion_id",:conditions=>{:company_id => @company}).collect(&:criterion_id)
		@criteria = params[:criterions_ids]
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
	
		redirect_to(:controller => 'company_subcriterions' , :action =>'edit' , :id=> @company)
	end

	
	
end
