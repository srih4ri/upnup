namespace :extract_photo_altitudes do
  desc 'Extract and save altitudes for all photos'
  task all: [:environment] do
    Photo.where(altitude: nil).find_each do |photo|
      puts "Processing photo ##{photo.id}"
      PhotoAltitudeExtractorJob.perform_later photo.id
    end
  end
end
