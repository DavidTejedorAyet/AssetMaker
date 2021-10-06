//
//  DropImage.swift
//  AssetMaker
//
//  Created by David on 6/10/21.
//

import SwiftUI


struct DropImage: View {
    @Binding var image: NSImage
    @State private var dragOver = false
    @State var text = "Drop image here"
    
    var color: Color? = .red
    var width: Double
    var height: Double
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                Image(nsImage: image)
                    .resizable()
                    .onDrop(of: ["public.file-url"], isTargeted: $dragOver) { providers -> Bool in
                        providers.first?.loadDataRepresentation(forTypeIdentifier: "public.file-url", completionHandler: { (data, error) in
                            if let data = data, let path = NSString(data: data, encoding: 4), let url = URL(string: path as String) {
                                let image = NSImage(contentsOf: url)
                                DispatchQueue.main.async {
                                    self.image = image ?? NSImage()
                                    self.text = ""
                                }
                            }
                        })
                        return true
                    }
                    .onDrag {
                        let data = self.image.tiffRepresentation
                        let provider = NSItemProvider(item: data as NSSecureCoding?, typeIdentifier: kUTTypeTIFF as String)
                        provider.previewImageHandler = { (handler, _, _) -> Void in
                            handler?(data as NSSecureCoding?, nil)
                        }
                        return provider
                    }
                    .frame(width: width, height: height)
                
                Text(text)
                
                Rectangle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 5, dash: [12], dashPhase: 0))
                    .foregroundColor(dragOver ? color : Color.black)
                    .frame(width: width + 60, height: height + 60)
                    .shadow(radius: 4)

            }
            
            Text("Original image")

        }
    
        
    }
}
