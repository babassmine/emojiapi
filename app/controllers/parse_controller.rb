class ParseController < ApplicationController
  def word
    sent = params[:s]
    render :json => {converted: sent}.to_json
  end
end
