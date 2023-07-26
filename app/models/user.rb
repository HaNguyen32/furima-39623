class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nick_name
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message:"メールアドレスに「＠」を挿入してください。"}
    #validates :password,length: { minimum: 6}, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "Password is invalid.Include  both letters and numbers" }
    validates :encrypted_password
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :katagana_first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :katagana_last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :date_of_birth
  end
end
