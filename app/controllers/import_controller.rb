class ImportController < ApplicationController

  def index

  end

  def new

  end

  def create
    Device.import params[:file]
  end
end
