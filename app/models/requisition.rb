class Requisition < ActiveRecord::Base
  belongs_to :profile
  has_many :personal_references
end
