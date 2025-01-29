class Payment < ApplicationRecord
  belongs_to :software
  belongs_to :buyer, class_name: 'User'

  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_date, presence: true
  validate :buyer_must_be_buyer
  validate :unique_software_purchase_per_buyer

  private

  def buyer_must_be_buyer
    unless buyer&.buyer?
      errors.add(:buyer, "deve ter função de comprador")
    end
  end

  def unique_software_purchase_per_buyer
    if Payment.exists?(software: software, buyer: buyer)
      errors.add(:base, "Software já foi comprado por este usuário")
    end
  end
end