# Uncomment the next line to define a global platform for your project
project 'Marvelicious.xcodeproj'

platform :ios, '11'

inhibit_all_warnings!
use_frameworks!

def shared_pods
# Network
pod 'Alamofire', '~> 4.5'
pod 'Kingfisher', '~> 4.0'

#Mapper
pod 'ObjectMapper', '~> 3.3'
pod 'AlamofireObjectMapper'

#Crypt
pod 'CryptoSwift'
end

target 'Marvelicious' do
  # Comment the next line if you don't want to use dynamic frameworks
use_frameworks!
# Shared pods
shared_pods
  # Pods for Marvelicious

end
