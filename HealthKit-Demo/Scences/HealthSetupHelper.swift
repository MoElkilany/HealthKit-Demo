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
        guard let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth) ,let bloodType = HKObjectType.characteristicType(forIdentifier: .bloodType) , let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex), let bodyMassIndex = HKObjectType.quantityType(forIdentifier: .bodyMassIndex) ,let height = HKObjectType.quantityType(forIdentifier: .height), let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass) ,let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {
            completion(false,HealthkitSetupError.dataTypeNotAvailable)
            return
        }
    }
}
