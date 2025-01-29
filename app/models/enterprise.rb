class Enterprise < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, format: { with: /\A\d{10,11}\z/, message: "deve ter 10 ou 11 dígitos" }, allow_nil: true
  validates :cnpj, presence: true , if: :seller?, uniqueness: true, format: { with: /\A\d{14}\z/, message: "deve conter 14 dígitos" }
end