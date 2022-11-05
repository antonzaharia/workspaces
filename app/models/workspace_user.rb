class WorkspaceUser < ApplicationRecord
  belongs_to :user
  belongs_to :workspace
  
  validates :name, presence: true
  validates :status, inclusion: { in: %w[accepted declined pending] }
end
