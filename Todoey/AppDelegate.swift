//
//  AppDelegate.swift
//  Todoey
//
//  Created by Deepak on 8/31/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        
        do {
            _ = try Realm()
            
        } catch  {
            print("error initializing Realm \(error)")
        }
        
        
        return true
    }

    

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    


}

