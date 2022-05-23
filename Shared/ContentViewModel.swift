//
//  ContentViewModel.swift
//  SwiftTrafficLights
//
//  Created by 黃孟遠 on 2022/5/23.
//

import Foundation
import SwiftUI
import Combine

class TrafficLightStateMachine: ObservableObject {
    enum State: String {
        case green
        case yellow
        case red
        
        var icon: String {
            switch self {
            case .green:
                return "🟢"
            case .yellow:
                return "🟡"
            case .red:
                return "🔴"
            }
        }
    }
    
    @Published var state: State = .red
    
    func goNextState() {
        switch state {
        case .red:
            state = .green
        case .green:
            state = .yellow
        case .yellow:
            state = .red
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var fsm = TrafficLightStateMachine()
    
    var anyCancellable: AnyCancellable? = nil
    init() {
        anyCancellable = fsm.objectWillChange.sink(receiveValue: { [weak self] in
            guard let self = self else { return }
            self.objectWillChange.send()
        })
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.fsm.goNextState()
        })
    }
}
