Fisheye::Application.routes.draw do
  # Mount Masq, our OpenID server
  mount Masq::Engine => "/masq"
end
