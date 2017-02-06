class AssignMailer < ApplicationMailer
  include ActionView::Helpers::UrlHelper

  def device_assign assignment
    if assignment
      @assignment = assignment
      @message = ""

      if assignment.assignment_details.count == 1
        @message = t("notification.message.single_device_assigned",
          device: assignment.assignment_details.first.device.device_code )
      else
        @message = t("notification.message.multil_device_assigned",
          total_device: assignment.assignment_details.count)
      end
      @link = link_to t("assignment.email.link_devices_manager_text"),
        assignment_url(assignment, from_app: Settings.email.parameter.from_email)
      mail to: assignment.assignee.email , subject: @message

      request_done assignment
    end
  end

  def request_done assignment
    if assignment.request
      @assignment = assignment
      @message = t("assignment.email.request_done",
        request_title: assignment.request.title)
      created_by = User.find_by id: assignment.request.created_by
      if created_by
        @link = link_to t("assignment.email.link_devices_manager_text"),
          request_url(assignment.request, from_app: Settings.email.parameter.from_email)
        mail to: created_by.email , subject: @message
      end
    end
  end
end
