class HomeController < ApplicationController
  def show
    render inline: '', layout: true
  end
end
