class ActiveStatusesController < ApplicationController

  def index
    @active_statuses = Status.where(resolved: false)
  end
end