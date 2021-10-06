//
//  PlaceholderImage.swift
//  AssetMaker
//
//  Created by David on 6/10/21.
//

import SwiftUI

struct PlaceholderImage: View {
    
    @Binding var image: NSImage
    var text: String
    var width: Double
    var height: Double
    
    var body: some View {
        VStack {
            
            Spacer()
            
            ZStack {
                Image(nsImage: image)
                    .resizable()
                    .frame(width: width, height: height)
                
                Rectangle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [10], dashPhase: 0))
                    .foregroundColor(Color.black.opacity(0.3))
                    .frame(width: width + 40, height: height + 40)

            }
            
            Spacer()
            
            Text(text)
        }
    }
}
