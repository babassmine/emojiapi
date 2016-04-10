class EmojiController < ApplicationController
    before_filter :find_model

    def emoji
        response = {
             :id => @model.id,
             :char => @model.char_dec,
             :dec_val => @model.decimal,
             :hex_val => @model.hex,
             :name => @model.name,
             :code_point => "https://codepoints.net/U+#{@model.hex}"
        }
        render :json => response.to_json
    end

    def all
        response = []
        Emoji.all.each do |model|
            response << {
                :id => model.id,
                :char => model.char_dec,
                :dec_val => model.decimal,
                :hex_val => model.hex,
                :name => model.name,
                :code_point => "https://codepoints.net/U+#{model.hex}"
            }
        end
        response.to_json
        render :json => response.to_json
    end


    private
    def find_model
        @model = Emoji.find(params[:id]) if params[:id]
    end
end
