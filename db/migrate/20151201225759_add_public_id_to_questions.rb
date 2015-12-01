class AddPublicIdToQuestions < ActiveRecord::Migration
	def change
		add_column :questions, :public_id, :string
	end
end
