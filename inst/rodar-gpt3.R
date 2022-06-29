token <- Sys.getenv("OPENAI_TOKEN")

r <- httr::POST(
  "https://api.openai.com/v1/completions",
  httr::add_headers(
    "Authorization" = paste("Bearer", token)
  ),
  body = list(
    model = "text-davinci-002",
    prompt = "Escreva um poema fofinho sobre github actions, em português.",
    temperature = 0.7,
    max_tokens = 512,
    top_p = 1,
    frequency_penalty = 0,
    presence_penalty = 0
  ),
  encode = "json"
)

cat(
  httr::content(r)$choices[[1]]$text,
  file = "README.md"
)
