# frozen_string_literal: true

require 'test_helper'

class PaidArticleContentDecoratorTest < ActiveSupport::TestCase
  def setup
    @paid_article_content = PaidArticleContent.new.extend PaidArticleContentDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
