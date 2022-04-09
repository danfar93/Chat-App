//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Daniel Farrell on 05/02/2022.
//

import SwiftUI
import Firebase


@main
struct ChatAppApp: App {

    init() {
      FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
