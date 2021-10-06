//
//  AppiconResizerPresenter.swift
//  AssetMaker
//
//  Created by David on 6/10/21.
//

import Foundation
import AppKit

class AppiconResizerPresenter: ObservableObject {
    
    let finderHelper = FinderHelper()
    
    func resizeAssetAndExportForIOS(image: NSImage) {
        guard image.isValid else { return }
    
        let image20 = image.resizeImage(newSize: NSSize(width: 20, height: 20))
        let image29 = image.resizeImage(newSize: NSSize(width: 29, height: 29))
        let image40 = image.resizeImage(newSize: NSSize(width: 40, height: 40))
        let image58 = image.resizeImage(newSize: NSSize(width: 58, height: 58))
        let image60 = image.resizeImage(newSize: NSSize(width: 60, height: 60))
        let image76 = image.resizeImage(newSize: NSSize(width: 76, height: 76))
        let image80 = image.resizeImage(newSize: NSSize(width: 80, height: 80))
        let image87 = image.resizeImage(newSize: NSSize(width: 87, height: 87))
        let image120 = image.resizeImage(newSize: NSSize(width: 120, height: 120))
        let image152 = image.resizeImage(newSize: NSSize(width: 152, height: 152))
        let image167 = image.resizeImage(newSize: NSSize(width: 167, height: 167))
        let image180 = image.resizeImage(newSize: NSSize(width: 180, height: 180))
        let image1024 = image.resizeImage(newSize: NSSize(width: 1024, height: 1024))

        if let url = finderHelper.chooseFolder() {
            finderHelper.saveImageOnDisk(image: image20, url: url, sufix: "/20.png")
            finderHelper.saveImageOnDisk(image: image29, url: url, sufix: "/29.png")
            finderHelper.saveImageOnDisk(image: image40, url: url, sufix: "/40.png")
            finderHelper.saveImageOnDisk(image: image58, url: url, sufix: "/58.png")
            finderHelper.saveImageOnDisk(image: image60, url: url, sufix: "/60.png")
            finderHelper.saveImageOnDisk(image: image76, url: url, sufix: "/76.png")
            finderHelper.saveImageOnDisk(image: image80, url: url, sufix: "/80.png")
            finderHelper.saveImageOnDisk(image: image87, url: url, sufix: "/87.png")
            finderHelper.saveImageOnDisk(image: image120, url: url, sufix: "/120.png")
            finderHelper.saveImageOnDisk(image: image152, url: url, sufix: "/152.png")
            finderHelper.saveImageOnDisk(image: image167, url: url, sufix: "/167.png")
            finderHelper.saveImageOnDisk(image: image180, url: url, sufix: "/180.png")
            finderHelper.saveImageOnDisk(image: image1024, url: url, sufix: "/1024.png")
        }
    }
    
    func resizeAssetAndExportForMacOS(image: NSImage) {
        guard image.isValid else { return }
    
        let image16 = image.resizeImage(newSize: NSSize(width: 16, height: 16))
        let image32 = image.resizeImage(newSize: NSSize(width: 32, height: 32))
        let image64 = image.resizeImage(newSize: NSSize(width: 64, height: 64))
        let image128 = image.resizeImage(newSize: NSSize(width: 128, height: 128))
        let image256 = image.resizeImage(newSize: NSSize(width: 256, height: 256))
        let image512 = image.resizeImage(newSize: NSSize(width: 512, height: 512))
        let image1024 = image.resizeImage(newSize: NSSize(width: 1024, height: 1024))

        if let url = finderHelper.chooseFolder() {
            finderHelper.saveImageOnDisk(image: image16, url: url, sufix: "/16.png")
            finderHelper.saveImageOnDisk(image: image32, url: url, sufix: "/32.png")
            finderHelper.saveImageOnDisk(image: image64, url: url, sufix: "/64.png")
            finderHelper.saveImageOnDisk(image: image128, url: url, sufix: "/128.png")
            finderHelper.saveImageOnDisk(image: image256, url: url, sufix: "/256.png")
            finderHelper.saveImageOnDisk(image: image512, url: url, sufix: "/512.png")
            finderHelper.saveImageOnDisk(image: image1024, url: url, sufix: "/1024.png")
        }
    }
    
}
