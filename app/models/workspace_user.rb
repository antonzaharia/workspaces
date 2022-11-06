class WorkspaceUser < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :workspace
  
  validates :email, presence: true
  validates :status, inclusion: { in: %w[accepted declined pending] }
end
