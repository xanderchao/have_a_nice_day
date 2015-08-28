class User < ActiveRecord::Base
  has_many :surveys, foreign_key: "creator_id", class_name: "Survey"
  has_many :rounds


end
