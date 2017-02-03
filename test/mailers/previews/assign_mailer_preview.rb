# Preview all emails at http://localhost:3000/rails/mailers/assign_mailer
class AssignMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/assign_mailer/device_assign
  def device_assign
    @assignment = Assignment.find_by id: 6
    AssignMailer.device_assign @assignment
  end

  def request_done
    @assignment = Assignment.find_by id: 6
    AssignMailer.request_done @assignment
  end
end
