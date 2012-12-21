# == Schema Information
#
# Table name: matches
#
#  id             :integer          not null, primary key
#  opp_first_name :string(255)
#  opp_last_name  :string(255)
#  match_date     :date
#  school         :string(255)
#  result         :string(255)
#  tournament     :string(255)
#  wrestler_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
