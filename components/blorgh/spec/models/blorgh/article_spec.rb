require 'rails_helper'

module Blorgh
  RSpec.describe Article, type: :model do

    describe 'associations' do
      let(:user) { create(:user) }
      let(:article) { create(:blorgh_article, user:) }

      it 'returns associated user' do
        expect(article.user.id).to eq(user.id)
      end
    end
  end
end
