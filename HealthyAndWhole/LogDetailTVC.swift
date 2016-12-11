//
//  LogDetailTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/8/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class LogDetailTVC: UITableViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var weekAndDayLabel: UILabel!
    
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    @IBOutlet weak var snackLabel: UILabel!
    @IBOutlet weak var sleepHoursLabel: UILabel!
    @IBOutlet weak var sleepQualityLabel: UILabel!

    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var activeMinutesLabel: UILabel!
    
    @IBOutlet weak var waterField: UITextField!
    @IBOutlet weak var breakfastField: UITextView!
    @IBOutlet weak var breakfastCaloriesField: UITextField!
    @IBOutlet weak var lunchField: UITextView!
    @IBOutlet weak var lunchCaloriesField: UITextField!
    @IBOutlet weak var dinnerField: UITextView!
    @IBOutlet weak var dinnerCaloriesField: UITextField!
    @IBOutlet weak var snackField: UITextView!
    @IBOutlet weak var snacksCaloriesField: UITextField!

    @IBOutlet weak var sleepHoursField: UITextField!
    @IBOutlet weak var sleepQualityField: UITextField!

    @IBOutlet weak var stepCountField: UITextField!
    @IBOutlet weak var activeMinutesField: UITextField!
    
    @IBOutlet weak var moodPicker: UIPickerView!
    @IBOutlet weak var closenessPicker: UIPickerView!
    
    //Switches
    
    @IBOutlet weak var vitaminSwitch: UISwitch!
    @IBOutlet weak var fishOilSwitch: UISwitch!
    @IBOutlet weak var probioticSwitch: UISwitch!
    @IBOutlet weak var activitySwitch: UISwitch!
    @IBOutlet weak var devotionSwitch: UISwitch!
    @IBOutlet weak var detoxSwitch: UISwitch!
    @IBOutlet weak var dryBrushingSwitch: UISwitch!
    
    //Cells
    
    @IBOutlet weak var supplementCell: UITableViewCell!
    @IBOutlet weak var foodHeaderCell: UITableViewCell!
    @IBOutlet weak var breakfastCell: UITableViewCell!
    @IBOutlet weak var lunchCell: UITableViewCell!
    @IBOutlet weak var dinnerCell: UITableViewCell!
    @IBOutlet weak var snackCell: UITableViewCell!
    @IBOutlet weak var sleepCell: UITableViewCell!
    @IBOutlet weak var activityFullCell: UITableViewCell!
    
    @IBOutlet weak var activityCell: UITableViewCell!
    @IBOutlet weak var devotionCell: UITableViewCell!
    @IBOutlet weak var detoxCell: UITableViewCell!
    @IBOutlet weak var dryBrushingCell: UITableViewCell!
    
    @IBOutlet weak var dailyMoodCell: UITableViewCell!
    @IBOutlet weak var closenessToGodCell: UITableViewCell!
    
    var dailyMood: Int = 1
    
    var closenessToGod: Int = 1
    
    var log: Log!
    
    var week: Int!
    
    var hasLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard log != nil else { return }
        
        weekAndDayLabel.text = "Week \(log.week!), Day \(log.day!)"
        
        //We set up the log differently depending on which week of the program the user is doing.
        
        switch week {
            
        case 1, 8:
            
            supplementCell.hidden = true
            activityCell.hidden = true
            devotionCell.hidden = true
            detoxCell.hidden = true
            dryBrushingCell.hidden = true
            
            waterField.text = log.water! != 0 ? "\(log.water!)" : ""
            
            breakfastCaloriesField.text = log.breakfastCalories! != 0 ? "\(log.breakfastCalories!)" : ""
            breakfastField.text = log.breakfast != nil ? "\(log.breakfast!)" : "eg., Eggs, Whole Milk, Avocado"
            lunchCaloriesField.text = log.lunchCalories! != 0 ? "\(log.lunchCalories!)" : ""
            lunchField.text = log.lunch != nil ? "\(log.lunch!)" : "eg., Caesar Salad, Apple, Sausage"
            dinnerCaloriesField.text = log.dinnerCalories! != 0 ? "\(log.dinnerCalories!)" : ""
            dinnerField.text = log.dinner != nil ? "\(log.dinner!)" : "eg., Beef Stew, Sweet Potato, Baked Beans"
            snacksCaloriesField.text = log.snackCalories! != 0 ? "\(log.snackCalories!)" : ""
            snackField.text = log.snacks != nil ? "\(log.snacks!)" : "eg., Nuts, Dark Chocolate"
            
            sleepHoursField.text = log.sleepTime! != 0 ? "\(log.sleepTime!)" : ""
            sleepQualityField.text = log.sleepInfo != nil ? "\(log.sleepInfo!)" : ""
            
            stepCountField.text = log.stepCount! != 0 ? "\(log.stepCount!)" : ""
            activeMinutesField.text = log.activeMinutes! != 0 ? "\(log.activeMinutes!)" : ""
            
            if log.mood != 0 {
                dailyMood = Int(log.mood ?? 0)
                moodPicker.selectRow(dailyMood - 1, inComponent: 0, animated: true)
            }
            
            if log.closeness != 0 {
                closenessToGod = Int(log.closeness ?? 0)
                closenessPicker.selectRow(closenessToGod - 1, inComponent: 0, animated: true)
            }
            
        case 2:
            
            foodHeaderCell.hidden = true
            breakfastCell.hidden = true
            lunchCell.hidden = true
            dinnerCell.hidden = true
            snackCell.hidden = true
            sleepCell.hidden = true
            activityFullCell.hidden = true
            
            dailyMoodCell.hidden = true
            closenessToGodCell.hidden = true
            
            activityCell.hidden = true
            detoxCell.hidden = true
            dryBrushingCell.hidden = true
            
            vitaminSwitch.on = log.multiVitamin == true ? true : false
            fishOilSwitch.on = log.codLiverOil == true ? true : false
            probioticSwitch.on = log.probiotic == true ? true : false
            
            devotionSwitch.on = log.devotionTime == true ? true : false
            
            waterField.text = log.water! != 0 ? "\(log.water!)" : ""
            
        case 3:
            
            foodHeaderCell.hidden = true
            breakfastCell.hidden = true
            lunchCell.hidden = true
            dinnerCell.hidden = true
            snackCell.hidden = true
            sleepCell.hidden = true
            activityFullCell.hidden = true
            
            dailyMoodCell.hidden = true
            closenessToGodCell.hidden = true
            
            detoxCell.hidden = true
            dryBrushingCell.hidden = true
            
            vitaminSwitch.on = log.multiVitamin == true ? true : false
            fishOilSwitch.on = log.codLiverOil == true ? true : false
            probioticSwitch.on = log.probiotic == true ? true : false
            
            activitySwitch.on = log.activity == true ? true : false
            devotionSwitch.on = log.devotionTime == true ? true : false
            
            waterField.text = log.water! != 0 ? "\(log.water!)" : ""
            
        case 4:
            
            foodHeaderCell.hidden = true
            breakfastCell.hidden = true
            lunchCell.hidden = true
            dinnerCell.hidden = true
            snackCell.hidden = true
            sleepCell.hidden = true
            activityFullCell.hidden = true
            
            dailyMoodCell.hidden = true
            closenessToGodCell.hidden = true
            
            dryBrushingCell.hidden = true
            
            vitaminSwitch.on = log.multiVitamin == true ? true : false
            fishOilSwitch.on = log.codLiverOil == true ? true : false
            probioticSwitch.on = log.probiotic == true ? true : false
            
            activitySwitch.on = log.activity == true ? true : false
            devotionSwitch.on = log.devotionTime == true ? true : false
            detoxSwitch.on = log.detoxTea == true ? true : false
            
            waterField.text = log.water! != 0 ? "\(log.water!)" : ""
            
        case 5:
            
            foodHeaderCell.hidden = true
            breakfastCell.hidden = true
            lunchCell.hidden = true
            dinnerCell.hidden = true
            snackCell.hidden = true
            sleepCell.hidden = true
            activityFullCell.hidden = true
            
            dailyMoodCell.hidden = true
            closenessToGodCell.hidden = true
            
            vitaminSwitch.on = log.multiVitamin == true ? true : false
            fishOilSwitch.on = log.codLiverOil == true ? true : false
            probioticSwitch.on = log.probiotic == true ? true : false
            
            activitySwitch.on = log.activity == true ? true : false
            devotionSwitch.on = log.devotionTime == true ? true : false
            detoxSwitch.on = log.detoxTea == true ? true : false
            dryBrushingSwitch.on = log.dryBrushing == true ? true : false
            
            waterField.text = log.water! != 0 ? "\(log.water!)" : ""
            
        default:
            
            foodHeaderCell.hidden = true
            breakfastCell.hidden = true
            lunchCell.hidden = true
            dinnerCell.hidden = true
            snackCell.hidden = true
            activityFullCell.hidden = true
            
            dailyMoodCell.hidden = true
            closenessToGodCell.hidden = true
            
            detoxCell.hidden = true
            
            vitaminSwitch.on = log.multiVitamin == true ? true : false
            fishOilSwitch.on = log.codLiverOil == true ? true : false
            probioticSwitch.on = log.probiotic == true ? true : false
            
            activitySwitch.on = log.activity == true ? true : false
            devotionSwitch.on = log.devotionTime == true ? true : false
            dryBrushingSwitch.on = log.dryBrushing == true ? true : false
            
            sleepHoursField.text = log.sleepTime! != 0 ? "\(log.sleepTime!)" : ""
            sleepQualityField.text = log.sleepInfo != nil ? "\(log.sleepInfo!)" : ""
            
            waterField.text = log.water! != 0 ? "\(log.water!)" : ""
            
        }
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
    }
    
    // MARK: - TableView Methods
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 50
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
//        if supplementCell == nil { return UITableViewAutomaticDimension }

        switch week {
            
        case 1, 8:
            
            if indexPath.row == 1 ||
            indexPath.row == 10 ||
            indexPath.row == 11 ||
            indexPath.row == 12 ||
            indexPath.row == 13 {
                
                return 0
            } else {
                return UITableViewAutomaticDimension
            }
            
        case 2:
            
            if indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 6 || indexPath.row == 9 || indexPath.row == 10 || indexPath.row > 11 {
                
                return 0
                
            } else {
                return UITableViewAutomaticDimension
            }
            
        case 3:
            
            if indexPath.row == 3 ||
                indexPath.row == 4 ||
                indexPath.row == 5 ||
                indexPath.row == 6 ||
                indexPath.row == 7 ||
                indexPath.row == 8 ||
                indexPath.row == 6 ||
                indexPath.row == 9 ||
                indexPath.row > 11 {
                
                return 0
                
            } else {
                return UITableViewAutomaticDimension
            }
            
        case 4:
            
            if indexPath.row == 3 ||
                indexPath.row == 4 ||
                indexPath.row == 5 ||
                indexPath.row == 6 ||
                indexPath.row == 7 ||
                indexPath.row == 8 ||
                indexPath.row == 6 ||
                indexPath.row == 9 ||
                indexPath.row > 12 {
                
                return 0
                
            } else {
                return UITableViewAutomaticDimension
            }
            
        case 5:
            
            if indexPath.row == 3 ||
                indexPath.row == 4 ||
                indexPath.row == 5 ||
                indexPath.row == 6 ||
                indexPath.row == 7 ||
                indexPath.row == 8 ||
                indexPath.row == 6 ||
                indexPath.row == 9 ||
                indexPath.row > 13 {
                
                return 0
                
            } else {
                return UITableViewAutomaticDimension
            }
            
        default:
            
            if indexPath.row == 3 ||
                indexPath.row == 4 ||
                indexPath.row == 5 ||
                indexPath.row == 6 ||
                indexPath.row == 7 ||
                indexPath.row == 6 ||
                indexPath.row == 9 ||
                indexPath.row == 12 ||
                indexPath.row > 13 {
                
                return 0
                
            } else {
                return UITableViewAutomaticDimension
            }
            
        }
        
    }

    // MARK: - Picker methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 10
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(row + 1)"
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
            
        case moodPicker:
            
            dailyMood = row + 1
            
        case closenessPicker:
            
            closenessToGod = row + 1
            
        default:
            break
            
        }
        
    }
    
    // MARK: - TextField Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if week == 2 || week == 3 || week == 4 || week == 5 {
        
            textField.resignFirstResponder()
            return true
        
        }
        
        if textField == waterField {
            
            if week == 6 || week == 7 {
                
                waterField.resignFirstResponder()
                sleepHoursField.becomeFirstResponder()
                
            } else {
                
                waterField.resignFirstResponder()
                breakfastCaloriesField.becomeFirstResponder()
                
            }
            
        } else if textField == breakfastCaloriesField {
            breakfastCaloriesField.resignFirstResponder()
            breakfastField.becomeFirstResponder()
        } else if textField == breakfastField {
            breakfastField.resignFirstResponder()
            lunchCaloriesField.becomeFirstResponder()
        } else if textField == lunchCaloriesField {
            lunchCaloriesField.resignFirstResponder()
            lunchField.becomeFirstResponder()
        } else if textField == lunchField {
            lunchField.resignFirstResponder()
            dinnerCaloriesField.becomeFirstResponder()
        } else if textField == dinnerCaloriesField {
            dinnerCaloriesField.resignFirstResponder()
            dinnerField.becomeFirstResponder()
        } else if textField == dinnerField {
            dinnerField.resignFirstResponder()
            snacksCaloriesField.becomeFirstResponder()
        } else if textField == snacksCaloriesField {
            snacksCaloriesField.resignFirstResponder()
            snackField.becomeFirstResponder()
        } else if textField == snackField {
            snackField.resignFirstResponder()
            sleepHoursField.becomeFirstResponder()
        } else if textField == sleepHoursField {
            sleepHoursField.resignFirstResponder()
            sleepQualityField.becomeFirstResponder()
        } else if textField == sleepQualityField {
            
            if week == 6 || week == 7 {
                
                textField.resignFirstResponder()
                
            } else {
                
                sleepQualityField.resignFirstResponder()
                stepCountField.becomeFirstResponder()
                
            }
            
        } else if textField == stepCountField {
            stepCountField.resignFirstResponder()
            activeMinutesField.becomeFirstResponder()
        } else if textField == activeMinutesField {
            activeMinutesField.resignFirstResponder()
        }
        
        return true
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
            
        case waterField, breakfastCaloriesField, lunchCaloriesField, dinnerCaloriesField, snacksCaloriesField, stepCountField, sleepHoursField, activeMinutesField:
            
            let aSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
            let compSepByCharInSet = string.componentsSeparatedByCharactersInSet(aSet)
            let numberFiltered = compSepByCharInSet.joinWithSeparator("")
            return string == numberFiltered
            
        default:
            
            return true
            
        }
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        return true
        
    }
    
    // MARK: - IBActions
    
    @IBAction func switchPressed(sender: AnyObject) {
        
        switch sender.tag {
            
        case 1:
            
            log.multiVitamin = sender.on == true ? true : false
            
        case 2:
            
            log.codLiverOil = sender.on == true ? true : false

        case 3:
            
            log.probiotic = sender.on == true ? true : false
            
        case 4:
            
            log.activity = sender.on == true ? true : false
            
        case 5:
            
            log.devotionTime = sender.on == true ? true : false
            
        case 6:
            
            log.detoxTea = sender.on == true ? true : false
            
        case 7:

            log.dryBrushing = sender.on == true ? true : false
            
        default:
            
            break
            
        }
        
    }
    
    @IBAction func savePressed(sender: AnyObject) {
        
        log.water = waterField.text?.isEmpty == false ? Int(waterField.text! ?? "0") : 0
        log.breakfastCalories = breakfastCaloriesField.text?.isEmpty == false ? Int(breakfastCaloriesField.text! ?? "0") : 0
        log.breakfast = breakfastField.text!
        
        log.lunchCalories = lunchCaloriesField.text?.isEmpty == false ? Int(lunchCaloriesField.text! ?? "0") : 0
        log.lunch = lunchField.text!
        
        log.dinnerCalories = dinnerCaloriesField.text?.isEmpty == false ? Int(dinnerCaloriesField.text! ?? "0") : 0
        log.dinner = dinnerField.text!
        
        log.snackCalories = snacksCaloriesField.text?.isEmpty == false ? Int(snacksCaloriesField.text! ?? "0") : 0
        log.snacks = snackField.text!
        
        log.sleepTime = sleepHoursField.text?.isEmpty == false ? Int(sleepHoursField.text! ?? "0") : 0
        log.sleepInfo = sleepQualityField.text!
        
        log.stepCount = stepCountField.text?.isEmpty == false ? Int(stepCountField.text! ?? "0") : 0
        log.activeMinutes = activeMinutesField.text?.isEmpty == false ? Int(activeMinutesField.text! ?? "0") : 0
        
        log.mood = dailyMood
        log.closeness = closenessToGod
        
        if week == 1 || week == 8 {
            
            if waterField.text?.isEmpty == false &&
                breakfastCaloriesField.text?.isEmpty == false &&
                breakfastField.text?.isEmpty == false &&
                lunchCaloriesField.text?.isEmpty == false &&
                lunchField.text?.isEmpty == false &&
                dinnerCaloriesField.text?.isEmpty == false &&
                dinnerField.text?.isEmpty == false &&
                snacksCaloriesField.text?.isEmpty == false &&
                snackField.text?.isEmpty == false &&
                sleepHoursField.text?.isEmpty == false &&
                sleepQualityField.text?.isEmpty == false &&
                stepCountField.text?.isEmpty == false &&
                activeMinutesField.text?.isEmpty == false &&
                closenessToGod != 0 &&
                dailyMood != 0 {
                
                log.isComplete = true
            } else {
                log.isComplete = false
            }
            
        } else if week == 2 || week == 3 || week == 4 || week == 5 {
            
            if waterField.text?.isEmpty == false {
            
                log.isComplete = true
            
            } else {
            
                log.isComplete = false
            
            }
            
        } else if week == 6 || week == 7 {
            
            if waterField.text?.isEmpty == false && sleepHoursField.text?.isEmpty == false &&
            sleepQualityField.text?.isEmpty == false {
                
                log.isComplete = true
                
            } else {
                
                log.isComplete = false
                
            }
            
        }
        
        log.multiVitamin = vitaminSwitch.on
        log.codLiverOil = fishOilSwitch.on
        log.probiotic = probioticSwitch.on
        log.activity = activitySwitch.on
        log.devotionTime = devotionSwitch.on
        log.detoxTea = detoxSwitch.on
        log.dryBrushing = dryBrushingSwitch.on
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving measurements: \(error)")
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
}









