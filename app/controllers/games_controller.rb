require "json"
require "open-uri"

# require_relative "../app/post.rb"

class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(8)


  end


  def score


    @answer = (params[:answer] || "").upcase
    @english_word = english_word?(@answer)


  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

end










