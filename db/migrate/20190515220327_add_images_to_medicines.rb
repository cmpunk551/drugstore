class AddImagesToMedicines < ActiveRecord::Migration[5.2]
  	def self.up
		change_table :medicines do |t|
			t.attachment :photo
		end
	end

	def self.down
		remove_attachment :medicines, :photo
	end

end
