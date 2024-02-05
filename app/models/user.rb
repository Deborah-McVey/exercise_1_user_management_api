class User < ApplicationRecord
    # validations
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :email, presence: true, uniqueness: true, length: { minimum: 5, maximum: 255 }, format: {
        with: URI::MailTo::EMAIL_REGEXP
    }
    validates :age, presence: true, numericality: { in: 18..100 }
    # associations
    before_create :downcase_email

    private

    def downcase_email
      self.email = email.downcase
    end
end

#Ensure the name and email are always present.
#Validate that the email is unique.
#Validate that the email has a valid format.
#Validate that the email has a minimum length of 5 characters.
#Validate that the email has a maximum length of 255 characters.
#Validate that the name has a minimum length of 3 characters.
#Validate that the name has a maximum length of 50 characters.
#Validate that the email is in lowercase before saving.

#Ensure the age is always present.
#Validate that the age is a number.
#Validate that the age is greater than or equal to 18.
#Validate that the age is less than or equal to 100.