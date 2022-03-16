class Style < ApplicationRecord
  # Direct associations

  has_many   :items,
             :dependent => :nullify

  # Indirect associations

  # Validations

  validates :style_name, :uniqueness => { :message => "This style type already exists" }

  validates :style_name, :presence => { :message => "Enter new style name" }

  # Scopes

  def to_s
    style_name
  end

end
