//
//  ContentView.swift
//  mobproj20210527
//
//  Created by selfoulger on 5/27/21.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        Image("FullSizeRender")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                rotateImage()                
            }
    }
    
    func rotateImage() {
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

