class Image < ActiveRecord::Base

	validates_processing_of :image
	validate :image_size_validation
 
	mount_uploader :image, ImageUploader

	private
  		def image_size_validation  			
   			errors[:image] << "Bild muss kleiner als 3,5 MB sein" if image.size > 3.5.megabytes
 		 end

end
