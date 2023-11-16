class List < ApplicationRecord
    belongs_to :user
    #belongs_to :receipt
    
    has_many :list_entries
end
