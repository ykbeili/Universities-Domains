class UniversitiesInfo < ApplicationRecord
  serialize :domain, Array

  LIST_OF_COUNTRIES = %w[united\ states canada].freeze
end
