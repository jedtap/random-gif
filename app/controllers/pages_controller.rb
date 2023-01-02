class PagesController < ApplicationController
  def home
    @recent = Search.all.last(5).reverse
  end

  def download
  end
end
