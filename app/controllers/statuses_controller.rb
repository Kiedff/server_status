class StatusesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @statuses = Status.all
  end
end