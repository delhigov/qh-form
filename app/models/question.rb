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

class Question < ActiveRecord::Base
	before_create :create_tracking_id
  	validates_presence_of :title, :ministry, :text, :if => lambda { |o| o.current_step == "question_form" } 
	attr_writer :current_step

  	def current_step
    	@current_step || steps.first
  	end
  
  	def steps
    	%w[personal_info question_form]
 	end
  
  	def next_step
    	self.current_step = steps[steps.index(current_step)+1]
  	end
  
  	def previous_step
    	self.current_step = steps[steps.index(current_step)-1]
  	end
  
  	def first_step?
    	current_step == steps.first
  	end
  
  	def last_step?
    	current_step == steps.last
  	end

	def all_valid?
	    steps.all? do |step|
	      self.current_step = step
	      valid?
	    end
	end

	# what if fail?
	def create_tracking_id
		begin
			self.tracking_id = SecureRandom.hex(5)
		end while self.class.exists?(:tracking_id => tracking_id)
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

	STATUSES = [
		"Answered",
		"Schedule",
		"Rejected"
	].freeze

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
