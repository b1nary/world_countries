#!/usr/bin/env ruby

require 'json'
require 'yaml'

Dir.glob("data/*").each do |dir|
	language = dir.split("/").last
	new_data = {}
	data = JSON.parse(File.open("#{dir}/countries.json").read)
	data.each do |country|
		new_data[country['alpha2']] = country['name']
	end
	File.open("i18n/world_countries.#{language}.yml", "w"){ |f|
		f.write(
		{ :"#{language}" => 
			{ countries:  new_data }
		}.to_yaml
		)
	}
end
