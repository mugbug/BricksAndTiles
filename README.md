![stability-wip](https://img.shields.io/badge/stability-work_in_progress-lightgrey.svg) ![platforms](https://img.shields.io/badge/platforms-iOS-333333.svg) [![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

# BricksAndTiles

🧱 A composable solution for building reusable lists in Swift/UIKit. As easy as playing with Legos.

- [BricksAndTiles](#bricksandtiles)
- [Features](#features)
    - [UITableView](#uitableview)
    - [UICollectionView](#uicollectionview)
    - [UITableView + UICollectionView](#uitableview--uicollectionview)
- [Installation](#installation)
      - [Swift Package Manager](#swift-package-manager)
- [Contributing](#contributing)
- [Requirements](#requirements)
- [Authors](#authors)

# Features
### UITableView
- [x] Static cells
- [x] Draggable cells
- [x] Cells with actions on slide
- [x] Single selection

### UICollectionView
- [x] Static collection cells

### UITableView + UICollectionView
- [x] Horizontal list cells

# Installation

_BricksAndTiles_ currently supports these installation options:

#### Swift Package Manager

Add the following to your `Package.swift` file:

```
dependencies: [
    .package(
        url: "https://github.com/mugbug/BricksAndTiles.git", 
        from: "0.0.1"
    ),
]
```

If you're using SPM through Xcode:

1. Go to `File > Swift Packages > Add Package Dependency` 
2. Enter https://github.com/mugbug/BricksAndTiles
3. Choose a rule and submit.

For more information about how to get started with the Swift Package Manager, check out the [Official SPM website](https://swift.org/package-manager/) or the [SPM project on GitHub](https://github.com/apple/swift-package-manager).

# Contributing

Any kind of contributions would be highly appreciated! To start contributing, read the [Contributing Guideline](https://github.com/mugbug/BricksAndTiles/blob/master/CONTRIBUTING.md) for info on how to report issues, submit ideas and submit pull requests!


# Requirements
 -  OS versions iOS 8.0+ / Mac OS X 10.10+
 -  Xcode version 7.0+,8.0+,9.0+,10.0+,11.0+
 -  Swift version 2.2/2.3 , 3.2+ /4.x
# Authors

- [@mugbug](https://github.com/mugbug)
- [@emmendesf](https://github.com/emmendesf)
