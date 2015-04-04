#!/usr/bin/env ruby

require 'photo_mover'

photo_mover = PhotoMover.new
photo_mover.move ARGV[0], ARGV[1]