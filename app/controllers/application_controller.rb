class ApplicationController < ActionController::Base
  def hello
    render html: "Hello World - Rafael Martins"
  end
end
