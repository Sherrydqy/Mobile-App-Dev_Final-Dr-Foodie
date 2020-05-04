//
//  LearnViewController.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {

    
    var name:String!;
    
    var currentQuestionIndex:Int=0;
    var questionGroups:[String] = ["A source of simple carbohydrates:",
                                   "The risk of obesity, heart disease, & cancer is increased by a diet high in:",
                                    " Vitamin ____ is an example of a fat soluble vitamin:"];
    var answerGroups:[[String]] = [];
    var answerGroupA:[String] = ["seeds","fruits","brown rice","potatoes"];
    var answerGroupB:[String] = ["fat","cholesterol","saturated fat","all of the above"];
    var answerGroupC:[String] = ["A","B","C","none of these above"];
    var correctAnswerIndex:[Int] = [3,3,0];
    var correctAnswerIndexThis:Int = 0;
    
    @IBOutlet var nameLabel:UILabel!;
    @IBOutlet var question:UILabel!;
    @IBOutlet var optionA:UIButton!;
    @IBOutlet var optionB:UIButton!;
    @IBOutlet var optionC:UIButton!;
    @IBOutlet var optionD:UIButton!;
    @IBOutlet var result:UILabel!;
    @IBOutlet var answerLabel:UILabel!;
    @IBOutlet var answerContent:UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name = UserDefaults.standard.string(forKey: "name");
        answerGroups.append(answerGroupA);
        answerGroups.append(answerGroupB);
        answerGroups.append(answerGroupC);
        //nameLabel.text = "Hello, \(String(describing: name))!";
        nameLabel.text = name;
        result.isHidden = true;
        answerLabel.isHidden = true;
        answerContent.isHidden = true;
        question.text = questionGroups[currentQuestionIndex];
        //print("问题数组》》》\(answerGroups)");
        optionA.setTitle(answerGroups[currentQuestionIndex][0], for: .normal);
        optionB.setTitle(answerGroups[currentQuestionIndex][1], for: .normal);
        optionC.setTitle(answerGroups[currentQuestionIndex][2], for: .normal);
        optionD.setTitle(answerGroups[currentQuestionIndex][3], for: .normal);

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToNext() {
        result.isHidden = true;
        answerLabel.isHidden = true;
        answerContent.isHidden = true;
        optionA.isEnabled = true;
        optionB.isEnabled = true;
        optionC.isEnabled = true;
        optionD.isEnabled = true;
        optionA.isSelected = false;
        optionB.isSelected = false;
        optionC.isSelected = false;
        optionD.isSelected = false;

        currentQuestionIndex = currentQuestionIndex + 1;
        if (currentQuestionIndex > questionGroups.count-1){
            currentQuestionIndex = 0;
        }
        question.text = questionGroups[currentQuestionIndex];
        optionA.setTitle(answerGroups[currentQuestionIndex][0], for: .normal);
        optionB.setTitle(answerGroups[currentQuestionIndex][1], for: .normal);
        optionC.setTitle(answerGroups[currentQuestionIndex][2], for: .normal);
        optionD.setTitle(answerGroups[currentQuestionIndex][3], for: .normal);
    }
    
    @IBAction func selectedA() {
        correctAnswerIndexThis = correctAnswerIndex[currentQuestionIndex];
        optionA.isSelected = true;
        optionB.isEnabled = false;
        optionC.isEnabled = false;
        optionD.isEnabled = false;
        if (correctAnswerIndexThis == 0){
            result.text = "CORRECT!";
            result.textColor = UIColor(red: 23/255, green: 155/255, blue: 54/255, alpha: 1);
            }else{
            result.text = "Oops...WRONG";
            result.textColor = UIColor(red: 208/255, green: 16/255, blue: 16/255, alpha: 1);
            answerContent.text = answerGroups[currentQuestionIndex][correctAnswerIndexThis];
            answerLabel.isHidden = false;
            answerContent.isHidden = false;
        }
        result.isHidden = false;
    }
    
    @IBAction func selectedB() {
        correctAnswerIndexThis = correctAnswerIndex[currentQuestionIndex];
        optionB.isSelected = true;
        optionA.isEnabled = false;
        optionC.isEnabled = false;
        optionD.isEnabled = false;
        if (correctAnswerIndexThis == 1){
            result.text = "CORRECT!";
            result.textColor = UIColor(red: 23/255, green: 155/255, blue: 54/255, alpha: 1);
            }else{
            result.text = "Oops...WRONG";
            result.textColor = UIColor(red: 208/255, green: 16/255, blue: 16/255, alpha: 1);
            answerContent.text = answerGroups[currentQuestionIndex][correctAnswerIndexThis];
            answerLabel.isHidden = false;
            answerContent.isHidden = false;
        }
        result.isHidden = false;
    }
    
    @IBAction func selectedC() {
        correctAnswerIndexThis = correctAnswerIndex[currentQuestionIndex];
        optionC.isSelected = true;
        optionB.isEnabled = false;
        optionA.isEnabled = false;
        optionD.isEnabled = false;
        if (correctAnswerIndexThis == 2){
           result.text = "CORRECT!";
           result.textColor = UIColor(red: 23/255, green: 155/255, blue: 54/255, alpha: 1);
           }else{
           result.text = "Oops...WRONG";
           result.textColor = UIColor(red: 208/255, green: 16/255, blue: 16/255, alpha: 1);
            answerContent.text = answerGroups[currentQuestionIndex][correctAnswerIndexThis];
            answerLabel.isHidden = false;
            answerContent.isHidden = false;
        }
        result.isHidden = false;
    }
    
    @IBAction func selectedD() {
        correctAnswerIndexThis = correctAnswerIndex[currentQuestionIndex];
        optionD.isSelected = true;
        optionB.isEnabled = false;
        optionC.isEnabled = false;
        optionA.isEnabled = false;
        if (correctAnswerIndexThis == 3){
            result.text = "CORRECT!";
            result.textColor = UIColor(red: 23/255, green: 155/255, blue: 54/255, alpha: 1);
        }else{
            result.text = "Oops...WRONG";
            result.textColor = UIColor(red: 208/255, green: 16/255, blue: 16/255, alpha: 1);
            answerContent.text = answerGroups[currentQuestionIndex][correctAnswerIndexThis];
            answerLabel.isHidden = false;
            answerContent.isHidden = false;
        }
        result.isHidden = false;
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
