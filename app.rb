require 'dm-core'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'sinatra'

DataMapper.setup(:default, 'postgres://db/recipes_datamapper_development')

class Article
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, Text
  property :published, Boolean, default: false
  property :published_on, Date, required: false
  property :likes, Integer, default: 0

  def publish!
    @published = true
    @published_on = Date.today
  end
end

DataMapper.finalize
Article.auto_upgrade!
