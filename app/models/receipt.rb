class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :business

  has_many :lists
  has_many :list_entries

  has_one_attached :image
end
