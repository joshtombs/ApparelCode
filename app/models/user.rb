class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :profile_name, presence: true, 
                           uniqueness: true,
                           format: {
                             with: /\A[a-z0-9_-]{6,16}+\Z/,
                             message: "Must be formatted correctly."
                           }

    validates :country, presence: true

    validates :gender, presence: true

    validates :age, presence: true,
    				format: {
    					with: /\A[0-9]{1,2}+\Z/,
    					message: "Must be a valid age."
    				}
end
