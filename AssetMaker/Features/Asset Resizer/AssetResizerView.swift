//
//  AssetResizerView.swift
//  AssetMaker
//
//  Created by David on 6/10/21.
//

import SwiftUI

struct AssetResizerView: View {
    
    @State var image = NSImage()
    @ObservedObject var presenter = AssetResizerPresenter()

    var body: some View {
        VStack (spacing: 50){
            
            DropImage(image: $image, color: Color("asset_resizer"), width: 160, height: 160)
            
            HStack (spacing: 35){
                PlaceholderImage(image: $image, text: "X1", width: 80, height: 80)
                PlaceholderImage(image: $image, text: "X2", width: 105, height: 105)
                PlaceholderImage(image: $image, text: "X3", width: 130, height: 130)

            }
            .frame(height: 210)
            
            Text("Export")
                .font(.title3)
                .padding(.horizontal,10)
                .padding(.vertical,4)
                .foregroundColor(.white)
                .background(Color("asset_resizer"))
                .clipShape(Capsule())
                .onTapGesture {
                    presenter.resizeAssetAndExport(image: self.image)
                }
        }
        .padding(.bottom,50)
        
        
    }
}

struct AssetResizerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetResizerView()
    }
}
