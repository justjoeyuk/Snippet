def load_response(path, type)
  relative_path = "../../Responses/" + path + "/" + type + ".json"
  full_path = File.expand_path(relative_path, __FILE__)
  file = File.open(full_path, "rb")

  rawResponse = file.read

  rawResponse.scan(/\#{-(.*?)-}/m) { |snippet, _|
    fullSnippet = "\#{-#{snippet}-}"
    escapedSnippet = eval %Q{"#{snippet}"}

    snippetResult = eval escapedSnippet
    rawResponse = rawResponse.sub(fullSnippet, snippetResult)
  }

  rawResponse
end
