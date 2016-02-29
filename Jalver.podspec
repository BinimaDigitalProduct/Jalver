Pod::Spec.new do |s|
  s.name             = "Jalver"
  s.version          = "0.1.0"
  s.summary          = "Lightweight Swift factory framework to resolve dependencies."
  s.tvos.deployment_target = '9.0'
  s.ios.deployment_target = '9.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
                       Jalver is a Lightweight Swift factory framework to resolve dependencies.
                       DESC

  s.homepage         = "https://github.com/julianalonso/Jalver"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Julian Alonso" => "julian.alonso.dev@gmail.com" }
  s.source           = { :git => "https://github.com/julianalonso/Jalver.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Jalver/**/*.swift'
  #s.resource_bundles = {
  #  'Jalver' => ['Jalver/Assets/*.png']
  #}

end
