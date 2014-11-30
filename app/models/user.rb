class User < ActiveRecord::Base
	has_secure_password

      validates :email, uniqueness: true
      validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i 
    
       validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..14},
                       :on => :create
      validates :phone, :numericality => true      
     
      def email=(value)
      value = value.strip.downcase
      write_attribute :email, value
      end
end
