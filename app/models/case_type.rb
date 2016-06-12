class CaseType < ActiveRecord::Base

	acts_as_tree order: "name" 

	has_many :cases, :foreign_key => "type_id"

	def self.root 
		CaseType.find_by(name: 'root')
	end

end