def parse(req)
  http_method, path_and_params, http = req.split
  path, params = path_and_params.split("?")
  
  params = params.split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end
  params
end

req = "GET /?rolls=2&sides=6 HTTP/1.1"
p parse(req)