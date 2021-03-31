class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    ride_error = ""
    if user.tickets < attraction.tickets
      ride_error += "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      if ride_error == ""
        ride_error += "Sorry. You are not tall enough to ride the #{attraction.name}."
      else
        ride_error += " You are not tall enough to ride the #{attraction.name}."
      end
    end
    return ride_error unless ride_error == ""
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.tickets -= attraction.tickets
    user.save
    attraction.save
    "Thanks for riding the #{attraction.name}!"
  end
end
