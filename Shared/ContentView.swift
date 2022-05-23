//
//  ContentView.swift
//  Shared
//
//  Created by 黃孟遠 on 2022/5/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        Text("Light: \(viewModel.fsm.state.icon)")
            .frame(width: 100, height: 100, alignment: .center)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
