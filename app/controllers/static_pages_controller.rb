class StaticPagesController < ApplicationController
  def home
  	@today = Task.for_today.all
  end
end
