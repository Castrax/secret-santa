class SantaMailer < ApplicationMailer

  default from: "hello@santa.com"

  def santa_send(event, friend)
    @event = event
    @friend = friend
    @friend.each do |f|
      mail(to: "#{f.email}", subject: "Votre santa révélé !")
    end
  end
end
