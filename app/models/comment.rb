class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attr)
    username = user_attr[:username]
    return if username.blank?

    self.user = User.find_or_create_by(username: username)
  end
end
