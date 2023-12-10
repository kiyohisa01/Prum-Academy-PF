class ApplicationController < ActionController::Base
    # どのコントローラからでもログイン関連のメソッドを呼び出せるように
    include SessionsHelper
end
