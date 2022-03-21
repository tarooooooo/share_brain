knowledge_tag_names = %x[
  Ruby
  PHP
  Go lang
  Python
  Java
  Swift
  flutter
  Vue
  React
]

return if knowledge_tags.count == KnowledgeTag.count

knowledge_tag_names.each.with_index(1) do |index, knowledge_tag_name|
  KnowledgeTag.seed do |it|
    it.id = index
    it.name = knowledge_tag_name
  end
end
