class Software < ApplicationRecord
  enum :status, draft: 0, published: 1, archived: 2


  belongs_to :seller, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :buyers, through: :payments, source: :buyer

  validates :name, presence: true
  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true
  #validates :seller, presence: true
  validate :seller_must_be_seller

  private

  def seller_must_be_seller
    user_role = User.where(id: user_id).last&.role
    p user_role
    unless user_role == 'seller'
      errors.add(:seller, "deve ter função de vendedor")
    end
  end
end
