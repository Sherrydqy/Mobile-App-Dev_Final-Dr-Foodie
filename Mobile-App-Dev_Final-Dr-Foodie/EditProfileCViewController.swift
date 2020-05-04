//
//  EditProfileCViewController.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit

class EditProfileCViewController: UIViewController {

    var myName:String?
    var myGender:String?
    var myHeight:Float?
    var myAge:Int?
    var thisAge:Float = 0.0;
    var myWeight:Float?
    var myPhysical:Float?
    let step:Float = 1;
    var BMR:Float = 0.0;
    var BMR1:Float = 0.0;
    var BMR2:Float = 0.0;
    var BMR3:Float = 0.0;
    var maintainC:Int = 0;
    var loseC:Int = 0;
    var gainC:Int = 0;
    
    var myMaintainC:Int = 0;
    var myLoseC:Int = 0;
    var myGainC:Int = 0;
    var targetC:Int = 0;
    @IBOutlet var outputBMR:UILabel!;
    @IBOutlet var outputLose:UILabel!;
    @IBOutlet var outputGain:UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        myAge = Int(UserDefaults.standard.string(forKey: "age")!);
        myGender = UserDefaults.standard.string(forKey: "gender");
        myWeight = Float(UserDefaults.standard.string(forKey:"weight")!);
        myHeight = Float(UserDefaults.standard.string(forKey:"height")!);
        myPhysical = Float(UserDefaults.standard.string(forKey:"physical")!);
        
        thisAge = Float(myAge!);
        if (myGender == "Male"){
            BMR1 = 6.3 * myWeight!;
            BMR2 = 12.9 * myHeight!;
            BMR3 = 6.8 * thisAge;
            BMR = 66 + BMR1 + BMR2 - BMR3;
            
        }else{
            BMR1 = 4.3 * myWeight!;
            BMR2 = 4.7 * myHeight!;
            BMR3 = 4.7 * thisAge;
            BMR = 655 + BMR1 + BMR2 - BMR3;
        }
        
        switch myPhysical {
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
        outputBMR.text = "\(maintainC) calories/day";
        outputGain.text = "\(gainC) calories/day";
        outputLose.text = "\(loseC) calories/day";
    }
    
    @IBAction func btnLoseWeight(){
        targetC = loseC;
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
        saveChanges();
        
    }
    @IBAction func btnGainWeight(){
        targetC = gainC;
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
        saveChanges();
    }
    @IBAction func btnMaintainWeight(){
        targetC = maintainC;
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
        saveChanges();
    }
    
    private func navigateToMainScreen(action:UIAlertAction){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main);
        guard let mainNavigationVC = mainStoryboard.instantiateInitialViewController() else { return; };
        present(mainNavigationVC, animated:true, completion:nil);
        
    }
    
    private func saveChanges(){
        let alert = UIAlertController(title: "Changes Saved", message: "Your profile was updated!", preferredStyle: .alert);
        let action = UIAlertAction(title: "OK", style: .default, handler: navigateToMainScreen);
        alert.addAction(action);
        present(alert, animated: true, completion: nil);
        
        
    }
    
   /* @IBAction func showAlert(){
              
          }*/

}
