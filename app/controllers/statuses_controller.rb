class StatusesController < ApplicationController
  load_and_authorize_resource

  def index
    @statuses = Status.all
  end
end