//
//  BluetoothManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import Foundation
import CoreBluetooth

class BluetoothManager {
    
    private let cb = CBCentralManager()
    
    func requestPermission() {
        cb.scanForPeripherals(withServices: nil)
        cb.stopScan()
    }
}
