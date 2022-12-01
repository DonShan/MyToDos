//
//  ContentView.swift
//  MyToDos
//
//  Created by Madushan Senavirathna on 2022-11-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
         ImageView()
                .tabItem {
                    Text("image")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
