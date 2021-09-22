class UniversitiesInfo < ApplicationRecord
  serialize :domain, Array
  serialize :web_page, Array
end
