class EmojiController < ApplicationController
    before_filter :find_model

    def emoji
        @response = {
             :id => @model.id,
             :char => @model.char_dec,
             :dec_val => @model.decimal,
             :hex_val => @model.hex,
             :name => @model.name
        }.to_json
        puts @response
        respond_to do |format|
          format.json
          format.csv
        end
    end


    private
    def find_model
        @model = Emoji.find(params[:id]) if params[:id]
    end
end
