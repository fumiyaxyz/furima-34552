class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :password,          format: { with:  /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :nickname
    validates :last_name_kanji,   format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/} 
    validates :first_name_kanji,  format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/} 
    validates :last_name_kana,    format: {with: /\A[ァ-ヶー－]+\z/ } 
    validates :first_name_kana,   format: {with: /\A[ァ-ヶー－]+\z/ } 
    validates :birthday

  end

  
  
end
