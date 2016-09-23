class PhotoAltitudeExtractorJob < ApplicationJob
  queue_as :default

  def perform(photo_id)
    photo = Photo.where(id: photo_id).first
    if photo.present?
      altitude = photo.photo.altitude_m || 0
      Rails.logger.info "Setting altitude of photo ##{photo_id} as #{altitude}"
      photo.altitude = altitude
      photo.save!
    end
  end
end
