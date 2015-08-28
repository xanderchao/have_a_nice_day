class User < ActiveRecord::Base
  has_many :surveys, foreign_key: "creator_id", class_name: "Survey"
  has_many :rounds

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, clear_text_pw)
    user = User.find_by(email: email)
    if user && user.password == clear_text_pw
      return true
    else
      nil
    end
  end


end
