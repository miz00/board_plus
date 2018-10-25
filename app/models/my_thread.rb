class MyThread < ApplicationRecord
  has_many :comment, :dependent => :destroy
  validates :title, presence: true
end
