Pod::Spec.new do |s|

  s.name         = "SHMenu"
  s.version      = "0.0.1"
  s.summary      = "Implement simple but dynamic TableViewControllers easily. For example settings view."
  s.description  = <<-DESC

With interface builder you can implement TableViewController flows easily, but making it dynamically can be painful.
For example if you want to show or hide rows dynamically it becomes complicated.
With that bundle, you can implement the settings page of your app very fast.

                   DESC

  s.homepage     = "https://github.com/mikkokut/SHMenu"
  s.license      = "MIT"


  s.author             = { "Mikko Kutilainen" => "mikko93@gmail.com" }
  s.social_media_url   = "http://twitter.com/mikkokut"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/mikkokut/SHMenu.git", :tag => s.version }
  s.source_files  = "SHMenu/**/*.{swift}"
end
