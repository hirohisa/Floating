Pod::Spec.new do |s|

  s.name         = "Floating"
  s.version      = "0.0.1"
  s.summary      = "Floating is a very flexible overlay library."
  s.description  = <<-DESC
Floating is a very flexible and simple overlay library.
DESC

  s.homepage     = "https://github.com/hirohisa/Floating"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Hirohisa Kawasaki" => "hirohisa.kawasaki@gmail.com" }

  s.source       = { :git => "https://github.com/hirohisa/Floating.git", :tag => s.version }

  s.source_files = "Floating/**/*.{h,swift}"
  s.requires_arc = true
  s.ios.deployment_target = '10.0'
end
