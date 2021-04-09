class Profile < ApplicationRecord
     belongs_to :planner
     has_one_attached :image

     validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
     validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
     validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' }
     validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' }


     extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to :gender
     belongs_to :prefecture

     validates :gender_id, numericality: { other_than: 1 } 
     validates :prefecture_id, numericality: { other_than: 1 } 

end
