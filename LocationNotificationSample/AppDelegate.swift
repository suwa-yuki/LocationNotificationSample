//
//  AppDelegate.swift
//  LocationNotificationSample
//
//  Created by suwa.yuki on 2014/08/19.
//  Copyright (c) 2014年 underscore, Inc. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
                            
    var window: UIWindow?
    var manager: CLLocationManager!
    
    // MARK: - UIApplicationDelegate

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        let settings = UIUserNotificationSettings(forTypes: .Alert | .Sound | .Badge, categories: nil)
        application.registerUserNotificationSettings(settings)
        
        self.manager = CLLocationManager()
        self.manager.delegate = self;
        self.manager.requestAlwaysAuthorization()
        
//        manager.startUpdatingLocation()
//        
//        let coordinate = CLLocationCoordinate2DMake(35.69754710, 139.77468283)
//        let radius = 100.0
//        let identifier = "sample"
//        manager.startMonitoringForRegion(CLCircularRegion(circularRegionWithCenter: coordinate, radius: radius, identifier: identifier))
        
        return true
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .Authorized, .AuthorizedWhenInUse:
            println("位置情報利用可")
            // Local Notificationを実行
            self.notification()
        default:
            println("位置情報利用不可")
        }
    }
    
//    func locationManager(manager: CLLocationManager!, didVisit visit: CLVisit!) {
//        println("現在地 : \(visit.coordinate)")
//        println("Accuracy : \(visit.horizontalAccuracy)")
//        println("到着時間 : \(visit.arrivalDate)")
//        println("出発時間 : \(visit.departureDate)")
//    }
//    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        println("\(locations)")
//        let location: CLLocation? = locations.first as? CLLocation
//        if let floor = location?.floor {
//            println("Current Floor: \(floor)")
//        } else {
//            println("Floor is nil")
//        }
//        
//    }
//    
//    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
//        println("didEnterRegion")
//    }
//    
//    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
//        println("didExitRegion")
//    }
//    
//    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
//        NSLog("[ERROR] \(error)")
//    }
    
    func notification() {
        
        println("scheduled notification")
        
        // クラスメソッド本社
        let coordinate = CLLocationCoordinate2DMake(35.697239, 139.774719)
        let radius = 100.0
        let identifier = "sample"
        
        let notification = UILocalNotification()
        notification.alertBody = "たどり着いた！"
        notification.regionTriggersOnce = false
        notification.region = CLCircularRegion(circularRegionWithCenter: coordinate, radius: radius, identifier: identifier)
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }

}

