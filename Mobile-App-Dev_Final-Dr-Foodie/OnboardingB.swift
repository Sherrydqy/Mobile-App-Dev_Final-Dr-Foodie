//
//  OnboardingB.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit

class OnboardingB: UIViewController {

    var myName:String?
    var myGender:String?
    var myHeight:Float = 0.0;
    var myAge:Int = 0;
    var thisAge:Float = 0.0;
    var myWeight:Float = 0.0;
    var physical:Float?
    let step:Float = 1;
    var BMR:Float = 0.0;
    var BMR1:Float = 0.0;
    var BMR2:Float = 0.0;
    var BMR3:Float = 0.0;
    var maintainC:Int = 0;
    var loseC:Int = 0;
    var gainC:Int = 0;
    @IBOutlet var slider:UISlider!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        slider.value = 1.0;
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
