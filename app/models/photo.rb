class Photo < ApplicationRecord
  belongs_to :person

  delegate :name, to: :person, allow_nil: true, prefix: true
  
  mount_uploader :photo, PhotoUploader

  def enqueue_altitude_extractor
    PhotoAltitudeExtractorJob.perform_later id
  end
end
