class TypesController < ApplicationController

	def new
# 	<div style="margin-top:100px;margin-left:100px;">
# 	<%= form_for(:type, :url=>{:controller => 'types' , :action=>'create'}) do |f| %>
# 	    <% @typecount = "1"%>
# 	    <% @name = "type" + "," + @typecount %>
# 		<%= f.label("Type") %>
# 		<%= f.text_field(@name ,:placeholder=>"eg. Database")%><span id="options"> <%= link_to("specify options","#") %></span>
# 		<br>
# 		<div id="req-div" style="display:none;margin-left:20px;">
# 			<% @number = 1 %>
# 			<% @reqcount = @number.to_s %>
# 			<% @req = "req" + "," + @typecount + "," + @reqcount %>
# 			<%= f.text_field(@req ,:placeholder=>"eg. sqllite")%><br>
# 			<% @number = @number+1 %>
# 			<% @reqcount = @number.to_s %>
# 			<% @req = "req" + "," + @typecount + "," + @reqcount %>
# 			<%= f.text_field(@req ,:placeholder=>"eg. My SQL")%> <%= link_to(" more..","#") %>		
# 		</div>
# 		<%= f.submit("submit") %>
# 	<% end %>
# </div>
    @type = Type.new
    3.times { @type.requirements.build }
    @types = Type.search(params[:search])
    #@types = Type.all

    @typecount=""
    @reqcount=""
    @name=""
    @req=""
    @number=0
   # @edit = Type.find(23)


	end

	def create
		@type = Type.new(params[:type])
		if @type.save
		redirect_to(:action => 'new')
		else 
			render('new')
		end	
		# @typeid=""
  #       @list = params[:type]
		# if !@list.nil?
		# @list.each do |key, value|
		# result = key.split(',') 
		# type = result.first
		# count = result.last
		# 	if (type.to_s == "type")
		# 	@add = Type.create(:name=> value)
		# 	@typeid = Type.find_by_name(value).id
		# 	else
		# 	@add = Requirement.create(:type_id => @typeid, :name => value)
		# 	end
		# end
	 #    end
	 #    redirect_to(:action => 'new')	

	 #<a href="#myeditModal" role="button"  data-toggle="modal"><b>edit</b></a>	
	end

	  def update
	    @type = Type.find(params[:id])
	    if @type.update_attributes(params[:type])
	     redirect_to(:action => 'new' , :notice => "Successfully updated survey." )
	    else
	      redirect_to(:action => 'new')
	    end
	  end

	  def destroy 
		Type.find(params[:id]).destroy
        redirect_to(:action => 'new')
	   end


	  # def destroy
	  #   @survey = Survey.find(params[:id])
	  #   @survey.destroy
	  #   redirect_to surveys_url, notice: "Successfully destroyed survey."
	  # end

end
