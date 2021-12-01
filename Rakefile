# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

rt = RSpec::Core::RakeTask.new(:spec)
rt.pattern = "spec/\*\*\{,/\*/\*\*\}/\*_spec.rb"

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]
