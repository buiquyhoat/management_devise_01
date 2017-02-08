class RequestForm
  attr_reader :params

  def initialize params
    @params = params
  end

  def request_details_valid?
    check_request = Request.new @params
    check_request.request_details.any?
  end
end
