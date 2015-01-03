require "yaml"
require "fileutils"

require_relative "shojo"
require_relative "country"

class Scheme < Struct.new(:countries)
  include FileUtils

  def self.load_from_yaml(file)
    countries = []
    YAML.load_file(file).each do |country_name, shojos|
      shojos = shojos.map{|name| Shojo.new(name)}
      countries << Country.new(country_name, shojos)
    end
    self.new(countries)
  end

  def build(build_dir)
    cd build_dir do
      root = "gui/maps/icons/tankmen/icons"
      mkdir_p root
      cd root do
        mkdir_p %w( barracks big small )
        countries.each {|c| build_country c}
      end
    end
  end

  def build_country c
    c.shojos.each_with_index do |shojo, i|
      next if shojo.empty?
      ln_f shojo.pic_big, "big/#{c.name}-#{i + 1}.png"
      ln_f shojo.pic_small, "small/#{c.name}-#{i + 1}.png"
      ln_f shojo.pic_barracks, "barracks/#{c.name}-#{i + 1}.png"
    end
  end

  def ln_f old, new
    ln old, new, force: true
  end

  def validate!
    countries.each {|c| c.validate!}
  end
end
