//
//  OnboardingA.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit

class OnboardingA: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

     var genderOptions:[String] = ["Male", "Female"];
     var gender:String?
     var height:Float = 0.0;
     var age:Int = 0;
     var weight:Float = 0.0;
     var physical:Int?
     var name:String?
     @IBOutlet var inputName:UITextField!;
     @IBOutlet var inputAge:UITextField!;
     @IBOutlet var inputHeight:UITextField!;
     @IBOutlet var inputWeight:UITextField!;
     
     
     override func viewDidLoad() {
         super.viewDidLoad();

             let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
             self.view.addGestureRecognizer(tapGesture)
     }
     
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1;
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         
             return genderOptions.count;
     }
     
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         gender = genderOptions[row];
         return gender;
     }
     
     @IBAction func next(){
         if let getAge = inputAge.text, !getAge.isEmpty{
             if let getHeight = inputHeight.text, !getHeight.isEmpty{
                 if let getWeight = inputWeight.text, !getWeight.isEmpty{
                    if let getName = inputName.text, !getName.isEmpty{
                         name = getName;
                         age = Int(getAge)!;
                         weight = Float(getWeight)!;
                         height = Float(getHeight)!;
                         performSegue(withIdentifier: "basicInfo", sender: self);
                         UserDefaults.standard.set(name, forKey:"name");
                         UserDefaults.standard.set(age, forKey:"age");
                         UserDefaults.standard.set(weight, forKey:"weight");
                         UserDefaults.standard.set(height, forKey:"height");
                         UserDefaults.standard.set(gender, forKey:"gender");


                     }else{
                         let message = "Please enter your WEIGHT!";
                         let alert = UIAlertController(title: "Empty Input Alert", message: message, preferredStyle: .alert);
                         let action = UIAlertAction(title: "OK", style: .default, handler: nil);
                                alert.addAction(action);
                         present(alert, animated: true, completion: nil);
                         print("Please enter your weight!");
                     }
                 }else{
                     let message = "Please enter your HEIGHT!";
                     let alert = UIAlertController(title: "Empty Input Alert", message: message, preferredStyle: .alert);
                     let action = UIAlertAction(title: "OK", style: .default, handler: nil);
                            alert.addAction(action);
                     present(alert, animated: true, completion: nil);
                     print("Please enter your height!");
                 }
             }else{
                 let message = "Please enter your AGE!";
                 let alert = UIAlertController(title: "Empty Input Alert", message: message, preferredStyle: .alert);
                 let action = UIAlertAction(title: "OK", style: .default, handler: nil);
                        alert.addAction(action);
                 present(alert, animated: true, completion: nil);
                 print("Please enter your age!");
             }
         }else{
            let message = "Please enter your NAME!";
            let alert = UIAlertController(title: "Empty Input Alert", message: message, preferredStyle: .alert);
            let action = UIAlertAction(title: "OK", style: .default, handler: nil);
                   alert.addAction(action);
            present(alert, animated: true, completion: nil);
            print("Please enter your name!");
        }
     }
     
    /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         var vc = segue.destination as! OnboardingB;
         vc.myName = name;
         vc.myAge = age;
         vc.myGender = gender;
         vc.myHeight = height;
         vc.myWeight = weight;
        
     }*/
     
     @objc func dismissKeyboard() {
         inputAge.resignFirstResponder();
         inputHeight.resignFirstResponder();
         inputWeight.resignFirstResponder();
     }


}
