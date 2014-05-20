class CompaniesController < ApplicationController

def list
@companies = Company.search(params[:search]) 
@company = Company.new

end

def show
@company = Company.find(params[:id])
@criteria = CompanyCriterion.where(:company_id => @company.id)
@ids = CompanyCriterion.find(:all,:select => "criterion_id",:conditions=>{:company_id => @company.id}).collect(&:criterion_id)
@subids = CompanySubcriterion.find(:all,:select => "subcriterion_id",:conditions=>{:company_id => @company.id}).collect(&:subcriterion_id)
@companyreq = CompanyRequirement.find(:all,:conditions => {:company_id => @company.id})
@systemreq = SystemRequirement.all
@allsystems = System.all
@types =Type.all
@company = Company.find(params[:id])
@val =""
@reason = ""
@Maximum = false
@drop=false
@reqids = CompanyRequirement.find(:all,:select => "requirement_id",:conditions=>{:company_id => @company.id}).collect(&:requirement_id)
@allsystems.each do |system|
	@companyreq.each do |c|
		@boolean = "No"
	    @systemreq.each do |s|
	    	if(s.system_id == system.id)
	    		if (s.requirement_id == c.requirement_id)
				    if ( c.requirement.type.string == true)
						@boolean = "Yes"
						break
						    	
					else
					    if(c.max == true)
   							if(c.value.to_i >= s.value.to_i)
   								@boolean = "Yes"
								break
   							end
					    else
					    	if(c.max == false)
					    		if(c.value.to_i <= s.value.to_i)
	   								@boolean = "Yes"
									break
   								end	
					    	end
					    end
					end
				end
		    end
	    end
	    if(@boolean == "No")
	    	break
	    end
	end
	if(@boolean == "Yes")
	@exist = "No"
	@all = CompanySystem.all
	@all.each do |a|
		if ((a.company_id == @company.id) && (a.system_id == system.id))
			@exist = "Yes"
			break
		end
	end
	if (@exist == "No")
	  CompanySystem.create(:company_id=>@company.id , :system_id=> system.id)
	end
	end	
end


		@systems  = CompanySystem.find(:all,:conditions => {:company_id => @company.id , :user_id => nil} , :order=>("final_score DESC"))
		@criteria = CompanyCriterion.find(:all,:conditions => {:company_id => @company.id, :system_id=>nil})
		@id = ""
		@button = "No"
        if(params.has_key?(:button))
        @button = "Yes"
		@systems.each do |s|
			systemid = s.system.id
			values = CompanyCriterion.find(:all,:conditions => {:company_id => @company.id, :system_id => systemid , :user_id=> current_user.id})
			if !values.blank?
				#@button = "Yes"
				@totalscore = 0
				values.each do |value|
			     @criteria_weight = value.weight
			     @criteria_value = value.value
			     @criteria_score = @criteria_value* ( (@criteria_weight/100.0))
			     @totalscore = @totalscore + @criteria_score
				end
	


				record = CompanySystem.where(:company_id => @company.id , :system_id=>systemid , :user_id=> current_user.id)
				if !record.blank?
	                r = record.first
	                r.update_attributes(:final_score => @totalscore)
				else
					record = CompanySystem.create(:company_id => @company.id , :system_id=>systemid , :user_id=> current_user.id , :final_score=>@totalscore)
				end
		    end
		end
	    end

		respond_to do |format|
				format.html
				format.pdf do
				pdf = ScorePdf.new(@company , @systems)
				send_data pdf.render, filename: "#{@company.name} scoring.pdf",
                            type: "application/pdf",
                            disposition: "inline"
				end
		end


# if user_signed_in? 
# @edits = CompanyCriterions.find(:all,:conditions => {:company_id => @company.id , :user_id=> current_user.id})
# end



end

def createScore
	@companyid = params[:company_id]

        @list = params[:company_criteria]
		if !@list.nil?
		@list.each do |key, value|
		result = key.split(',') 
		decide = result.first
			if (decide == "reason")
			criteriaid = result.last
			@add = Reason.create(:company_id => @companyid , :criterion_id=>criteriaid , :reason => value , :user_id=> current_user.id)
			else
			systemid = result.first
			criteriaid = result.last
			weight = result[1]
			@add = CompanyCriterion.create(:company_id => @companyid, :weight=>weight, :system_id=>systemid , :criterion_id=>criteriaid, :value => value , :user_id=> current_user.id)
			end
		end
	    end
	    redirect_to(:action => 'show' ,:id=> @companyid , :button=>"Yes")	


end

def updateScore
	@companyid = params[:company_id]

	 @list = params[:company_criteria]
		if !@list.nil?
		@list.each do |key, value|
			result = key.split(',') 
			decide = result.first
			if (decide == "reason")
				criteriaid = result.last
				@find = Reason.find(:all,:conditions=>{:company_id => @companyid , :criterion_id=>criteriaid , :user_id=> current_user.id})
			    res = @find.first
			    if (res.reason.to_s == value)
				else
					res.update_attributes(:reason => value)
				end
			else
				systemid = result.first
				criteriaid = result.last
				weight = result[1]
				@find = CompanyCriterion.find(:all, :conditions=> {:company_id => @companyid , :criterion_id=>criteriaid , :system_id=>systemid, :user_id=> current_user.id})
				res = @find.first

				if (res.value == value)
				else
					res.update_attributes(:value => value)
				end
			end
		end
	    end
	    redirect_to(:action => 'show' ,:id=> @companyid , :button=>"Yes")	
end


	def create
		@company = Company.new(params[:company])
		if @company.save
			flash[:sucess] = "Company Is Added Successfully Please Wait for Confirmation!!"
			if !current_user.blank?
				CompanyUser.create(:company_id => @company.id , :user_id => current_user.id, :role => "admin")
			end
		redirect_to(:action => 'list')
		else 
			render('new')
		end	
	end


	def update 
		@company = Company.find(params[:id])
		if @company.update_attributes(params[:company])
			redirect_to(:action => 'show' , :id => params[:id])
		else 
			render('edit')
		end
	end 

	def destroy 
		Company.find(params[:id]).destroy
      redirect_to(:action => 'list')
	end


	def score
		@company = Company.find(params[:id])	
		@systems  = CompanySystem.find(:all,:conditions => {:company_id => @company.id , :user_id => nil})
		@criteria = CompanyCriterion.find(:all,:conditions => {:company_id => @company.id, :system_id=>nil})
			@id = ""
			@button = "No"
			@systems.each do |s|
				systemid = s.system.id
				values = CompanyCriterion.find(:all,:conditions => {:company_id => @company.id, :system_id => systemid , :user_id=> current_user.id})
				if !values.blank?
					@button = "Yes"
					@totalscore = 0
					values.each do |value|
				     @criteria_weight = value.weight
				     @criteria_value = value.value
				     @criteria_score = @criteria_value* ( (@criteria_weight/100.0))
				     @totalscore = @totalscore + @criteria_score
					end
					@rank = Rank.where(:system_id=> s.system_id)
					if !@rank.blank?
						@rank.each do |r|
							if (Time.now.year.to_s == r.updated_at.year.to_s)
								if (r.rank == 1)
									@totalscore = @totalscore + 10
								else
									if (r.rank == 2)
										@totalscore = @totalscore + 5
									else
										if (r.rank == 3)
											@totalscore = @totalscore + 3
										end
									end
								end
							end
						end	
					end

					record = CompanySystem.where(:company_id => @company.id , :system_id=>systemid , :user_id=> current_user.id)
					if !record.blank?
		                r = record.first
		                r.update_attributes(:final_score => @totalscore)
					else
						record = CompanySystem.create(:company_id => @company.id , :system_id=>systemid , :user_id=> current_user.id , :final_score=>@totalscore)
					end
			    end
			end

		respond_to do |format|
				format.html
				format.pdf do
				pdf = ScorePdf.new(@company , @systems)
				send_data pdf.render, filename: "#{@company.name} scoring.pdf",
                            type: "application/pdf",
                            disposition: "inline"
				end
		end

		#redirect_to(:action => 'show' , :id=> @company.id)
end


	def confirmed
		@confirmids = params[:companies]
		@confirmids.each do|id|
			@record = Company.where(:id => id)
			@record.update_all(:confirm => true)

			redirect_to(:action => 'list')
		end
	end

end
