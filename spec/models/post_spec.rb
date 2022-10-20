require 'rails_helper'

describe Post, type: :model do
  subject { Post.new(title: 'My first post', text: 'This is my first post.', comments_counter: 2, likes_counter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 'two'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should not be negative' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = 'four'
    expect(subject).to_not be_valid
  end

  it 'likes_counter should not be negative' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
