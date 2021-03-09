require "simplecov"

SimpleCov.start

require "pry"
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"

require "./lib/composable"
require "./lib/dictionary"
require "./lib/message"
require "./lib/night_reader"
require "./lib/night_writer"
require "./lib/translator"
