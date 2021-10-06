//
//  NavigationStackView.swift
//  AssetMaker
//
//  Created by David on 6/10/21.
//

import SwiftUI

enum ViewToShow {
    case Home
    case AppiconResizer
    case AssetResizer
}

struct StackNavigationView<RootContent, SubviewContent>: View where RootContent: View, SubviewContent: View {
    
    @Binding var currentSubviewIndex: ViewToShow
    @Binding var showingSubview: Bool
    let subviewToShow: (ViewToShow) -> SubviewContent
    let rootView: () -> RootContent
    
    var body: some View {
        VStack {
            VStack{
                if !showingSubview { // Root view
                    rootView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(AnyTransition.move(edge: .leading)).animation(.default)
                }
                if showingSubview { // Correct subview for current index
                    
                    NavigationBar(showingSubview: $showingSubview, view: $currentSubviewIndex)
                    
                    self.subviewToShow(self.currentSubviewIndex)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(AnyTransition.move(edge: .trailing)).animation(.default)
                }
            }
        }
    }
    
    init(currentSubviewIndex: Binding<ViewToShow>, showingSubview: Binding<Bool>, @ViewBuilder subviewToShow: @escaping (ViewToShow) -> SubviewContent, @ViewBuilder rootView: @escaping () -> RootContent) {
        self._currentSubviewIndex = currentSubviewIndex
        self._showingSubview = showingSubview
        self.subviewToShow = subviewToShow
        self.rootView = rootView
    }
    
    private struct NavigationBar: View {
        @Binding var showingSubview: Bool
        @Binding var view: ViewToShow
        var body: some View {
            ZStack {
                switch view {
                case .AssetResizer:
                    Color("asset_resizer")
                case .AppiconResizer:
                    Color("appicon_resizer")
                default:
                    Color("background")
                }
                HStack { // Back button
                    Button(action: {
                        self.showingSubview = false
                    }) {
                        Text("< Back")
                            .foregroundColor(.white)
                    }.buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
            .padding(.horizontal).padding(.vertical, 4)
            }
            .frame(height: 45)
        }
    }
}
