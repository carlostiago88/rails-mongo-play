class Doctor
  include Mongoid::Document
  field :name, type: String
  field :crm, type: String
  field :state, type: String
end
