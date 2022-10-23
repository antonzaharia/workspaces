class Workspace < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  def self.find_by_request(request)
    find_by(slug: request.subdomain)
  end
end
