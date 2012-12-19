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
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Match < ActiveRecord::Base
  attr_accessible :match_date, :opp_first_name, :opp_last_name, :result, :school, :tournament
end
