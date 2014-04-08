require_relative 'scheme'
require "zip"
require "rake/clean"

CLEAN << 'build' << FileList['*.zip']

task :prep do
  mkdir_p "build"
end

desc "build mod from scheme"
task :build => :prep do
  scheme = Scheme.load_from_yaml("scheme.yaml")
  scheme.build("build")
end

desc "package mod as .zip"
task :zip do
  Zip::File.open "touhou-crew.zip", Zip::File::CREATE do |z|
    Dir["build/**/**"].each do |f|
      z.add(f.sub("build/", ""), f)
    end
    z.add("README.txt", "README-RELEASE.txt")
  end
end

desc "build everything from scratch"
task :rebuild => [:clean, :build, :zip]

desc "release as version `ver`"
task :release, [:ver] do |t, args|
  cp "touhou-crew.zip", "touhou-crew-#{args.ver}.zip"
end
