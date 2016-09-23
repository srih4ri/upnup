class Photo < ApplicationRecord
  belongs_to :person
  mount_uploader :photo, PhotoUploader

  def enqueue_altitude_extractor
    PhotoAltitudeExtractorJob.perform_later id
  end
end
