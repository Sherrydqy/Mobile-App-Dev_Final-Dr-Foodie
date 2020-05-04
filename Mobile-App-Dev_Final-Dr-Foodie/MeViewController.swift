//
//  MeViewController.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet var opName:UILabel!;
    @IBOutlet var opAge:UILabel!;
    @IBOutlet var opGender:UILabel!;
    @IBOutlet var opWeight:UILabel!;
    @IBOutlet var opHeight:UILabel!;
    @IBOutlet var opCalorieGoal:UILabel!;
    @IBOutlet var tabBar:UITabBarController!;
    override func viewDidLoad() {
        super.viewDidLoad()
        opName.text = UserDefaults.standard.string(forKey: "name");
        opAge.text = UserDefaults.standard.string(forKey: "age");
        opGender.text = UserDefaults.standard.string(forKey: "gender");
        opWeight.text = "\(UserDefaults.standard.float(forKey:"weight")) lbs";
        opHeight.text = "\(UserDefaults.standard.float(forKey:"height")) inches";
        opCalorieGoal.text = "\(UserDefaults.standard.integer(forKey:"targetCalories")) calories/day";
        //opPhysical = Float(UserDefaults.standard.string(forKey:"physical")!);
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelToMeViewController(_ segue: UIStoryboardSegue){
        
    }
    
    @IBAction func saveToMeViewController(_ segue: UIStoryboardSegue){
        //UserDefaults.standard.set(0, forKey:"nextTab");
       // tabBar.selectedIndex = 2;
        //self.parent?.parent?.dismiss(animated: true, completion: nil)
        
    }
    
   

    //override func viewWillAppear(_ animated: Bool) {
     //   tabBar.selectedIndex = 2;
    //}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
