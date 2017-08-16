class PhrasesController < ApplicationController

  def fetch_phrase
    @phrase = Phrase.random(params[:exclude])
    @total_phrases = Phrase.remaining_record_count(params[:exclude] || [])

    respond_to do |format|
      if @phrase
        format.json { 
          render json: @phrase.as_json.merge({remaining_record_count: Phrase.remaining_record_count(params[:exclude])})
        }
      else
        format.json { 
          render json: @phrase, status: 404
        }
      end
      format.html
    end
  end
end
