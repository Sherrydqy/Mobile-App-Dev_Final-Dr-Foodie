//
//  DiaryViewController.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Qinyu Ding on 4/29/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import UIKit
import CoreData

class DiaryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {
   // var userName:String;
    
//    @IBOutlet var outputTargetC:UILabel!;
//    @IBOutlet var outputName:UILabel!;

    @IBOutlet var lbluserName: UILabel!
    @IBOutlet var dateField: UITextField!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet var lblCalGoal: UILabel!
    @IBOutlet var lblCalConsumed: UILabel!
    @IBOutlet var lblPercentage: UILabel!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var lblCurrentMeal: UILabel!
    @IBOutlet var lblCurrentMealCalories: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageViewMask: UIImageView!
    
    @IBOutlet var addButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    var currentDateStr: String?
    var breakfastList = SampleDataMeal.generateBreakfastData()
    var lunchList = SampleDataMeal.generateLunchData()
    var dinnerList = SampleDataMeal.generateDinnerData()
    var snackList = SampleDataMeal.generateSnackData()
    
    var calConsumed: Int = 0
    var calGoal: Int = 0
    
    //dynamic arrays for table view
    var selectedBreakfastList: [Meal] = []
    var selectedLunchList: [Meal] = []
    var selectedDinnerList: [Meal] = []
    var selectedSnackList: [Meal] = []
    
    //currentMealList stores the list of meals shown in the pickerView
    var currentMealList: [Meal] = []
    var currentMeal: Meal?
    
    //currentSelectedMealList stores the list of meals that are going to be shown on the tableView
    var currentSelectedMealList: [Meal] = []
    var currentMealIndex: Int = 0

    var diaryCaloriesEntry = SampleDataDiaryCalories.generateDiaryCalories()
    var diaryCaloriesIndex: Int = 0 //this index stores where the currentDiary is
    //currentDiary is the object that will save all the information for the selected date
    var currentDiary: Diary?
    
    //protocol for datasource for pickerview
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        //protocol for delegate for pickerview
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return currentMealList.count
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

             var label:UILabel
             
             if let v = view as? UILabel{
                 label = v
             }
             else{
                 label = UILabel()
             }
             
            label.textAlignment = .center
             label.font = UIFont(name: "Helvetica", size: 16)
             
            label.text = currentMealList[row].name
             
             return label
         }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

               //user just selected a meal
            currentMeal = currentMealList[row]
            lblCurrentMeal.text = currentMeal?.name!
            
            if let currentMealCalories = currentMeal?.calories {
                lblCurrentMealCalories.text = String(currentMealCalories) + " Kcal"
            } else {
                 lblCurrentMealCalories.text = ""
            }
            
            if let filePath = Bundle.main.path(forResource: currentMeal?.imagePath!, ofType: "jpg"), let image = UIImage(contentsOfFile: filePath){
                imageView.image = image
            }
            
            addButton.isHidden = false
            addButton.isEnabled = true
            imageViewMask.isHidden = false
            imageView.isHidden = false
            lblCurrentMeal.isHidden = false
            lblCurrentMealCalories.isHidden = false
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return currentSelectedMealList.count
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        let meal = currentSelectedMealList[indexPath.row]
        cell.textLabel?.text = meal.name
        cell.detailTextLabel?.text = String(meal.calories) + " KCal"
        return cell
      }
      
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //reduce calories
            calConsumed = currentDiary!.calConsumed! - currentSelectedMealList[indexPath.row].calories
            let percentage: Float = round(Float(calConsumed*100/calGoal))
            
            currentDiary?.calConsumed = calConsumed
            currentDiary?.calGoal = calGoal
            progressBar.setProgress(Float(calConsumed/calGoal), animated: true)
            lblPercentage.text = String(format: "%.0f", percentage) + "%"
            lblCalConsumed.text = String(calConsumed) + " Kcal"
//            lblCalConsumed.text = String(format: "%.0f", calConsumed) + " KCal"
            
            switch currentMealIndex {
            case 0:
                selectedBreakfastList.remove(at: indexPath.row)
                currentSelectedMealList.remove(at: indexPath.row)
                currentDiary?.breakfastList = selectedBreakfastList
                
            case 1:
                selectedLunchList.remove(at: indexPath.row)
                currentSelectedMealList.remove(at: indexPath.row)
                currentDiary?.lunchList = selectedLunchList
            case 2:
                selectedDinnerList.remove(at: indexPath.row)
                currentSelectedMealList.remove(at: indexPath.row)
                currentDiary?.dinnerList = selectedDinnerList
            case 3:
                selectedSnackList.remove(at: indexPath.row)
                currentSelectedMealList.remove(at: indexPath.row)
                currentDiary?.snackList = selectedSnackList
            default:
                break
            }
            
            //update table and delete row
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
        
        diaryCaloriesEntry[diaryCaloriesIndex] = currentDiary!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Qinyu: This one stores the userName: let name = UserDefaults.standard.string(forKey: "name"){
        // Qinyu: This one stores the calorie goal: let targetC = UserDefaults.standard.string(forKey: "targetCalories"){

        
        // Do any additional setup after loading the view.
        progressBar.layer.cornerRadius = 10
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 10
        progressBar.subviews[1].clipsToBounds = true
        
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        
        imageViewMask.layer.cornerRadius = 8.0
        imageViewMask.clipsToBounds = true
        
        currentMealList = breakfastList
        
//        let userName = UserDefaults.standard.string(forKey: "name")
        //let userName = "Maria"
        let userName = UserDefaults.standard.string(forKey: "name")!;
        lbluserName.text = "Hello, " + userName
        
//        let calGoal = UserDefaults.standard.float(forKey: "targetCalories")
        calGoal = UserDefaults.standard.integer(forKey: "targetCalories")
        lblCalGoal.text = String(calGoal) + " kCal"
        lblCalConsumed.text = String(calConsumed) + " KCal"
//        lblCalGoal.text = String(format: "%.0f", calGoal) + " KCal"
//        lblCalConsumed.text = String(format: "%.0f", calConsumed) + " KCal"

        let today = Date()

//        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: date)
        // US English Locale (en_US)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let dateString =  dateFormatter.string(from: today)
        dateField.text = dateString

        currentDiary = Diary(date: today, calGoal: calGoal, calConsumed: 0)
        diaryCaloriesEntry.append(currentDiary!)
        diaryCaloriesIndex = diaryCaloriesEntry.count - 1
        
//        let showDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDiary?.date as! Date)
//
//        print(dateFormatter.string(from: showDate!))
//        print(showDate!)
//        print(today)
//        for diaryEntry in diaryCaloriesEntry{
//            print("The goal calories is:" + String(diaryEntry.calGoal!))
//            print(diaryEntry.date)
//            if (dateFormatter.string(from: diaryEntry.date) == dateFormatter.string(from: showDate!)) {
//                print ("It is yesterday")
//            }
//        }
 
       
    }
    
    @IBAction func prevDiary(){
        var newEntry = true
        var index = 0
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let showDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDiary?.date as! Date)
        for diaryEntry in diaryCaloriesEntry{
            
            if (dateFormatter.string(from: diaryEntry.date) == dateFormatter.string(from: showDate!)){
                    newEntry = false
                    currentDiary = diaryEntry
                    diaryCaloriesIndex = index

            }
            index = index + 1
        }

        
        if newEntry == true{
            currentDiary = Diary(date: showDate!, calGoal: calGoal, calConsumed: 0)
            diaryCaloriesEntry.append(currentDiary!)
            diaryCaloriesIndex = diaryCaloriesEntry.count-1
        }
        
        print ("Is new entry?" + String(newEntry))
        updateScreen()
    }
    
    @IBAction func nextDiary(){
        var newEntry = true
        var index = 0
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let showDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDiary?.date as! Date)
        for diaryEntry in diaryCaloriesEntry{

            if (dateFormatter.string(from: diaryEntry.date) == dateFormatter.string(from: showDate!)){
                    newEntry = false
                    currentDiary = diaryEntry
                    diaryCaloriesIndex = index
                }
            index = index + 1
        }
        
        if newEntry == true{
            currentDiary = Diary(date: showDate!, calGoal: calGoal, calConsumed: 0)
            diaryCaloriesEntry.append(currentDiary!)
            diaryCaloriesIndex = diaryCaloriesEntry.count-1
        }
        
        print ("Is new entry?" + String(newEntry))
        updateScreen()
    }
    
    func updateScreen() {
        let dateFormatter = DateFormatter()
               dateFormatter.dateStyle = .medium
               dateFormatter.timeStyle = .none
               dateFormatter.locale = Locale(identifier: "en_US")
        dateField.text = dateFormatter.string(from: currentDiary!.date)
        if let caloriesGoal = currentDiary?.calGoal {
            lblCalGoal.text = String(caloriesGoal) + " KCal"
        }
        
        if let caloriesConsumed = currentDiary?.calConsumed{
            lblCalConsumed.text = String(caloriesConsumed) + " KCal"
        }
        
        let percentage: Float = round(Float(currentDiary!.calConsumed!*100/currentDiary!.calGoal!))
        lblPercentage.text = String(format: "%.0f", percentage) + "%"
        progressBar.setProgress(Float(currentDiary!.calConsumed!)/Float(currentDiary!.calGoal!), animated: true)
        
        selectedBreakfastList = currentDiary!.breakfastList
        selectedLunchList = currentDiary!.lunchList
        selectedDinnerList = currentDiary!.dinnerList
        selectedSnackList = currentDiary!.snackList
        
        currentSelectedMealList = selectedBreakfastList
        currentMealList = breakfastList
        
        segmentedControl.selectedSegmentIndex = 0
        currentMealIndex = 0
        pickerView.reloadAllComponents()
        tableView.reloadData()
        
        imageView.isHidden  = true
        imageViewMask.isHidden = true
        lblCurrentMeal.isHidden = true
        lblCurrentMealCalories.isHidden = true
        addButton.isHidden = true
 
        
    }
    
    @IBAction func indexChanged(_ sender: Any){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            currentMealIndex = 0
            currentMealList = breakfastList
            currentSelectedMealList = selectedBreakfastList
        case 1:
            currentMealIndex = 1
            currentMealList = lunchList
            currentSelectedMealList = selectedLunchList
        case 2:
            currentMealIndex = 2
            currentMealList = dinnerList
            currentSelectedMealList = selectedDinnerList
        case 3:
            currentMealIndex = 3
            currentMealList = snackList
            currentSelectedMealList = selectedSnackList
        default:
            break
        }
        
        pickerView.reloadAllComponents()
        tableView.reloadData() 
        imageView.isHidden = true
        imageViewMask.isHidden = true
        lblCurrentMeal.isHidden = true
        lblCurrentMealCalories.isHidden = true
        addButton.isHidden = true
    }
    
    @IBAction func addMeal(){
        calConsumed = currentDiary!.calConsumed! + currentMeal!.calories
        let percentage: Float = round(Float(calConsumed*100/calGoal))
        
        progressBar.setProgress(Float(calConsumed)/Float(calGoal), animated: true)
//        print(String(Float(calConsumed)/Float(calGoal)))
        lblPercentage.text = String(format: "%.0f", percentage) + "%"
        lblCalConsumed.text = String(calConsumed) + " KCal"
//        lblCalConsumed.text = String(format: "%.0f", calConsumed) + " KCal"
        
        //update calConsumed and calGoal on DiaryEntry
        currentDiary?.calConsumed = calConsumed
        currentDiary?.calGoal = calGoal
        
        switch currentMealIndex {
        case 0:
            selectedBreakfastList.append(currentMeal!)
            currentSelectedMealList = selectedBreakfastList
            currentDiary?.breakfastList.append(currentMeal!)
        case 1:
            selectedLunchList.append(currentMeal!)
            currentSelectedMealList = selectedLunchList
            currentDiary?.lunchList.append(currentMeal!)
        case 2:
            selectedDinnerList.append(currentMeal!)
            currentSelectedMealList = selectedDinnerList
            currentDiary?.dinnerList.append(currentMeal!)
        case 3:
            selectedSnackList.append(currentMeal!)
            currentSelectedMealList = selectedSnackList
            currentDiary?.snackList.append(currentMeal!)
        default:
            break
        }
        
    diaryCaloriesEntry[diaryCaloriesIndex] = currentDiary!
    tableView.reloadData()
    }
    
//    func saveBreakfast(breakfastMeal: Meal){
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        let managedObjectContext = appDelegate.persistentContainer.viewContext
//        let newBreakfastMeal = Breakfast(context: managedObjectContext)
//        newBreakfastMeal.name = breakfastMeal.name
//        newBreakfastMeal.calories = Int16(breakfastMeal.calories)
//
//        currentDiaryEntry.addToBreakfastList(newBreakfastMeal)
//
//        do {
//            try managedObjectContext.save()
//        } catch let error as NSError {
//            print ("Could not save. \(error)")
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

