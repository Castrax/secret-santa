class SantaMailer < ApplicationMailer

  default from: "hello@santa.com"

  def santa_send(event, friends)
    @event = event
    @friends = friends
    @friends.each do |friend|
      mail(to: "#{friend.email}", subject: "Votre santa révélé !")
    end
  end
end
