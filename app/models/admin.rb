class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

 attr_accessor :instance 

#  def self.phone_number
#    self.instance.phone_number
#  end

# def self.occupation
#    self.instance.occupation
# end

self.attribute_names.map(&:to_sym).each do |attribute|

 define_singleton_method(attribute) do 
   self.instance.try(attribute)
 end

end
 

private 

def self.instance
 @@instance ||= Admin.first
end


end
