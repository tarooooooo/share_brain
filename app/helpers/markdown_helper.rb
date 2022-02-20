module MarkdownHelper

  def markdown(text)
    unless @markdown
      options = {
        hard_wrap: true,
        space_after_headers: true
      }
      extensions = {
        autolink:           true,  # <>で囲まれてなくてもリンクを認識
        no_intra_emphasis:  true,  # 単語中の強調を認識しない
        fenced_code_blocks: true,  # フェンスのあるコードブロックを認識
        strikethrough:      true,  # ~ 2つで取り消し線
        superscript:        true,  # ^ の後ろが上付き文字
        tables:             true,  # テーブルを認識
        underline:          true,  # 斜線(* *)
        highlight:          true,  # ハイライト(== ==)
        quote:              true,  # 引用符(" ")
        footnotes:          true,  # 脚注( ^[1] )
      }
      renderer = Redcarpet::Render::HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer, extensions)
    end

    @markdown.render(text).html_safe
  end
end
