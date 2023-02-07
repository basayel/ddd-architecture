module Blorgh
  class ArticleService
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def create
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

    def delete

    end

    def publish

    end
  end
end
