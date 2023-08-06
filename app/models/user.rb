class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nick_name
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'Include both letters and numbers' }
    validates :last_name, format: { with: /\A[\p{Han}\p{Katakana}\p{Hiragana}]+\z/, message: 'Input full-width characters.' }
    validates :first_name, format: { with: /\A[\p{Han}\p{Katakana}\p{Hiragana}]+\z/, message: 'Input full-width characters.' }
    validates :last_name_kana, format: { with: /\A[\p{Katakana}ー－]+\z/, message: 'Input full-width Katakana characters.' }
    validates :first_name_kana, format: { with: /\A[\p{Katakana}ー－]+\z/, message: 'Input full-width Katakana characters.' }
    validates :date_birth
  end
  has_many :items
  has_many :orders
end
