class Api::DevicesController < ApplicationController
  def index
    printed_code = params[:printed_code]
    barcode = Barby::Code128B.new printed_code
    full_path = "app/assets/images/barcode_#{printed_code}.png"
    File.open(full_path, "wb") {|f| f.write barcode.to_png}

    respond_to do |format|
      format.html do
        render partial: "devices/image_printed",
          locals: {printed_code: printed_code}
      end
    end
  end
end
