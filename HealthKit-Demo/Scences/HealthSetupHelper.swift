//
//  HealthSetupHelper.swift
//  HealthKit-Demo
//
//  Created by Mohamed Elkilany on 28/09/2021.
//

import HealthKit

class HealthSetupHelper {
    
    private enum HealthkitSetupError: Error {
      case notAvailableOnDevice
      case dataTypeNotAvailable
    }
    
    class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false,HealthkitSetupError.notAvailableOnDevice)
            return
        }
    }
    
}
