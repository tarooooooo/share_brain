# frozen_string_literal: true

class BaseBtnCell < BaseCell
  include ActionView::Helpers::UrlHelper

  private

  def render_btn(link_text, path, options = {})
    raw_btn(link_text, path, options)
  end

  def raw_btn(link_text, path, options = {})
    link_to link_text, path,
            class: options[:class],
            data: {
              confirm: options[:confirm],
              'test-operate-key': options['test-operate-key'],
              'toggle': options['toggle'],
              'target': options['modal-target']
            },
            method: options[:method],
            target: options[:target]
  end
end
