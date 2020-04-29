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
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
        navigateToMainScreen();
        
    }
    @IBAction func btnGainWeight(){
        targetC = myGainC;
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
        navigateToMainScreen();
    }
    @IBAction func btnMaintainWeight(){
        targetC = myMaintainC;
        UserDefaults.standard.set(targetC, forKey:"targetCalories");
        navigateToMainScreen();
    }
    
    private func navigateToMainScreen(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main);
               guard let mainNavigationVC = mainStoryboard.instantiateInitialViewController() else { return; };
               present(mainNavigationVC, animated:true, completion:nil);
    }

}
