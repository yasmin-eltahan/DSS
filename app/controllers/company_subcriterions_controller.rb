class CompanySubcriterionsController < ApplicationController

	def new
		@v =""
		@company = params[:id]
		@criteria = CompanyCriterion.where(:company_id => @company, :system_id=>nil)
		@subcriteria = CompanySubcriterion.where(:company_id => @company)
		@subids = CompanySubcriterion.find(:all,:select => "subcriterion_id",:conditions=>{:company_id => @company}).collect(&:subcriterion_id)
	end


	def create
		@company = params[:id]
		@weight= params[:company_subcriterions]
		@sub = params[:subcriterions_ids]
		if !@sub.blank?
		@sub.each do |s|
			@c = @weight[s.to_s]
			@subc = CompanySubcriterion.new(:company_id => @company, :subcriterion_id => s, :weight=>@c)
			@check = CompanySubcriterion.where(:company_id => @company , :subcriterion_id => s)
			if @check.blank?
				@subc.save
			end
		end
	end

		redirect_to(:controller =>"companies", :action =>'show', :id => @company)
	end

	def edit
		@v =""
		@company = params[:id]
		@subids = CompanySubcriterion.find(:all,:select => "subcriterion_id",:conditions=>{:company_id => @company}).collect(&:subcriterion_id)
		@criteria = CompanyCriterion.where(:company_id => @company ,  :system_id=>nil)
		@subcriteria = CompanySubcriterion.where(:company_id => @company)
	end
	def update
		@company = params[:id]
		@weight= params[:company_subcriterions]
		@sub = params[:subcriterions_ids]
		@subids = CompanySubcriterion.find(:all,:select => "subcriterion_id",:conditions=>{:company_id => @company}).collect(&:subcriterion_id)
	@subids.each do|id|
			if @sub.include?(id.to_s)
				@sub.each do |s|
					@c = @weight[s.to_s]
				@record = CompanySubcriterion.where(:company_id => @company , :subcriterion_id => s)
				if @record.blank?
				CompanySubcriterion.create(:company_id => @company , :subcriterion_id => s, :weight => @c)
				else
				@record.update_all(:company_id => @company , :subcriterion_id => s, :weight => @c)
				end
			end		
			else
				@record = CompanySubcriterion.where(:company_id => @company , :subcriterion_id => id).destroy_all
			
		end
	end
	redirect_to(:controller =>"companies", :action =>'show', :id => @company)
end

end
