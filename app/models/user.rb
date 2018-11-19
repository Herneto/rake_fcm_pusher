class User < ApplicationRecord
    validates_length_of :username, :minimum => 4, :allow_blank => false
    validates :fcm_token, presence: true
    validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
