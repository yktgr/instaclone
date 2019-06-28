class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.user.email, subject:"投稿が完了しました"
  end
end
