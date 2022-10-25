require 'rails_helper'

RSpec.describe Meme, type: :model do
  it 'should validate title' do
    meme = Meme.create
    expect(meme.errors[:title]).to_not be_empty
  end
  
  it 'should validate likes' do
    meme = Meme.create
    expect(meme.errors[:likes]).to_not be_empty
    
  end
  
  it 'should validate dislikes' do
    meme = Meme.create
    expect(meme.errors[:dislikes]).to_not be_empty
  end
  
  it 'should validate image' do
    meme = Meme.create
    expect(meme.errors[:image]).to_not be_empty
  end
  
  it 'should validate description' do
    meme = Meme.create
    expect(meme.errors[:description]).to_not be_empty
  end
  
  it 'should validate minimum length of 10 for title' do
    meme = Meme.create(title:'title', likes:10, dislikes:5, image: 'https://sketchyimages.com/img/id3291.jpg', description: 'sketchy ass fuck')
    expect(meme.errors[:title]).to_not be_empty
  end
  
  # it 'should validate minimum length of 10 expected failure' do
  #   meme = Meme.create(title:'super long title', likes:10, dislikes:5, image: 'https://sketchyimages.com/img/id3291.jpg', description: 'sketchy ass fuck')
  #   expect(meme.errors[:title]).to_not be_empty
  # end

end

