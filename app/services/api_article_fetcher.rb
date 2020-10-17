require 'open-uri'
require 'json'
require 'news-api'


require 'date'
# This service returns articles
class ApiArticleFetcher
  include Executable

  def execute
    fetch_articles
  end


  private

  def fetch_articles
    @newsapi = News.new("0d80da2ec0f6419cba14320e47c559cb") 
      @newsapi.get_everything(
        q: 'fantasy football rankings',
        language: 'en',
        sortBy: 'publishedAt',
        pageSize: 100)
  end
end
