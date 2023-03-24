class Customer < ApplicationRecord
  validates :name, :contact_number, presence: true
  validates :email, presence: true, uniqueness: true 
end
