class Region < ActiveRecord::Base
  has_many :monitoring_organizations, dependent: :destroy
end
