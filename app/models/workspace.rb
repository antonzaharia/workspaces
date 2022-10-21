class Workspace < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  def self.find_by_request(request)
    uri = URI(request.original_url)
    if uri =~
       /(127.0.0.1?localhost|ngrok.io|192.168|herokuapp.com)/
      begin
        find_by(slug: request.params[:slug])
      rescue StandardError
        nil
      end
    else
      find_by(slug: request.subdomain)
    end
  end
end
