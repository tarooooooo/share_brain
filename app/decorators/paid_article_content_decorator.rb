# frozen_string_literal: true

module PaidArticleContentDecorator

  def movie_iframe_url
    return '' if movie_id.blank?
    "https://www.youtube.com/embed/#{movie_id}?autoplay=1&mute=1&playsinline=1&loop=1&playlist=#{movie_id}"
  end
end
