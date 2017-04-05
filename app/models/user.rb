class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :recomendations
end
