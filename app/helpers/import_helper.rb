module ImportHelper
    def self.valid_extension?(file)
        File.extname(file.path) == ".csv"
    end
    def self.valid_headers?(headers)
        headers.has_key?("username") && headers.has_key?("fcm_token") && headers.has_key?("email")
    end
    def self.valid_fields?(fields)
        fields["username"].length >= 4 && fields["email"] =~ /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    end
end
