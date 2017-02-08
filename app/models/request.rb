class Request < ApplicationRecord
  attr_accessor :creater, :updater, :readonly

  after_create_commit :create_hitory_for_create
  after_update_commit :create_hitory_for_update

  belongs_to :request_type
  belongs_to :request_status
  belongs_to :assignee, class_name: User.name
  has_many :request_details, dependent: :destroy, inverse_of: :request
  has_many :devices, through: :request_details

  delegate :name, to: :request_status, prefix: true

  validates :title, :description, presence: true

  accepts_nested_attributes_for :request_details,
    reject_if: proc{|attributes| attributes[:description].blank?}

  after_initialize :create_extend_data

  scope :find_by_actor, ->(user_id) do
    where "id in (select r.id from requests as r
    where r.assignee_id = ? or r.created_by = ? or r.updated_by= ?)", user_id,
    user_id, user_id if user_id.present?
  end

  scope :of_request_type, ->request_type_id do
    where request_type_id: request_type_id if request_type_id.present?
  end

  scope :of_request_status, ->request_status_id do
    where request_status_id: request_status_id if request_status_id.present?
  end

  def allow_edit? user
    user.id == created_by || user.id == updated_by || user.id == assignee_id
  end

  private

  def create_extend_data
    self.creater = User.find_by id: created_by
    self.updater = User.find_by id: updated_by
  end

  def create_history action
    user_name = get_created_name created_by
    content = I18n.t("history.request",action: action, name: user_name)
    history_data = {"content": content, "status": request_status_name}
    create_hitory id, history_data.to_json, Settings.history_type.request
  end
end
