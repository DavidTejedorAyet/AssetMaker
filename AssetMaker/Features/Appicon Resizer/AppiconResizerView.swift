//
//  AppiconResizerView.swift
//  AssetMaker
//
//  Created by David on 6/10/21.
//

import SwiftUI

enum PlatformTarget {
    case iOS
    case MacOS
}

struct AppiconResizerView: View {
    
    @State var target: Bool = false
    @State var image = NSImage()
    @ObservedObject var presenter = AppiconResizerPresenter()
    
    var body: some View {
        VStack (spacing: 50){
            
            DropImage(image: $image, color: Color("appicon_resizer"), width: 160, height: 160)
            
            HStack {
                Text("MacOS")
                
                Toggle("", isOn: $target)
                    .toggleStyle(SwitchToggleStyle(tint: Color("appicon_resizer")))
                
                Text("iOS")
            }
            
            
            Text("Export")
                .font(.title3)
                .padding(.horizontal,10)
                .padding(.vertical,4)
                .foregroundColor(.white)
                .background(Color("appicon_resizer"))
                .clipShape(Capsule())
                .onTapGesture {
                    if target {
                        presenter.resizeAssetAndExportForIOS(image: self.image)
                        
                    } else {
                        presenter.resizeAssetAndExportForMacOS(image: self.image)
                    }
                }
        }
        .padding(50)
        
    }
}

struct AppiconResizerView_Previews: PreviewProvider {
    static var previews: some View {
        AppiconResizerView()
    }
}
