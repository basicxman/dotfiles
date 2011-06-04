#!/usr/bin/env ruby

# Deletes any Vim plugins that aren't in config.json.
# For use with Pathogen.

require 'json/pure'
require 'fileutils'

cur_dir = File.dirname(__FILE__) + "/"
repos   = JSON.parse(File.read(cur_dir + "config.json"))
folders = repos.map { |r| r["folder"] }

Dir.entries(cur_dir).each do |dir|
  if File.directory? dir and dir.index("vim-")
    unless folders.include? dir
      FileUtils.rm_rf cur_dir + dir
    end
  end
end
