class Cobranca < ApplicationRecord
	belongs_to :user
	before_create :set_uuid

	def set_uuid
    	self.id = SecureRandom.uuid
  	end
end
