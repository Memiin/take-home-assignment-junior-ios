//
//  swiftui_testApp.swift
//  swiftui_test
//
//  Created by Guillermo Jimenez on 22/3/22.
//

import SwiftUI
import URLImage
import URLImageStore


@main
struct swiftui_testApp: App {
    var body: some Scene {
        let urlImageService = URLImageService(fileStore: nil, inMemoryStore: URLImageInMemoryStore())

        WindowGroup {
            ContentView().environment(\.urlImageService, urlImageService)
        }
    }
}
