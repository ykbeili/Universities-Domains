class UniversitiesInfosController < ApplicationController
  require 'uri'
  require 'net/http'
  before_action :check_new_universities

  def index
    uri = URI('http://universities.hipolabs.com/search?country=united+states')
    res = Net::HTTP.get_response(uri)
    UniversitiesInfo::LIST_OF_COUNTRIES
  end

  private

  def check_new_universities
    
  end
end
