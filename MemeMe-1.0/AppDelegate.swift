//
//  AppDelegate.swift
//  MemeMe-1.0
//
//  Created by Jaskirat Singh on 21/06/17.
//  Copyright © 2017 jassie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?

    var memes = [MemeMe]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

