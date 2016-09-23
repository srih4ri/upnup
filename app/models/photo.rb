class Photo < ApplicationRecord
  belongs_to :person
  mount_uploader :photo, PhotoUploader

  after_create :enqueue_altitude_extractor

  def enqueue_altitude_extractor
    PhotoAltitudeExtractorJob.perform_later id
  end
end
