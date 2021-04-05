class Cat < ApplicationRecord
    
validates :session_token, :username,  presence: true, uniqueness: true
validates :password_digest, presence: true 
validates :password, length: {minimum 6, allow_nill: true }


end