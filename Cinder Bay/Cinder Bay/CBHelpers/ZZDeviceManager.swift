//
//  ZZDeviceManager.swift
//  Cinder Bay
//
//



import UIKit

class ZZDeviceManager {
    static let shared = ZZDeviceManager()
    
    var deviceType: UIUserInterfaceIdiom
    
    private init() {
        self.deviceType = UIDevice.current.userInterfaceIdiom
    }
}
