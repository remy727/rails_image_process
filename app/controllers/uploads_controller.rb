class UploadsController < ApplicationController
  def create
    upload = Upload.new
    upload.image = params[:image]
    upload.save!

    head :ok
  end
end
