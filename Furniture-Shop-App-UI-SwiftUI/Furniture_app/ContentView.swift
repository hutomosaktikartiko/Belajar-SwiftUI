//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("Bg").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                HStack {
                    Button(action: {}) {
                        Image("menu").padding().background(Color(.white)).cornerRadius(10.0)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(uiImage: #imageLiteral(resourceName: "Profile")).resizable().frame(width: 42, height: 42 ).cornerRadius(10.0)
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
