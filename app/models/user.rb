class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_and_belongs_to_many :roles
  
  def title
    firstname+' ' +lastname
  end
  
  def full_name
    firstname+' ' +middlename+' ' +lastname
  end
end
