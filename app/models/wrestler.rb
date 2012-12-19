# == Schema Information
#
# Table name: wrestlers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  height     :integer
#  weight     :integer
#  class      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wrestler < ActiveRecord::Base
  attr_accessible :first_name, :height, :last_name, :weight, :year

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
end
