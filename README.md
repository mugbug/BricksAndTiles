![stability-wip](https://img.shields.io/badge/stability-work_in_progress-lightgrey.svg) ![platforms](https://img.shields.io/badge/platforms-iOS-333333.svg) [![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

# BricksAndTiles

🧱 A composable solution for building reusable lists in Swift/UIKit. As easy as playing with Legos.

  - [Features](#features)
    - [UITableView](#uitableview)
    - [UICollectionView](#uicollectionview)
    - [UITableView + UICollectionView](#uitableview--uicollectionview)
  - [Installation](#installation)
      - [Swift Package Manager](#swift-package-manager)
  - [Dependencies](#dependencies)
  - [Contributing](#contributing)
  - [Authors](#authors)

## Features

### UITableView
- [x] Static cells
- [x] Draggable cells

![](demoAssets/draggable.gif)

- [x] Cells with actions on slide

![](demoAssets/slide_actions.gif)

- [x] Single selection

![](demoAssets/selectable.gif)

### UICollectionView
- [x] Static collection cells

![](demoAssets/collection.gif)

- [x] Grid collection cells

![](demoAssets/grid.gif)

### UITableView + UICollectionView
- [x] Horizontal list cells

![](demoAssets/horizontal_sliders.gif)

## Installation

_BricksAndTiles_ currently supports these installation options:

#### Swift Package Manager

Add the following to your `Package.swift` file:

```
dependencies: [
    .package(
        url: "https://github.com/mugbug/BricksAndTiles.git", 
        from: "0.0.2"
    ),
]
```

If you're using SPM through Xcode:

1. Go to `File > Swift Packages > Add Package Dependency` 
2. Enter https://github.com/mugbug/BricksAndTiles
3. Choose a rule and submit.

For more information about how to get started with the Swift Package Manager, check out the [Official SPM website](https://swift.org/package-manager/) or the [SPM project on GitHub](https://github.com/apple/swift-package-manager).

## Dependencies

This package depends on [PaintAndBrush](https://github.com/mugbug/PaintAndBrush), which is a super lightweight package with helper extensions for building UIKit views in code.

## Contributing

Any kind of contributions would be highly appreciated! To start contributing, read the [Contributing Guideline](https://github.com/mugbug/BricksAndTiles/blob/master/CONTRIBUTING.md) for info on how to report issues, submit ideas and submit pull requests!

## Authors

- [@mugbug](https://github.com/mugbug)
- [@emmendesf](https://github.com/emmendesf)
