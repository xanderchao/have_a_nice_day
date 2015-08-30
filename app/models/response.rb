class Response < ActiveRecord::Base
  belongs_to :choice
  belongs_to :round
  has_one :question, :through => :choice
end
