class UniversitiesInfosController < ApplicationController
  require 'uri'
  require 'net/http'
  before_action :check_canadian_universities, :check_united_states_universities

  def index
    respond_to |format| do
      format.html
    end
  end

  private

  def check_canadian_universities
    @canadian_universities = UniversitiesInfo.where(country: 'Canada')
    if !@canadian_universities.blank?
      @canadian_universities
    else
      begin
        uri = URI('http://universities.hipolabs.com/search?country=canada')
        res = Net::HTTP.get_response(uri)
      rescue
        puts "error"
      end
      if !res.body.nil?
        parsed_response = JSON.parse(res.body)
          parsed_response.map do |u|
            UniversitiesInfo.create(
              web_page: u["web_page"],
              country: u["country"],
              domain: u["domains"],
              name: u["name"],
            )
          end
      end
    end
    @canadian_universities = UniversitiesInfo.where(country: 'Canada')
    @canadian_universities
  end

  def check_united_states_universities
    @united_states_universities = UniversitiesInfo.where(country: 'United States')
    if !@united_states_universities.blank?
      @united_states_universities
    else
      begin
        uri = URI('http://universities.hipolabs.com/search?country=united+states')
        res = Net::HTTP.get_response(uri)
      rescue
        puts "error"
      end
      if !res.body.nil?
        parsed_response = JSON.parse(res.body)
          parsed_response.map do |u|
            UniversitiesInfo.create(
              web_page: u["web_page"],
              country: u["country"],
              domain: u["domains"],
              name: u["name"],
            )
          end
      end
    end
    @united_states_universities = UniversitiesInfo.where(country: 'United States')
    @united_states_universities
  end
end
