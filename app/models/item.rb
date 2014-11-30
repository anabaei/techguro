class Item < ActiveRecord::Base
has_attached_file :avatar, :styles => { :small => "150x150>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


validates_attachment_size :avatar, :less_than => 5.megabytes
validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  validates :count, :numericality => true
  validates :stock, :numericality => true
    def self.search(search)
       where('tags LIKE ?', "%#{search}%")
   end
   
    def self.search2(search)
       where('name LIKE ?', "%#{search}%")
   end
    
end
