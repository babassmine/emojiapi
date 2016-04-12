class ParseController < ApplicationController
  def word
    sentence = params[:s].split(' ')
    response = []
    sentence.each do |word|
      sing_word = word.singularize
      tag = Tag.where(name: sing_word).first
      if tag
        emojis = tag.emojis
        index = Random.rand(emojis.count)
        if is_plural?(word)
          response << emojis[index].char_dec * 2
        else
          response << emojis[index].char_dec
        end
      else
        response << word
      end
    end
    render :json => {
      converted: response.join(' '),
      original: sentence
     }.to_json
  end

  private

  def is_plural? word
    if word == word.pluralize
      return true
    end
    false
  end
end
