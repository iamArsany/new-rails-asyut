class User < ApplicationRecord
  validates_presence_of :name, :DOB, :email, :phone_number, :address
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: {
    with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    message: "must be a valid email addresss"
  }
end
