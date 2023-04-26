class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_NAME_REGEX = /\A[一-龯ぁ-んァ-ン]+\z/ 

  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters' }
  validates :family_name_kana, presence: true,
                               format: { with: VALID_KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
  validates :last_name_kana, presence: true,
                             format: { with: VALID_KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters' }
  validates :birth, presence: true
end
