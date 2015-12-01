# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  title            :string
#  ministry         :string
#  text             :text
#  status           :string
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

class Question < ActiveRecord::Base
	before_create :create_tracking_id, :preprocess_question
  	validates_presence_of :title, :ministry, :text

	def create_tracking_id
		begin
			self.tracking_id = SecureRandom.hex(4)
		end while self.class.exists?(:tracking_id => tracking_id)
	end

	def preprocess_question
		if !self.status?
			self.status = STATUSES[:waiting]
		end
	end

	def status_enum
		STATUSES.map { |k,v| [v] }
	end

	def ministry_enum
		MINISTRIES.map { |m| [m] }
	end


	MINISTRIES = [
		"Agriculture", 
		"Chemicals and Fertilizers", 
		"Civil Aviation", 
		"Coal", 
		"Commerce and Industry", 
		"Communications and Information Technology", 
		"Consumer Affairs, Food and Public Distribution", 
		"Corporate Affairs", 
		"Culture", 
		"Defence", 
		"Development of North Eastern Region", 
		"Drinking Water Supply and Sanitation", 
		"Earth Sciences", 
		"Environment, Forest and Climate Change", 
		"External Affairs", 
		"Finance", 
		"Food Processing Industries", 
		"Health and Family Welfare", 
		"Heavy Industries and Public Enterprises", 
		"Home Affairs", 
		"Housing and Urban Poverty Alleviation", 
		"Human Resource Development", 
		"Information and Broadcasting", 
		"Labour and Employment", 
		"Law and Justice", 
		"Micro, Small and Medium Enterprises", 
		"Mines", 
		"Minority Affairs", 
		"New and Renewable Energy", 
		"Overseas Indian Affairs", 
		"Panchayati Raj", 
		"Parliamentary Affairs", 
		"Personnel, Public Grievances and Pensions", 
		"Petroleum and Natural Gas", 
		"Planning", 
		"Power", 
		"Railways", 
		"Road Transport and Highways", 
		"Rural Development", 
		"Science and Technology", 
		"Shipping", 
		"Skill Development and Entrepreneurship", 
		"Social Justice and Empowerment", 
		"Statistics and Programme Implementation", 
		"Steel", 
		"Textiles", 
		"Tourism", 
		"Tribal Affairs", 
		"Urban Development", 
		"Water Resources", 
		"Women and Child Development", 
		"Youth Affairs and Sports"
	].freeze

	STATUSES = {
		deferred: 'DEFERRED',
		answered: 'ANSWERED',
		scheduled: 'SCHEDULED',
		rejected: 'REJECTED',
		waiting: 'WAITING'
	}.freeze

	STATES = [
		"Andhra Pradesh", 
		"Arunachal Pradesh",
		"Assam", 
		"Bihar",
		"Chandigarh", 
		"Chattisgarh", 
		"Delhi", 
		"Goa", 
		"Gujarat", 
		"Haryana",
		"Himachal Pradesh",
		"Jammu And Kashmir", 
		"Jharkhand",
		"Karnataka",
		"Kerala",
		"Lakshadweep", 
		"Madhya Pradesh",
		"Maharashtra",
		"Manipur",
		"Meghalaya",
		"Mizoram",
		"Nagaland",
		"No State",
		"Odisha",
		"Puducherry",
		"Punjab",
		"Rajasthan",
		"Sikkim",
		"Tamilnadu",
		"Telangana",
		"Tripura",
		"Union Territory",
		"Uttarakhand",
		"Uttar Pradesh",
		"West Bengal"
	].freeze

end
