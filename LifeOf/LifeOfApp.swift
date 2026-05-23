//
//  LifeOfApp.swift
//  LifeOf
//
//  Created by Ray on 2026/5/22.
//

import SwiftUI

// Add an AppDelegate to handle orientation locking at the app level
#if canImport(UIKit)
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .allButUpsideDown
    }
}
#endif

@main
struct LifeOfApp: App {
    #if canImport(UIKit)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
