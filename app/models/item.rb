class Item < ApplicationRecord
  mount_base64_uploader :photos, PhotoUploader

  # Direct associations

  belongs_to :number_size,
             :required => false

  belongs_to :letter_size,
             :required => false

  belongs_to :item_type,
             :counter_cache => true

  has_many   :saved_items,
             :dependent => :destroy

  has_many   :lend_transactions,
             :dependent => :nullify

  belongs_to :closet,
             :counter_cache => true

  belongs_to :style,
             :required => false,
             :counter_cache => true

  # Indirect associations

  has_one    :user,
             :through => :closet,
             :source => :user

  # Validations

  validates :item_name, :presence => { :message => "Please label item" }

  validates :item_type_id, :presence => { :message => "Please select an item type" }

  validates :photos, :presence => true

  # Scopes

  def to_s
    closet.to_s
  end

end
