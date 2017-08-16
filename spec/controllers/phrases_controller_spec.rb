require 'rails_helper'

describe PhrasesController do
  let(:phrase) { FactoryGirl.create(:phrase) }

  describe "#fetch_phrase" do
    before do 
      phrase
    end
    
    context "fetch one phrase" do
      it "returns 200" do
        get :fetch_phrase, format: :html
        expect(response.status).to eq(200)
      end

      it "returns 200" do
        get :fetch_phrase, format: :json
        expect(response.status).to eq(200)
      end

      it "returns 200" do
        get :fetch_phrase, xhr: true, params: {exclude: [phrase.id]}, format: :json
        expect(response.status).to eq(404)
      end
    end
  end
end
