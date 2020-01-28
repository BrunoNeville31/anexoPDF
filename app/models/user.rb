class User < ApplicationRecord
	has_many :cobranca
	before_create :set_uuid



	def set_uuid
    	self.id = SecureRandom.uuid
  	end
end
