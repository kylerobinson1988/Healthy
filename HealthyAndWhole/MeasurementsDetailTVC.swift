//
//  MeasurementsDetailTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/5/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

let numberEntrySet = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

class MeasurementsDetailTVC: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var headerInfo: UILabel!
    
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var hipField: UITextField!
    @IBOutlet weak var waistField: UITextField!
    @IBOutlet weak var bustField: UITextField!
    @IBOutlet weak var thighField: UITextField!
    @IBOutlet weak var upperArmField: UITextField!
    
    @IBOutlet weak var healthProblemsField: UITextField!
    
    @IBOutlet weak var moodPicker: UIPickerView!
    @IBOutlet weak var closenessPicker: UIPickerView!
    
    var dailyMood: Int = 0
    
    var closenessToGod: Int = 0
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var measurements: Measurements!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard measurements != nil else { return }
        
        heightField.text = measurements.height
        weightField.text = measurements.weight
        hipField.text = measurements.hip
        waistField.text = measurements.waist
        bustField.text = measurements.bust
        thighField.text = measurements.thigh
        upperArmField.text = measurements.upperArm
        healthProblemsField.text = measurements.healthProblems
        
        moodPicker.selectRow((Int(measurements.mood!) - 1), inComponent: 0, animated: false)
        closenessPicker.selectRow((Int(measurements.closeness!) - 1), inComponent: 0, animated: false)

        
//        selectClose(Int(measurements.closeness! ?? 0))
//        selectMood(Int(measurements.mood! ?? 0))
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - TextField Methods
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        switch textField {
            
        case heightField:
            heightField.resignFirstResponder()
            weightField.becomeFirstResponder()
        case weightField:
            weightField.resignFirstResponder()
            hipField.becomeFirstResponder()
        case hipField:
            hipField.resignFirstResponder()
            waistField.becomeFirstResponder()
        case waistField:
            waistField.resignFirstResponder()
            bustField.becomeFirstResponder()
        case bustField:
            bustField.resignFirstResponder()
            thighField.becomeFirstResponder()
        case thighField:
            thighField.resignFirstResponder()
            upperArmField.becomeFirstResponder()
        case upperArmField:
            upperArmField.resignFirstResponder()
            healthProblemsField.becomeFirstResponder()
        case healthProblemsField:
            healthProblemsField.resignFirstResponder()
        default: break
            
        }
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
            
        case healthProblemsField:
            
            return true
            
        default:
            
            let aSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
            let compSepByCharInSet = string.componentsSeparatedByCharactersInSet(aSet)
            let numberFiltered = compSepByCharInSet.joinWithSeparator("")
            return string == numberFiltered
            
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
    
    // MARK: - IBActions
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        //Save changes to CoreData.
        
        measurements.height = heightField.text
        measurements.weight = weightField.text
        measurements.hip = hipField.text
        measurements.waist = waistField.text
        measurements.bust = bustField.text
        measurements.thigh = thighField.text
        measurements.upperArm = upperArmField.text
        measurements.healthProblems = healthProblemsField.text
        
        measurements.closeness = closenessToGod
        measurements.mood = dailyMood
        
        if heightField.text?.isEmpty == false &&
        weightField.text?.isEmpty == false &&
        hipField.text?.isEmpty == false &&
        waistField.text?.isEmpty == false &&
        bustField.text?.isEmpty == false &&
        thighField.text?.isEmpty == false &&
        upperArmField.text?.isEmpty == false &&
        healthProblemsField.text?.isEmpty == false &&
        closenessToGod != 0 &&
            dailyMood != 0 {
            measurements.isComplete = true
        }
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving measurements: \(error)")
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
}











