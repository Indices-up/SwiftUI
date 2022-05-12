//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by MBP on 2022/4/29.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
