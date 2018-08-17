class Report
  include Mongoid::Document
  field :hospital, type: String
  field :patient, type: String
  field :type, type: String
  field :description, type: String
end
