class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
# 8.2.1 ApplicationコントローラにSessionヘルパーモジュールを読み込む
  include SessionsHelper
end
