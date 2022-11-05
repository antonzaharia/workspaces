class Workspace < ApplicationRecord
  PROTOCOL = 'http://'

  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  
  has_many :workspace_users
  has_many :users, through: :workspace_users

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :slug, uniqueness: true, length: { minimum: 3 }, allow_nil: true, format: { with: /\A[a-zA-Z0-9\-_]+\z/, message: 'can only include letters, numbers, dashes and underscores. No spaces or other punctuation is allowed' }
  validates :name, presence: true

  def self.find_by_request(request)
    find_by(slug: request.subdomain)
  end

  def url(request)
    "#{PROTOCOL}#{slug}.#{request.host_with_port}"
  end
end
