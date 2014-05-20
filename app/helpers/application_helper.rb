module ApplicationHelper

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end	


  def top_software
	require 'rubygems'
    require 'nokogiri'
    require 'open-uri' 

 	url = "http://www.businesscomputingworld.co.uk/the-top-5-erp-software-systems/"
    doc = Nokogiri::HTML(open(url)) 
  
    @count = 1
      doc.css("h2"). each do |item|
      @name = item.text
      @name = @name.gsub(" " , "-")
      @system = System.find_by_name(@name)
      if !@system.blank?
        @new = Rank.new(:rank => @count , :system_id => @system.id , :source => url)
      @ranks = Rank.all
      if !@ranks.blank?
        @flag = "false"      
        @ranks.each do |rank|
          if (rank.rank == @new.rank) && (rank.system_id == @new.system_id) && (Time.now.year.to_s == rank.updated_at.year.to_s)
          @flag = "true"
            break
          end
        end
        if (@flag.to_s == "false")
          @new.save
        end
      else
        @new.save
      end
        @count = @count+1
      end
end
@ran = Rank.where(:vendor_id => nil).order("ranks.rank")
end

def top_vendors
  require 'rubygems'
    require 'nokogiri'
    require 'open-uri' 

  url = "http://itlyderis.wordpress.com/2013/02/14/from-magic-quadrant-to-top-10-erp-vendors-360-erp-blog/"
    doc = Nokogiri::HTML(open(url)) 
  
    @count = 1
      doc.css("#wp-table-reloaded-id-31-no-1 td.column-1"). each do |item|
      @name = item.text
      @vendor= Vendor.find_by_name(@name)
      if @vendor.blank?
        @vendor = Vendor.create(:name => @name)
      end
      @new = Rank.new(:rank => @count , :vendor_id => @vendor.id , :source => url)
      @ranks = Rank.all
      if !@ranks.blank?
        @flag = "false"      
        @ranks.each do |rank|
          if (rank.rank == @new.rank) && (rank.vendor_id == @new.vendor_id) && (Time.now.year.to_s == rank.updated_at.year.to_s)
          @flag = "true"
            break
          end
        end
        if (@flag.to_s == "false")
          @new.save
        end
      else
        @new.save
      end
      @count = @count+1
end
 @rank =  Rank.where(:system_id => nil).order("ranks.rank")
 
end 

  
end
