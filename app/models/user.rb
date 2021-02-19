class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  with_options presence: true do
    validates :password,          format: { with:  /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i},length: { minimum: 6 }
    validates :nickname

    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/}  do
      validates :last_name_kanji  
      validates :first_name_kanji
    end

    with_options  format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_kana   
      validates :first_name_kana
    end
    validates :birthday
  end
end
