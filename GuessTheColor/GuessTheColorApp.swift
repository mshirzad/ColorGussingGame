//
//  GuessTheColorApp.swift
//  GuessTheColor
//
//  Created by Mati Shirzad on 2/28/21.
//

import SwiftUI

@main
struct GuessTheColorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
        }
    }
}
