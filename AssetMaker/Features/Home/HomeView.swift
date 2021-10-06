//
//  ContentView.swift
//  AssetMaker
//
//  Created by David on 5/10/21.
//

import SwiftUI

struct HomeView: View {
    @State private var currentSubviewIndex: ViewToShow = .AssetResizer
    @State private var showingSubview = false
    
    var body: some View {
        StackNavigationView(
            currentSubviewIndex: self.$currentSubviewIndex,
            showingSubview: self.$showingSubview,
            subviewToShow: { view in
                self.subView(forView: view)
            }
        ) {
            HStack(spacing: 40) {
                
                HomeButton(imageName: "appicon_placeholder", color: Color("appicon_resizer"), title: "APP Icon resizer")
                    .onTapGesture {
                        showSubview(withView: .AppiconResizer)
                    }

                
                HomeButton(imageName: "asset", color: Color("asset_resizer"), title: "Asset resizer")
                    .onTapGesture {
                        showSubview(withView: .AssetResizer)
                    }
            }
            
        }
        .frame(width: 500, height: 500, alignment: .center)
        .background(Color("background"))
    }
    
    private func subView(forView view: ViewToShow) -> AnyView {
        switch view {
        case .AppiconResizer: return AnyView(AppiconResizerView())
        case .AssetResizer: return AnyView(AssetResizerView())
        default: return AnyView(Text("Inavlid Selection").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.red))
        }
    }
    
    private func showSubview(withView view: ViewToShow) {
        currentSubviewIndex = view
        showingSubview = true
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
