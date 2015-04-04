#!/usr/bin/env ruby

require 'image_mover'

image_mover = ImageMover.new
image_mover.move ARGV[0], ARGV[1]