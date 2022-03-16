class User < ApplicationRecord
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
