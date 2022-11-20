//
//  BluetoothManager.swift
//  TestPKCV
//
//  Created by Branislav Jovanović on 31.3.22..
//
import CoreBluetooth
import Foundation

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate {

    var centralManager: CBCentralManager!

    @Published var isBleOn = false

    override init() {
        super.init()

        centralManager = CBCentralManager(delegate: self, queue: nil)
        centralManager.delegate = self
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isBleOn = true
        }
        else {
            isBleOn = false
        }
    }

}
