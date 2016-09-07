class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
                          # i: Perform case-insensitive matching
                          # g: Perform a global match (find all matches rather than stopping after the first match)
                          # m: Perform multiline matching
                          with:    %r{\.(gif|jpg|png)\Z}i,
                          message: 'must be a URL for GIF, JPG or PNG image.'
                      }

  validates :title, length: {minimum: 5}
  # validates :title, length: 10
  # validates :title, length: 10..20
end
