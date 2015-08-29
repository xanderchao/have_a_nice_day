class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  validation_presence_of :text
end
