# codewars leaderboard page doesn't specify <meta charset="utf-8">
  # for nokogiri, make sure to force utf-8. ex: Nokogiri::HTML(open(URL), nil, 'UTF-8')
  # reference: http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html#encoding

require 'nokogiri'
require 'open-uri'
require_relative 'user'

class LeaderBoard

  attr_reader :position
   
  URL = 'https://www.codewars.com/users/leaderboard'

  def initialize 
    @users = []
    @position = get_users
  end

  def parse_content
    Nokogiri::HTML(open(URL).read)
  end

  def get_users 
    parse_content.css('tr').each do |row|
      break if @users.count >= 500
      @users << User.new(
        name: row.css('a').inner_text,
        clan: row.css('td[3]').inner_text,
        honor: row.css('td[4]').inner_text
      )
    end
    @users
  end

  # def get_users(parent, children = {})
  #   parse_content.css('tr').each do |row|
  #     break if @users.count >= 500
  #     @users << User.new(
  #       name: row.css('a').inner_text,
  #       clan: row.css('td[3]').inner_text,
  #       honor: row.css('td[4]').inner_text
  #     )
  #   end
  #   @users
  # end

  def size
    position.length
  end

end

leaderboard = LeaderBoard.new 
 
 
 


 