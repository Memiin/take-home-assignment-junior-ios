//
//  ContentView.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CartView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
