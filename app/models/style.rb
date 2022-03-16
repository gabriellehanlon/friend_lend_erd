class Style < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :style_name, :presence => { :message => "Enter new style name" }

  # Scopes

  def to_s
    style_name
  end

end
