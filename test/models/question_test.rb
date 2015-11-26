# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  title            :string
#  ministry         :string
#  text             :text
#  status           :text
#  notes            :text
#  response         :text
#  session_date     :date
#  session_selected :string
#  email            :string
#  city             :string
#  district         :string
#  state            :string
#  name             :string
#  tracking_id      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
