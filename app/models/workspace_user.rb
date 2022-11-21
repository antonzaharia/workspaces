class WorkspaceUser < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :workspace
  
  validates :email, presence: true
  validate :uniqueness_for_same_workspace, on: :create
  validates :status, inclusion: { in: %w[accepted declined pending] }

  def show_name
    user&.name || email
  end

  def uniqueness_for_same_workspace
    return if workspace.workspace_users.where(email: email).empty?

    errors.add(:user, 'already invited.')
  end

  def authenticate(given)
    token == given
  end
end
