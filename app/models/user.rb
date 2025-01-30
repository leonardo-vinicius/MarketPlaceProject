class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :picture_url 
  after_create :change_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, buyer: 0, seller: 1, admin: 2, _default: :buyer

  has_many :softwares, foreign_key: :seller_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :purchased_softwares, through: :payments, source: :software

  validates :password, format: { with: /\A(?=.*\d)(?=.*[a-zA-Z]).{6,}\z/, message: "must include at least one letter and one digit and be at least 6 characters long" }
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, format: { with: /\A\d{10,}\z/, message: "deve ter pelo menos 10 dígitos!" }, allow_nil: true

  def can_comment?(software)
    return false unless buyer?
    purchased_softwares.exists?(id: software.id)
  end

  private

  def change_role
    return if role.present?
    self.role = :buyer
    save(validate: false)
  end
end
