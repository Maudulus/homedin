class HomeController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:destroy, :create, :edit, :new]

  def index
    @houses = House.all
  end

end
