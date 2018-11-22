class User < ApplicationRecord
    validates_length_of :username, :minimum => 4, :allow_blank => false
    validates :fcm_token, presence: true
    validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

    def self.loadCSV(file)
        errors = Hash.new        
        if !ImportHelper.valid_extension?(file)
            errors[:file_extention] = "Formato não admitido."
            return errors
        end
        
        CSV.foreach(file.path, headers: true) do |row|
            if !ImportHelper.valid_headers?(row = row.to_hash)
                errors[:valid_headers] = "Os campos do ficheiro . csv não são válidos."
                return errors
            elsif !ImportHelper.valid_fields?(row)
                errors[:valid_headers] = "Um ou mais valores associados ao username ou email inválidos."
                return errors
            end
            User.create! row
        end
    end
end
