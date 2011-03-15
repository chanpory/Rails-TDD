class User < ActiveRecord::Base
  
  validates :first_name, :last_name, :email, :presence => true

  validates :email,   
              :presence => true,
              :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  def full_name
    middle = middle_name ? " #{middle_name} " : " "
    first_name + middle + last_name
    
    # middle = middle_name ? " #{middle_name} " : " "
    # first_name + " " + middle + last_name

  end
  
end
