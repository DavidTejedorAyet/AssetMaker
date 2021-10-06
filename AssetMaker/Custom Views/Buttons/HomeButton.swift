//
//  HomeButton.swift
//  AssetMaker
//
//  Created by David on 6/10/21.
//

import SwiftUI

struct HomeButton: View {
    
    var imageName: String
    var color: Color
    var title: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(color)
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(color)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(width: 150, height: 150)
        .background(ContainerRelativeShape().fill(Color.white))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(color, lineWidth: 5)
        )
        .shadow(radius: 4)
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton(imageName: "asset", color: Color("asset_resizer"), title: "Asset resizer")
    }
}
