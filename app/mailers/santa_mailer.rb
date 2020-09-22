class SantaMailer < ApplicationMailer

  default from: "hello@santa.com"

  def santa_send(event, friend, santa)
    @event = event
    @friend = friend
    @santa = santa
    mail(to: "#{friend.email}", subject: "Votre santa révélé !")
  end
end
