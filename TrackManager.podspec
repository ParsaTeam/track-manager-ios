
Pod::Spec.new do |s|
  s.name         = "TrackManager"
  s.version      = "0.0.9-alpha"
  s.summary      = "To be added..."
  s.description  = <<-DESC
  To be created...
                   DESC
  s.homepage     = "http://www.netcombo.com.br"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "AMX Apps"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ParsaTeam/track-manager-ios.git" ,:tag => "#{s.version}" }
  s.source_files = "TrackManager", "Classes/**/*.{h,m}"
end