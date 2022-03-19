class Contact < ApplicationRecord
  validates :name, :phone_number, :email, :message, presence: true
end
