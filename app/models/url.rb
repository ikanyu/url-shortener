class Url < ActiveRecord::Base
  validates :long_url, presence: true
  validates :long_url, format: URI::regexp(%w(http https))
  validates :long_url, uniqueness: true
end