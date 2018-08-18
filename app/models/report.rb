class Report
  include Mongoid::Document
  include Mongoid::Timestamps
  field :hospital, type: String
  field :patient, type: String
  field :type, type: String
  field :description, type: String
end
