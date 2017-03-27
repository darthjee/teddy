class HomeController < ApplicationController
  def show
    render inline: 'aaa', layout: true
  end
end
