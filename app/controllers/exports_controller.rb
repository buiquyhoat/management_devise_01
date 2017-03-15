class ExportsController < ApplicationController
  def index
    @search = DeviceCategory.search params[:q]
    @search.sorts = ["name"]
    @export_result = @search.result
    respond_to do |format|
      format.xlsx {
        file_name = t("export.file_name") <<
          "#{Time.now.strftime(Settings.time_format)}" << t("export.extension")
        headers["Content-Disposition"] = "attachment; filename=\"#{file_name}\"" 
      }
    end
  end
end
