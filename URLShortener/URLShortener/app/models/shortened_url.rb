# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string
#  long_url   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, uniqueness: true

  def self.random_code
    short = SecureRandom.urlsafe_base64
    if ShortenedUrl.exists?(short_url: short)
      self.random_code
    else
      short
    end
  end

  def self.create!(user, long_url)
    instance = ShortenedUrl.new(user_id: user.id, long_url: long_url, short_url: self.random_code)
    instance.save!
    instance
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visits.distinct.count
  end

  def num_recent_uniques
    self.visits.where(created_at: (20.minutes.ago..Time.now)).distinct.count
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :user
end
