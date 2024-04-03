class PassengerMailer < ApplicationMailer
  default from: 'jonny.meneses.test@gmail.com'

  def booking_confirm_email
    puts 'Booking confirm triggered!'
    @passenger = params[:passenger]
    @booking = params[:booking]
    mail(to: @passenger.email, subject: "Booking Confirmation for #{@passenger.name}")
  end
end
