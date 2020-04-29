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
        thisAge = Float(myAge);
        if (myGender == "Male"){
            BMR1 = 6.3 * myWeight;
            BMR2 = 12.9 * myHeight;
            BMR3 = 6.8 * thisAge;
            BMR = 66 + BMR1 + BMR2 - BMR3;
            
        }else{
            BMR1 = 4.3 * myWeight;
            BMR2 = 4.7 * myHeight;
            BMR3 = 4.7 * thisAge;
            BMR = 655 + BMR1 + BMR2 - BMR3;
        }
        
        switch physical {
        case 1.0:
            maintainC = lroundf(BMR  * 1.2);
        case 2.0:
             maintainC = lroundf(BMR  * 1.375);
        case 3.0:
            maintainC = lroundf(BMR  * 1.55);
        case 4.0:
            maintainC = lroundf(BMR  * 1.725);
        case 5.0:
            maintainC = lroundf(BMR  * 1.9);
        case .none:
            print("none")
        case .some(_):
            print("some")
        default:
            maintainC = 0;
        }
        
            
        loseC = maintainC - 500;
        gainC = maintainC + 500;
        
        //print("maintain: \(maintainC)");
        //print("lose: \(loseC)");
        //print("gain: \(gainC)");
        //performSegue(withIdentifier: "physicalLevel", sender: self);
        UserDefaults.standard.set(physical, forKey:"physicalLevel");
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! OnboardingC;
        vc.myMaintainC = maintainC;
        vc.myGainC = gainC;
        vc.myLoseC = loseC;
    }
    


}
