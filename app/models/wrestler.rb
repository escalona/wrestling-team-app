# == Schema Information
#
# Table name: wrestlers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  height     :integer
#  weight     :integer
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wrestler < ActiveRecord::Base
  has_many :matches, dependent: :destroy
  attr_accessible :first_name, :height, :last_name, :weight, :year
  before_save do |wrestler|
    wrestler.first_name = wrestler.first_name.downcase
    wrestler.last_name = wrestler.last_name.downcase
  end

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
end
