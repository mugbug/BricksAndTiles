Pod::Spec.new do |s|
    s.name                  = 'BricksAndTiles'
    s.version               = '0.0.3'
    s.summary               = 'A composable solution for building reusable lists in Swift/UIKit. As easy as playing with Legos.'
  
    s.homepage              = 'https://github.com/mugbug/BricksAndTiles'
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    s.author                = { 'mugbug' => 'zaronipedro@outlook.com' }
    s.source                = { :git => 'https://github.com/mugbug/BricksAndTiles.git', :tag => s.version.to_s }
    s.swift_version         = '5.1'
    s.ios.deployment_target = '11.0'

    s.dependency 'PaintAndBrush', '0.2.0'
  
    s.source_files = 'BricksAndTiles/Source/**/*.swift'
  
    s.subspec 'CollectionView' do |collectionView|
        collectionView.source_files = 'BricksAndTiles/Source/CollectionView/*.swift'
    end
  
    s.subspec 'TableView' do |tableView|
        tableView.source_files = 'BricksAndTiles/Source/TableView/*.swift', 'BricksAndTiles/Source/Extensions/*.swift'
    end
  end