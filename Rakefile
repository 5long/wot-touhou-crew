require_relative 'scheme'
require "zip"
require "rake/clean"

CLEAN << 'build' << FileList['*.zip']

task :prep do
  mkdir_p "build"
end

task :build => :prep do
  scheme = Scheme.load_from_yaml("scheme.yaml")
  scheme.build("build")
end

task :zip do
  Zip::File.open "touhou-crew.zip", Zip::File::CREATE do |z|
    Dir["build/**/**"].each do |f|
      z.add(f.sub("build/", ""), f)
    end
    z.add("README.txt", "README-RELEASE.txt")
  end
end

task :rebuild => [:clean, :build, :zip]
task :release, [:ver] do |t, args|
  cp "touhou-crew.zip", "touhou-crew-#{args.ver}.zip"
end
