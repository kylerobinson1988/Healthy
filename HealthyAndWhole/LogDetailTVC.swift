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
    
    var dailyMood: Int = 0
    
    var closenessToGod: Int = 0
    
    var log: Log!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard log != nil else { return }
        
        weekAndDayLabel.text = "Week \(log.week!), Day \(log.day!)"
        
        waterField.text = log.water! != 0 ? "\(log.water!)" : ""

        breakfastCaloriesField.text = log.breakfastCalories! != 0 ? "\(log.breakfastCalories!)" : ""
        breakfastField.text = log.breakfast != nil ? "\(log.breakfast!)" : ""
        lunchCaloriesField.text = log.lunchCalories! != 0 ? "\(log.lunchCalories!)" : ""
        lunchField.text = log.lunch != nil ? "\(log.lunch!)" : ""
        dinnerCaloriesField.text = log.dinnerCalories! != 0 ? "\(log.dinnerCalories!)" : ""
        dinnerField.text = log.dinner != nil ? "\(log.dinner!)" : ""
        snacksCaloriesField.text = log.snackCalories! != 0 ? "\(log.snackCalories!)" : ""
        snackField.text = log.snacks != nil ? "\(log.snacks!)" : ""
        
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
        
        if textField == waterField {
            waterField.resignFirstResponder()
            breakfastCaloriesField.becomeFirstResponder()
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
            sleepQualityField.resignFirstResponder()
            stepCountField.becomeFirstResponder()
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
            
        case waterField, breakfastCaloriesField, lunchCaloriesField, dinnerCaloriesField, snacksCaloriesField, stepCountField, activeMinutesField:
            
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
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving measurements: \(error)")
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
}









