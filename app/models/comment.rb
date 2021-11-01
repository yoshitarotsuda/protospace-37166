class Comment < ApplicationRecord
  # validates :content presence: true

  belongs_to :user # 相手のモデルのidが空ではないかというバリデーションがデフォルトでかかる。
  belongs_to :prototype

end