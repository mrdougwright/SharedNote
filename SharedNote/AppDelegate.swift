//
//  AppDelegate.swift
//  SharedNote
//
//  Created by Doug Wright on 3/15/21.
//
//import Foundation

import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
