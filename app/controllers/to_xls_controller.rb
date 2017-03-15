class ToXlsController < ApplicationController
  def index
    @search = DeviceCategory.search(params[:q])
    @search.sorts = ["name"]
    @export_result = @search.result
    respond_to do |format|
      format.xls {
        file_name = t("export.file_name") << "#{Time.now.strftime(Settings.time_format)}" << t("export.extension")
        send_data @export_result.to_a.to_xls,
          type: "text/xls; charset=utf-8; header=present",
          filename: file_name
      }
    end
  end
end
