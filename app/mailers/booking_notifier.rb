class BookingNotifier < ActionMailer::Base
  def notify(booking)
    @booking = booking
    mail to: "hu.igakuten52.lect@gmail.com"
  end
end
