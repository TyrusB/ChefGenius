json.(
  suggestion,
  :id,
  :content,
  :created_at
)

json.authorId suggestion.author.id
json.authorEmail suggestion.author.email