class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birth_day
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # 英字と数字の両方が必要
  validates_format_of :password, with: PASSWORD_REGEX

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    # 全角ひらがな，カタカナ，漢字のみ
    validates :family_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー]+\z/ } do
    # 全角カタカナのみ
    validates :family_name_kana
    validates :first_name_kana
  end
end
