class EmojiController < ApplicationController
    before_filter :find_model

    def emoji
        response = {
             :id => @emoji.id,
             :char => @emoji.char_dec,
             :dec_val => @emoji.decimal,
             :hex_val => @emoji.hex,
             :name => @emoji.name,
             :code_point => "https://codepoints.net/U+#{@emoji.hex}",
             :html_escape => "&#x#{@emoji.hex}",
             :ruby => "\\u{#{@emoji.hex}}",
             :python => "\\U#{@emoji.hex}",
             :c => "\\U#{@emoji.hex}",
             :css => "\\0#{@emoji.hex}"
        }
        render :json => response.to_json
    end

    def all
        response = build_list Emoji.all
        render :json => response.to_json
    end

    def search
        search_term = params[:q].upcase
        query = "name LIKE '%#{search_term}%'"
        response = build_list Emoji.where(query)
        render :json => response.to_json
    end


    private
    def find_model
        @emoji = Emoji.find(params[:id]) if params[:id]
    end

    def python_c_rep hex
        while hex.length <= 8
            hex = '0' + hex
        end
        hex
    end

    def build_list emojis
        response = []
        emojis.each do |emoji|
            response << {
                :id => emoji.id,
                :char => emoji.char_dec,
                :dec_val => emoji.decimal,
                :hex_val => emoji.hex,
                :name => emoji.name,
                :code_point => "https://codepoints.net/U+#{emoji.hex}",
                :ruby => "\\u{#{emoji.hex}}",
                :python => "\\U#{emoji.hex}",
                :c => "\\U#{emoji.hex}",
                :css => "\\0#{emoji.hex}"
            }
        end
        response
    end
end
