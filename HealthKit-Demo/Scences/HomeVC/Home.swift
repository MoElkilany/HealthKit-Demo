//
//  Home.swift
//  HealthKit-Demo
//
//  Created by Mohamed Elkilany on 28/09/2021.
//

import UIKit
import HealthKit
class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func checkThatHealthKitAllowOrNot(_ sender: Any) {
        HealthSetupHelper.authorizeHealthKit { (authorized, error) in
              
          guard authorized else {
                
            let baseMessage = "HealthKit Authorization Failed"
                
            if let error = error {
              print("\(baseMessage). Reason: \(error.localizedDescription)")
            } else {
              print(baseMessage)
            }
            return
          }
            print("HealthKit Successfully Authorized.")
            DispatchQueue.main.async {
                self.present(BiologicalDataDisplayVC(), animated: true, completion: nil)
            }
        }
        
        
    }
}
