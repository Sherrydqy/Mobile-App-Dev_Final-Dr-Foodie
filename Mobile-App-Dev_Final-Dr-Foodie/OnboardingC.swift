//
//  OnboardingC.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit

class OnboardingC: UIViewController {

    var myMaintainC:Int = 0;
    var myLoseC:Int = 0;
    var myGainC:Int = 0;
    var targetC:Int = 0;
    @IBOutlet var outputBMR:UILabel!;
    @IBOutlet var outputLose:UILabel!;
    @IBOutlet var outputGain:UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        outputBMR.text = "\(myMaintainC) calories/day";
        outputGain.text = "\(myGainC) calories/day";
        outputLose.text = "\(myLoseC) calories/day";
    }
    
    @IBAction func btnLoseWeight(){
        targetC = myLoseC;
        performSegue(withIdentifier: "doneOnboarding", sender: self);
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
    }
    @IBAction func btnGainWeight(){
        targetC = myGainC;
        performSegue(withIdentifier: "doneOnboarding", sender: self);
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
    }
    @IBAction func btnMaintainWeight(){
        targetC = myMaintainC;
        performSegue(withIdentifier: "doneOnboarding", sender: self);
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! DiaryViewController;
    }

}
