//
//  UserHealthData.swift
//  HealthKit-Demo
//
//  Created by Mohamed Elkilany on 28/09/2021.
//

import HealthKit

class UserHealthData {
    class func getAgeSexAndBlood()throws->(age: Int,
                                           biologicalSex: HKBiologicalSex,
                                           bloodType: HKBloodType) {
        let healthKitStore = HKHealthStore()
        do {
            let birthdayComponents =  try healthKitStore.dateOfBirthComponents()
               let biologicalSex =       try healthKitStore.biologicalSex()
               let bloodType =           try healthKitStore.bloodType()
                 
            let today = Date()
                let calendar = Calendar.current
                let todayDateComponents = calendar.dateComponents([.year],
                                                                    from: today)
                 let thisYear = todayDateComponents.year!
                 let age = thisYear - birthdayComponents.year!
            
                 let unwrappedBiologicalSex = biologicalSex.biologicalSex
                 let unwrappedBloodType = bloodType.bloodType
              return(age ,unwrappedBiologicalSex ,unwrappedBloodType )

                }
    }
    
}
