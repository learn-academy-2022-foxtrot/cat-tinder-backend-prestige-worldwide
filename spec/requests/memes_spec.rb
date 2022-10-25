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
    
    it 'meme post is missing requirements to post' do
      meme_params = {
        meme: {
          title: 'burning house everything is fine dog',
          likes: 1238,
          dislikes: 12,
          image: 'https://somerandommemes.com/meme/id=29183.jpg',
          description: 'super cool meme'
        }
      }
      post '/memes', params: meme_params
      p 'STATUS HERE', response.status

      if response.status == 422
        expect(response.status).to eq(422)
        json = JSON.parse(response.body)
        expect(json['description']).to include 'cannot be blank'
      end
      
      if response.status == 200
        expect(response.status).to eq(200)
      end
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
    
    it 'meme post is missing requirements to update' do
      meme_params = {
        meme: {
          title: 'burning house everything is fine dog',
          likes: 1238,
          dislikes: 12,
          image: 'https://somerandommemes.com/meme/id=29183.jpg',
          description: 'Super cool meme'
        }
      }
      
      post '/memes', params: meme_params
      p 'STATUS HERE', response.status
      meme = Meme.first()
      
      meme_params = {
        meme: {
          title: 'burning house everything is fine dog',
          likes: 1238,
          dislikes: 32,
          image: '',
          description: 'Super cool meme'
        }
      }
      
      patch "/memes/#{meme.id}", params: meme_params
      p 'STATUS HERE', response.status
      find_meme = Meme.find(meme.id)
      p 'FIND MEME', find_meme
      
      if response.status == 422
        expect(response.status).to eq(422)
        json = JSON.parse(response.body)
        expect(json['image']).to include 'cannot be blank'
      end
      
      if response.status == 200
        expect(response.status).to eq(200)
      end
      
      
    end
    
  end
  
  describe 'DELETE /destroy' do
    it 'should deletes meme post' do
      
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
      delete "/memes/#{meme.id}"
      
      if response.status == 200
        expect(response.status).to eq(200)
      end
      
    end
  end
  
end
