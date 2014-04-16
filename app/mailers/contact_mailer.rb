class ContactMailer < ActionMailer::Base
    default to: "brooks85.ty@gmail.com"

    def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body

        mail(from: email, subject: 'Chef Genius Contact')
    end
end