class PagesController < ApplicationController
  def home
    @gossips = Gossip.all
  end

  def team

  end

  def contact

  end

  def welcome
      @first_name = params[:first_name]
  end
end
