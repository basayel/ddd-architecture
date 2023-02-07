# == Schema Information
#
# Table name: blorgh_articles
#
#  id         :integer          not null, primary key
#  text       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_blorgh_articles_on_user_id  (user_id)
#
require 'batch-loader'

module Blorgh
  class Article < AppBase::ApplicationRecord

    # Class methods

    # Associations
    def user
      UserRepository.find user_id
    end

    def user=(user)
      self.user_id = user.id
    end

    # Instance Methods
    def policy_class
      Blorgh::ArticlePolicy
    end

    ## For solving N + 1 problem
    # Problem: The repository classes don't inherit from ApplicationRecord or ActiveRecord::Base
    # So, We cannot simply use Blorgh::Article.includes(:user)
    # Instead, We can do something like:
    # articles = Blorgh::Article.all
    # loaded_users = articles.map{ |article| article.include_user } # This will execute SINGLE select from users query
    # then articles[i]'s user = loaded_users[i]
    def include_user
      BatchLoader.for(self.user_id).batch do |user_ids, loader|
        UserRepository.where(id: user_ids).each { |user| loader.call(user.id, user) }
      end
    end
  end
end
