//
//  BiologicalDataDisplayVC.swift
//  HealthKit-Demo
//
//  Created by Mohamed Elkilany on 28/09/2021.
//

import UIKit
import HealthKit

class BiologicalDataDisplayVC: UIViewController {
    
    @IBOutlet weak var ageLab: UILabel!
    @IBOutlet weak var ageValLab: UILabel!
    
    @IBOutlet weak var bloadTypeLab: UILabel!
    @IBOutlet weak var bloadTypeValLab: UILabel!
    
    @IBOutlet weak var sexTypeLab: UILabel!
    @IBOutlet weak var sexTypeValLab: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getBiologicalData()
    }
    
    //Make Object of UserProfile Data to save data that comes from UserHealthData
    let userDataObject = UserHealthProfile()

    func getBiologicalData(){
        do{
            let userAgeSexAndBlood = try UserHealthData.getAgeSexAndBlood()
            userDataObject.age = userAgeSexAndBlood.age
            userDataObject.biologicalSex = userAgeSexAndBlood.biologicalSex
            userDataObject.bloodType  = userAgeSexAndBlood.bloodType
            setUpDataView()
           
            
        }catch let error {
            print("the error is ",error)
        }
    }
    
    func setUpDataView(){
        if let age = userDataObject.age {
            ageValLab.text = "\(age)"
        }
        if let bloodTypes = userDataObject.bloodType {
            print("the bloodTypes Raw value is ", bloodTypes.rawValue)
            print("the bloodTypes  String is ", bloodTypes.stringRepresentation)

            bloadTypeValLab.text = bloodTypes.stringRepresentation
        }
        
        if let sex = userDataObject.biologicalSex {
            sexTypeValLab.text = sex.stringRepresentation
        }
    }
}


class UserHealthProfile {
  var age: Int?
  var biologicalSex: HKBiologicalSex?
  var bloodType: HKBloodType?
  var heightInMeters: Double?
  var weightInKilograms: Double?
}


extension HKBloodType {

  var stringRepresentation: String {
    switch self {
    case .notSet: return "Unknown"
    case .aPositive: return "A+"
    case .aNegative: return "A-"
    case .bPositive: return "B+"
    case .bNegative: return "B-"
    case .abPositive: return "AB+"
    case .abNegative: return "AB-"
    case .oPositive: return "O+"
    case .oNegative: return "O-"
    }
  }
}

extension HKBiologicalSex {

  var stringRepresentation: String {
    switch self {
    case .notSet: return "Unknown"
    case .female: return "Female"
    case .male: return "Male"
    case .other: return "Other"
    }
  }
}
