class PhrasesController < ApplicationController
  
  def index
    if session[:phrase_ids]
      @phrases = Phrase.find(session[:phrase_ids]) rescue [Phrase.random].compact
    else
      @phrases = [Phrase.random].compact
    end
    
    @dataexclude = @phrases.map(&:id).join(',') 
    @total_phrases = Phrase.remaining_record_count(@phrases.map(&:id))

    render 'fetch_phrase'
  end

  def fetch_phrase
    @phrase = Phrase.random(params[:exclude])
    @total_phrases = Phrase.remaining_record_count(params[:exclude] || [])
    if !@phrase.nil?
      session[:phrase_ids] = params[:exclude].push(@phrase.id) unless params[:exclude].nil?
    end
    respond_to do |format|
      if @phrase
        format.json { 
          render json: @phrase.as_json.merge({remaining_record_count: Phrase.remaining_record_count(params[:exclude] || [])})
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
