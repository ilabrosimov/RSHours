//
//  CheckRSHoursApp.swift
//  CheckRSHours
//
//  Created by ilabrosimov on 25.12.2021.
//

import SwiftUI

@main
struct CheckRSHoursApp: App {
    @StateObject var lessons = Lessons()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(lessons)
        }
    }
}
