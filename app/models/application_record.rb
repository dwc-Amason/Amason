class ApplicationRecord < ActiveRecord::Base
  acts_as_paranoia

  self.abstract_class = true
end
