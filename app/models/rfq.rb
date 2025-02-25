class Rfq < ApplicationRecord
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items,
    reject_if: :all_blank, allow_destroy: true
  belongs_to :user

  enum status: { draft: "draft", sent: "sent", locked: "locked" }
  validates :status, presence: true, inclusion: { in: statuses.keys }
end
