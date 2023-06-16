//
//  ContentView.swift
//  WailingWall
//
//  Created by Sunjoo IM on 2023/06/08.
//

import SwiftUI

struct ContentView: View {
    
    @State var tears = 0
    
    func wailAction() {
        tears += 1
    }
    
    var body: some View {
        ZStack {
            
            Image("wall")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Color.black.ignoresSafeArea()
                .opacity(0.3)
            
            VStack {
                Spacer()
                    .frame(height: 500)
                
                ZStack {
                    
                    Image("crying")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 5)
                        .onTapGesture {
                            wailAction()
                        }
                    
                    ForEach (0..<tears, id: \.self) { tear in
                        Image("crying")
                            .resizable()
                            .scaledToFit()
                            .shadow(radius: 5)
                            .modifier(WailTapModifier())
                    }
                }
                
                Spacer()
                    .frame(height: 60)
            }
                        
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
