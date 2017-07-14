class RouteSubdomain
  def self.matches? request
    case request.subdomain
    when "", "www"
      false
    else
      true
  end
end

Rails.application.routes.draw do

  constraints(RouteSubdomain) do
    root "blogs#show"
  end

  constraints(!RouteSubdomain) do
    resources :blogs, except: [:index, :show]
      resources :posts
    end
    root "blogs#index"
  end

  # Simpler Style
  # get '', to: 'blogs#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  # root to: "blogs#index"
  # resources :blogs
  # resources :posts

end
