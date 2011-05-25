#!/usr/bin/env ruby

# Update Vim plugins via Git repositories specificed in config.json.
# For use with Pathogen.  

require 'json/pure'

pipe = "> /dev/null 2>&1" if ARGV[0].nil?
cur_dir = File.dirname(__FILE__) + "/"
repos = JSON.parse(File.read(cur_dir + "config.json"))
repos.each do |repo|
  folder_path = cur_dir + repo["folder"]
  repo_url = repo["repo-url"]

  if File.exists? folder_path
    puts "Updating #{folder_path} [#{repo_url}]."
    `cd #{folder_path} && git pull origin master #{pipe}`
  else
    puts "Cloning #{repo_url} into #{folder_path}."
    `git clone #{repo_url} #{folder_path} #{pipe}`
  end
end
