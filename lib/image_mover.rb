require 'fileutils'
require 'exifr'

class ImageMover

  attr_reader :source_path, :destination_path

  # ImageMover.new("/Users/robertjan/Pictures/Foto's/camera", "/Volumes/pictures/photos/Import").move
  def initialize source_path, destination_path
    @source_path = source_path
    @destination_path = destination_path
  end

  def move
    Dir.glob("#{source_path}/**/*.jpg").each do |filename|
      move_file filename
    end
  end

  private

  def move_file filename
    if File.file?(filename) && !(File.basename(filename) =~ /\.jpg$/i).nil?
      exif_data = EXIFR::JPEG.new(filename)
      date_time = exif_data.date_time_original || exif_data.date_time || File.mtime(filename)

      year_dir = File.join [destination_path, date_time.strftime("%Y")]
      month_dir = File.join [year_dir, date_time.strftime("%m")]
      date_dir = File.join [month_dir, date_time.strftime("%Y-%m-%d")]
      new_filename = File.join [date_dir, File.basename(filename)]

      if File.file?(new_filename)
        puts "Removing already existing file: #{filename}"
        FileUtils.rm(filename)
      else
        unless File.directory?(year_dir)
          puts "Creating directory: #{year_dir}"
          FileUtils.mkdir(year_dir)
        end

        unless File.directory?(month_dir)
          puts "Creating directory: #{month_dir}"
          FileUtils.mkdir(month_dir)
        end

        unless File.directory?(date_dir)
          puts "Creating directory: #{date_dir}"
          FileUtils.mkdir(date_dir)
        end

        puts "Moving: #{File.basename(filename)} to: #{new_filename}"
        FileUtils.mv(filename, new_filename)
      end
    end
  rescue => e
    puts "Error with #{filename}: #{e.message}"
  end
end