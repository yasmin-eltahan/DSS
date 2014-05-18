class ScorePdf < Prawn::Document
	include ActionView::Helpers::NumberHelper
	def initialize (company, systems)
		super(top_margin: 70)
		@company = company
		@systems = systems
		
		text "Company #{@company.name}" , size: 30, style: :bold
	#	@company = company
	    #text "Order \##{@order.order_number}", size: 30, style: :bold
	    company_description
	    company_req
	    company_criteria
		system_list
		reviews_list
	end
	def company_description
		move_down 10
		text "Description" , style: :bold
		text "#{@company.description} Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." , align: :justify

	end

	def company_req
		  move_down 20
		  text "Recommendations" , style: :bold
		  @req = CompanyRequirement.find(:all,:conditions=>{:company_id => @company.id})
          @types = Type.all 
           @types.each do |type|
          		@boolean = "No" 
          		@req.each do |r|
            		 if (r.requirement.type_id == type.id) 
                		if (@boolean == "No")
                		 	move_down 6 
							text "#{type.name}" , style: :bold 
	                        text "#{type.description} Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
	                		indent(10) do
	                			move_down 3 
	                			text "#{type.name} Requirements:" , style: :bold
							 end
                  			@boolean = "Yes" 
                		end
		                if (r.requirement.type.string == true)
		                	indent(10) do
		                	text "#{ r.requirement.name }"
		                	end
		                else
		                 text "#{r.requirement.name }: #{r.value }"
			                  # if (r.max == true) 
			                  # Max. 
			                  # else
			                  #  Min. 
			                  # end
		                end
              
            		end
         		 end
        	end
		
	end

	def company_criteria
		move_down 20
		text "Criteria" , style: :bold
		move_down 6 
		@criteria = CompanyCriterion.find(:all,:conditions => {:company_id => @company.id, :system_id=>nil})
		@subids = CompanySubcriterion.find(:all,:select => "subcriterion_id",:conditions=>{:company_id => @company.id}).collect(&:subcriterion_id)
	    @criteria.each do |criteria|  
        	text "#{criteria.criterion.name}   #{criteria.weight}%"  , style: :bold
            text "#{criteria.criterion.description} Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua"
      		@cid = Subcriterion.where(:criterion_id => criteria.criterion.id) 
      		indent(10) do
      		#if !@subids.blank?
    		text "Sub-Criteria Chosen:"  , style: :bold , size: 10
    		end
    		#end
     		@cid.each do |s|
	      		if @subids.include?(s.id)
		      		indent(10) do
		      		text "#{s.name}" , size: 10
		      		end
      			end
      		end
      		@reason = Reason.find(:all, :conditions =>{:company_id=> @company.id , :criterion_id=> criteria.criterion_id})
      		move_down 6
      		text "Consutant opinion:"
      		move_down 3 
      		widths = [100,400]
      		indent(10) do
      			table([["Name", "Opinion"]], :column_widths => widths)
	      		@reason.map do |r|
	      		if !(r.reason.to_s == "" )
	      			table([[make_cell(:content => "#{r.user.username}") , make_cell(:content => "#{r.reason}")]], :column_widths => widths)
	      			#text "#{r.user.username}" , style: :bold , size: 12
	      			#text "#{r.reason}" , size: 12
	      			#move_down 6 
	      		end
	      		end
	      		move_down 6
      		end
      		move_down 6
      	end	
	end


   def system_list
   	    move_down 20
		text "Score" , style: :bold
        move_down 6
		systems = CompanySystem.find(:all,:conditions => {:company_id => @company.id , :user_id => nil}) 
    	systems.each do |s|
	        text "#{s.system.name}" , style: :bold 
	        move_down 10
	        text "System Requirements:" , style: :bold 
	        move_down 6
            @req = SystemRequirement.find(:all,:conditions=>{:system_id => s.system_id}) 
            @types = Type.all 
            @types.each do |type| 
           		@boolean = "No" 
            	@req.each do |r|
                	if (r.requirement.type_id == type.id)
              		if (@boolean == "No") 	
               		text "- #{type.name}" , style: :bold
               		move_down 6
                	@boolean = "Yes" 
              		end
              		if (r.requirement.type.string == true)
             		indent(20) do
		                text "#{ r.requirement.name }"
		            end
              		else
              		text "#{r.requirement.name} #{r.value}" 
              		#if (r.max == true) 
              		#Max.
              		# else
              		# Min.
              		# end
              		end
            	end
          	end
        end
        	indent(290) do
	        	finalscore = CompanySystem.find(:all,:conditions => ['user_id is not null and company_id = ? and system_id = ?',  @company.id , s.system_id]) 
		        int = 0 
		        finalscore.each do |f| 
		            int = int + f.final_score
		        end
		        i = int / finalscore.size  
	 			text "Score: #{number_with_precision(i ,:precision => 2)}" 
 			end 
 			move_down 10
            widths = [150,100,100]
            table([["Criteria", "weight", "Value"]], :column_widths => widths)
	        criteria = CompanyCriterion.find(:all,:conditions => {:company_id => @company.id, :system_id=>nil})    
	        criteria.map do |c|
	            getaverage = CompanyCriterion.find(:all,:conditions => {:company_id => @company.id , :system_id => s.system_id , :criterion_id => c.criterion_id}) 
	            average = 0
	            getaverage.each do |av| 
	                average = average + av.value 
	            end
	            final = average/ getaverage.size 
	            # text "Weight: #{c.weight}" 
	            # text "Value: #{final }"
	            table([[make_cell(:content => "#{c.criterion.name}") , make_cell(:content => "#{c.weight}%"), make_cell(:content => "#{number_with_precision(final ,:precision => 2)}")]], :column_widths => widths)
	        end 
	        move_down 20  
	       
        end
    end

    def reviews_list
    	move_down 20
		text "Appendix" , style: :bold
		move_down 10
    	systems = CompanySystem.find(:all,:conditions => {:company_id => @company.id , :user_id => nil}) 
    	systems.each do |s|
    		text "#{s.system.name}" , style: :bold 
    		reviews = Review.find(:all,:conditions=>{:system_id => s.system_id})
    		reviews.each do |r|
            	text "#{r.reviewer}"
            	text "#{r.review}" , align: :justify
            	text "#{r.review2}" , align: :justify
            	text "#{r.review3}" , align: :justify
            	move_down 6
    		end
            move_down 4
    	end
    	
    end


	
end