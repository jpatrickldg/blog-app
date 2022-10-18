class Post < ApplicationRecord
  belongs_to :user

  enum status: [:published, :draft, :archived]
end
