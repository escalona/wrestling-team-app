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

require 'test_helper'

class WrestlerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
