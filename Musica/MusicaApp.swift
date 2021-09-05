//
//  MusicaApp.swift
//  Musica
//
//  Created by Aman Joshi on 15/08/21.
//

import SwiftUI
import Firebase

@main
struct MusicaApp: App {

  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        FirebaseApp.configure()
        return true
    }
}
