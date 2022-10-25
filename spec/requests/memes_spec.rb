require 'rails_helper'

RSpec.describe "Memes", type: :request do
  describe "GET /index" do
    it "gets a list of memes" do
      Meme.create(
        title: 'burning house everything is fine dog',
        likes: 1238,
        dislikes: 12,
        image: 'https://somerandommemes.com/meme/id=29183.jpg',
        description: 'https://somerandomemes.com/post/id=6982'
      )

      get '/memes'
      meme = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(meme.length).to eq(1)
    end
  end

  describe "POST /create" do
    it "creates a meme" do
      meme_params = {
        meme: {
          title: 'burning house everything is fine dog',
          likes: 1238,
          dislikes: 12,
          image: 'https://somerandommemes.com/meme/id=29183.jpg',
          description: 'https://somerandomemes.com/post/id=6982'
        }
      }

      post '/memes', params: meme_params
      meme = Meme.first

      expect(meme.title).to eq('burning house everything is fine dog')
      expect(meme.likes).to eq(1238)
      expect(meme.dislikes).to eq(12)
      expect(meme.image).to eq('https://somerandommemes.com/meme/id=29183.jpg')
      expect(meme.description).to eq('https://somerandomemes.com/post/id=6982')
    end
  end

  describe "PATCH /update" do
    it "updates a meme" do
      meme_params = {
        meme: {
          title: 'burning house everything is fine dog',
          likes: 1238,
          dislikes: 12,
          image: 'https://somerandommemes.com/meme/id=29183.jpg',
          description: 'https://somerandomemes.com/post/id=6982'
        }
      }
      
      post '/memes', params: meme_params
      meme = Meme.first()

      meme_params = {
        meme: {
          title: 'calm dog in flaming house',
          likes: 1238,
          dislikes: 12,
          image: 'https://somerandommemes.com/meme/id=29183.jpg',
          description: 'https://somerandomemes.com/post/id=6982'
        }
      }

      patch "/memes/#{meme.id}", params: meme_params
      find_meme = Meme.find(meme.id)
      expect(find_meme.title).to eq("calm dog in flaming house")
    end
  end
end
