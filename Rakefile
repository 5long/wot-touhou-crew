require_relative 'scheme'

task :prep do
  mkdir_p "build"
end

task :build => :prep do
  scheme = Scheme.load_from_yaml("scheme.yaml")
  scheme.build("build")
end

task :clean do
  rm_rf "build"
end
