class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/.freeze

 validates :nickname, presence: true
 #validates :password, presence: true, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
 validates :password, presence: true,  format: { with: VALID_PASSWORD_REGEX }
 validates :family_name, presence: true
 validates :last_name, presence: true
 #validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
 validates :family_name_kana, presence: true, format: { with: KATAKANA_REGEXP }
 #validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
 validates :last_name_kana, presence: true, format: { with: KATAKANA_REGEXP }
 validates :birth, presence: true

end
