class Company < ActiveRecord::Base
  scope :search, ->(name){where('name LIKE ?', "%#{name.capitalize}%") if name.present?}

end
