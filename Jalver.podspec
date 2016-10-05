Pod::Spec.new do |s|
  s.name             = "Jalver"
  s.version          = "0.1.0"
  s.summary          = "Lightweight Swift factory framework to resolve dependencies."
  s.tvos.deployment_target = '9.0'
  s.ios.deployment_target = '9.0'
  s.description      = <<-DESC
                       Jalver is a Lightweight Swift factory framework to resolve dependencies, based in a single idea,
                       take back the control of your code.
                       DESC

  s.homepage         = "https://github.com/julianalonso/Jalver"
  s.license          = 'MIT'
  s.author           = { "Julian Alonso" => "julian.alonso.dev@gmail.com" }
  s.source           = { :git => "https://github.com/julianalonso/Jalver.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/SmokeJuli'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*.swift'

end
