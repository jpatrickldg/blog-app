class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :banner, dependent: :destroy
  has_rich_text :body

  enum status: [:published, :draft, :archived]

  validates :title, presence: true
  validates :banner, presence: true
  validates :body, presence: true
end
