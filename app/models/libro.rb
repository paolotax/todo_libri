class Libro < ActiveRecord::Base
  belongs_to :settore
  
  mount_uploader :image, ImageUploader
  
  def settore_nome=(nome)
    self.settore = Settore.find_by_nome(nome)
  end

end
  
  