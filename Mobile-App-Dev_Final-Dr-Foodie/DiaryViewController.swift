//
//  DiaryViewController.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController {

    @IBOutlet var outputTargetC:UILabel!;
    @IBOutlet var outputName:UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = UserDefaults.standard.string(forKey: "name"){
            outputName.text = "This is: \(name)";
            if let targetC = UserDefaults.standard.string(forKey: "targetCalories"){
                outputTargetC.text = "I need \(targetC) calories/day";
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
