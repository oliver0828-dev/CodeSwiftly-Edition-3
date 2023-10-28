//
//  CodeSwiftlyApp.swift
//  CodeSwiftly
//
//  Created by Oliver Park on 2023/09/19.
//

import SwiftUI

@main
struct CodeSwiftlyApp: App {
    var progressData = ProgressData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressData)
        }
    }
}
