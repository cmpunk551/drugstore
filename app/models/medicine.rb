class Medicine < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :supplier, optional: true
  belongs_to :recipe, optional: true
  belongs_to :purchase_medicines, optional: true

  has_attached_file :photo, :styles => { index: '256x192!', show: '512x384!' }, :default_url => "/images/:style/any.png", 
	path: :path_filename_partition, url: :url_filename_partition
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	def path_filename_partition
		":rails_root/public/system/:class/:attachment/:style/:filename"
	end

	def url_filename_partition
		"/system/:class/:attachment/:style/:filename"
	end
	
	def self.search(search)
  		# where('LOWER(name) LIKE LOWER(?)', "%#{search}%")
  		all.reject {|i| i.name.downcase.match(search.downcase) == nil}
	end

end
