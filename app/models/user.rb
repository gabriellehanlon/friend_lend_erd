require 'open-uri'
class User < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  
  include JwtToken
# Direct associations

  has_many   :saved_items,
             :dependent => :destroy

  has_many   :items_borrowed,
             :class_name => "LendTransaction",
             :foreign_key => "user_lending_id"

  has_many   :lend_transactions,
             :foreign_key => "lender_id"

  has_many   :preferences,
             :dependent => :destroy

  has_many   :closets,
             :dependent => :destroy

  # Indirect associations

  has_many   :styles,
             :through => :preferences,
             :source => :style

  has_many   :items,
             :through => :closets,
             :source => :items

  has_many   :letter_sizes,
             :through => :preferences,
             :source => :letter_size

  has_many   :number_sizes,
             :through => :preferences,
             :source => :number_size

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
