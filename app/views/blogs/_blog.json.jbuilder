json.extract! blog, :id, :name, :subdomain, :domain, :created_at, :updated_at
json.url blog_url(blog, format: :json)
