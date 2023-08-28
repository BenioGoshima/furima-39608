class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :orders

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
         KANA_REGEX = /\A[ァ-ヶ一]+\z/.freeze

         validates :nickname, presence: true
         validates :email, presence: true
         validates :password, presence: true, format: { with: PASSWORD_REGEX }
         validates :encrypted_password, presence: true

      with_options presence: true, format: { with: NAME_REGEX } do
         validates :first_name#, format: { with: NAME_REGEX }
         validates :last_name#, format: { with: NAME_REGEX }
      end
      with_options presence: true, format: { with: KANA_REGEX } do
        validates :first_name_kana
        validates :last_name_kana
      end
         validates :birth_date, presence: true
end
