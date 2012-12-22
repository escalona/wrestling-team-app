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

class Match < ActiveRecord::Base
  belongs_to :wrestlers
  attr_accessible :match_date, :opp_first_name, :opp_last_name, :result, :school, :tournament, :wrestler_id
  before_save do |match|
    match.opp_first_name = match.opp_first_name.downcase
    match.opp_last_name = match.opp_last_name.downcase
    match.school = match.school.downcase
    match.tournament = match.tournament.downcase
  end

  default_scope :order => 'match_date ASC'
end
