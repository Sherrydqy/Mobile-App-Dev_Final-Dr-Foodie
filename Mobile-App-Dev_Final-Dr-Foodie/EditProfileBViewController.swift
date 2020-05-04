//
//  EditProfileBViewController.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit

class EditProfileBViewController: UIViewController {

       var myName:String?
 
       let step:Float = 1;
       var physical:Float?
        
       @IBOutlet var slider:UISlider!;
       
       override func viewDidLoad() {
           super.viewDidLoad();
           physical = slider.value;
           slider.value =  UserDefaults.standard.float(forKey:"physical");
           slider.transform = CGAffineTransform(rotationAngle:CGFloat.pi / 2);
       }
       


       @IBAction func slideMoved(slider:UISlider){
           let roundedValue = round(slider.value/step)*step;
           slider.value = roundedValue;
           physical = slider.value;
           //print("slider value:\(slider.value)");
           //print("gender is:\(myGender)");
           //print("height value:\(myHeight)");
           //print("age value:\(myAge)");
           //print("weight value:\(myWeight)");
       }
       
       @IBAction func calCalories(){
           UserDefaults.standard.set(physical, forKey:"physical");
       }
       
       /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           var vc = segue.destination as! OnboardingC;
           vc.myMaintainC = maintainC;
           vc.myGainC = gainC;
           vc.myLoseC = loseC;
       }*/
       

}
