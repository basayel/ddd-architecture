Rails.application.routes.draw do
  mount AppBase::Engine => "/app_base"
end
