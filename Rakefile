require_relative 'scheme'
require "zip"

task :prep do
  mkdir_p "build"
end

task :build => :prep do
  scheme = Scheme.load_from_yaml("scheme.yaml")
  scheme.build("build")
end

task :clean do
  rm_rf "build", "touhou-crew.zip"
end

task :zip do
  Zip::File.open "touhou-crew.zip", Zip::File::CREATE do |z|
    Dir["build/**/**"].each do |f|
      z.add(f.sub("build/", ""), f)
    end
  end
end
