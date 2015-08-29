class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validation_presence_of :text
end
