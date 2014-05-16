class CompaniesController < ApplicationController

def list
@companies = Company.search(params[:search]) 
@company = Company.new

end

def show
@company = Company.find(params[:id])
@criteria = CompanyCriterions.where(:company_id => @company.id)
@ids = CompanyCriterions.find(:all,:select => "criterion_id",:conditions=>{:company_id => @company.id}).collect(&:criterion_id)
@subids = CompanySubcriterions.find(:all,:select => "subcriterion_id",:conditions=>{:company_id => @company.id}).collect(&:subcriterion_id)
@companyreq = CompanyRequirement.find(:all,:conditions => {:company_id => @company.id})
@systemreq = SystemRequirement.all
@allsystems = System.all
@types =Type.all
@company = Company.find(params[:id])
@val =""
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


@systems  = CompanySystem.find(:all,:conditions => {:company_id => @company.id})
@criteria = CompanyCriterions.find(:all,:conditions => {:company_id => @company.id, :system_id=>nil})
@id = ""
@button = "No"

@systems.each do |s|
	systemid = s.system.id
	values = CompanyCriterions.find(:all,:conditions => {:company_id => @company.id, :system_id => systemid})
	if !values.blank?
		@button = "Yes"
		@totalscore = 0
		values.each do |value|
	     @criteria_weight = value.weight
	     @criteria_value = value.value
	     @criteria_score = @criteria_weight*@criteria_value
	     @totalscore = @totalscore + @criteria_score
		end
		record = CompanySystem.where(:company_id => @company.id , :system_id=>systemid)
		record.each do |r|
		r.update_attributes(:final_score=> @totalscore)
	    end
    end
end



@systems  = CompanySystem.find(:all,:conditions => {:company_id => @company.id} , :order=>("final_score DESC"))
@edits = CompanyCriterions.find(:all,:conditions => ['system_id is not null and company_id = ?',  @company.id])




end

def createScore
	@companyid = params[:company_id]

        @list = params[:company_criteria]
		if !@list.nil?
		@list.each do |key, value|
		result = key.split(',') 
		systemid = result.first
		criteriaid = result.last
		weight = result[1]
		@add = CompanyCriterions.create(:company_id => @companyid, :weight=>weight, :system_id=>systemid , :criterion_id=>criteriaid, :value => value)
		end
	    end
	    redirect_to(:action => 'show' ,:id=> @companyid)	


end

def updateScore
	@companyid = params[:company_id]

	 @list = params[:company_criteria]
		if !@list.nil?
		@list.each do |key, value|
		result = key.split(',') 
		systemid = result.first
		criteriaid = result.last
		weight = result[1]
		@find = CompanyCriterions.find(:all, :conditions=> {:company_id => @companyid , :criterion_id=>criteriaid , :system_id=>systemid})
		res = @find.first
		if (res.value == value)
		else
			res.update_attributes(:value => value)
		end

		end
	    end
	    redirect_to(:action => 'show' ,:id=> @companyid)	


end


	def create
		@company = Company.new(params[:company])
		if @company.save
			if !current_user.blank?
				CompanyUsers.create(:company_id => @company.id , :user_id => current_user.id, :role => "admin")
			end
		redirect_to(:action => 'show' , :id => @company.id)
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

	def confirm
		@companies = Company.where(:confirm => false)
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
