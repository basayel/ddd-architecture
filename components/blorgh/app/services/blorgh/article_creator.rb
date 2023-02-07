module Blorgh
  class ArticleCreator < AppBase::ApplicationService
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    # Usage: ArticleCreator.call(params[:article])
    def call
      article = Blorgh::Article.new(
        attributes.slice(
          :title,
          :text,
          :user_id
        )
      )
      article.save
      return article
    end
  end
end
