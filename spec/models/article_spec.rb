# spec/models/article_spec.rb

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }

    it 'is invalid with a title shorter than the minimum length' do
      article = Article.new(title: 'A', content: 'Lorem ipsum dolor sit amet.')
      article.valid?
      expect(article.errors[:title]).to include('is too short (minimum is 5 characters)')
    end

    it 'is invalid with content shorter than the minimum length' do
      article = Article.new(title: 'Valid Title', content: 'A')
      article.valid?
      expect(article.errors[:content]).to include('is too short (minimum is 50 characters)')
    end

    it 'is valid when all conditions are met' do
      article = Article.new(title: 'Valid Title', content: 'Valid Content that is at least 50 characters long, so this content should be long enough.')
      expect(article).to be_valid
    end
  end
end
