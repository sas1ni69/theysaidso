require 'faraday'
require 'json'

API_URL = "http://api.theysaidso.com/qod.json"

class Theysaidso::QOD
  attr_reader :id, :quote, :author, :length, :tags, :success, :category

  def initialize(attrs)
    @id       = attrs['contents']['id']
    @quote    = attrs['contents']['quote']
    @author   = attrs['contents']['author']
    @length   = attrs['contents']['length']
    @tags     = attrs['contents']['tags']
    @categroy = attrs['contents']['categroy']
    @success  = attrs['success']['total']
  end

  def self.fetch
    response = Faraday.get(API_URL)
    attrs = JSON.parse(response.body)
    new(attrs)
  end
end

