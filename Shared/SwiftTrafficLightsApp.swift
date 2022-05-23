//
//  SwiftTrafficLightsApp.swift
//  Shared
//
//  Created by 黃孟遠 on 2022/5/23.
//

import SwiftUI

@main
struct SwiftTrafficLightsApp: App {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
