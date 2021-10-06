//
//  AssetResizerPresenter.swift
//  AssetMaker
//
//  Created by David on 6/10/21.
//

import Foundation
import AppKit

class AssetResizerPresenter: ObservableObject {
    
    let finderHelper = FinderHelper()
    
    func resizeAssetAndExport(image: NSImage) {
        guard image.isValid else { return }
        let sizeX1 = image.size
        let sizeX2 = NSSize(width: sizeX1.width * 2, height: sizeX1.height * 2)
        let sizeX3 = NSSize(width: sizeX1.width * 3, height: sizeX1.height * 3)

        let imageX1 = image
        let imageX2 = image.resizeImage(newSize: sizeX2)
        let imageX3 = image.resizeImage(newSize: sizeX3)
        
        if let url = finderHelper.chooseFolderWithName() {
            finderHelper.saveImageOnDisk(image: imageX1, url: url, sufix: "@1x.png")
            finderHelper.saveImageOnDisk(image: imageX2, url: url, sufix: "@2x.png")
            finderHelper.saveImageOnDisk(image: imageX3, url: url, sufix: "@3x.png")
        }
    }
    
}
