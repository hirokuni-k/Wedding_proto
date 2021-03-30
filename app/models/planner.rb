class Planner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' }
    validates :birth_date
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :prefecture

  validates :gender_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
end
