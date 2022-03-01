Pod::Spec.new do |s|
  s.name         = "XNGNotificationProxy"
  s.version      = "1.0.1"
  s.summary      = "A replacement of custom NSNotification using NSProxy."
  s.homepage     = "https://github.com/xuning0/XNGNotificationProxy"
  s.license      = "MIT"
  s.author       = { "XuNing" => "xuning0@outlook.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/xuning0/XNGNotificationProxy.git", :tag => "#{s.version}" }
  s.requires_arc = true

  s.source_files = "XNGNotificationProxy/*.{h,m}"
end
