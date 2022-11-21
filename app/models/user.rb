class User < ApplicationRecord
  # Created
  has_many :my_workspaces, class_name: 'Workspace'

  has_many :workspace_users
  # Is member of 
  has_many :workspaces, through: :workspace_users
  

  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :icon_validation

  def icon_validation
    if icon.attached?
      if icon.blob.byte_size > 10.megabytes
        icon.purge
        errors.add(:icon, 'is too big')
      elsif !icon.blob.content_type.starts_with?('image/')
        icon.purge
        errors.add(:icon, 'is in a wrong format')
      end
    end
  end

  def show_name
    self.name.presence || 'not set'
  end

  def show_dob
    self.dob.presence || 'not set'
  end

  def status(workspace)
    workspace.workspace_users.find_by(user: self)&.status
  end

  def accepted?(workspace)
    status(workspace) == 'accepted'
  end

  def owner?(workspace)
    workspace.owner == self
  end
end
