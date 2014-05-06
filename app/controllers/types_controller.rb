class TypesController < ApplicationController

	def new
		@type = Type.new
  		3.times { @type.requirements.build }
	end

	def create
	end
end
