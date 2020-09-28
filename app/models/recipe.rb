class Recipe < ApplicationRecord
	belongs_to :medicine, optional: true
end
