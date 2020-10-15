//
//  ViewController.swift
//  UIKitApp
//
//  Created by Егор Скрутелев on 15.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Segmented Control
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Slider
        
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        mainLabel.text = String(slider.value)
        
        // Date Picker
//        datePicker.locale = Locale.current
        datePicker.locale = Locale(identifier: "ru_RU")
    }
    @IBAction func segmentedControlAction() {
        switch  segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The secound segment is selected"
            mainLabel.textColor = .blue
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        default: break
        }
    }
    
    @IBAction func sliderAction() {
        let currentValue = CGFloat(slider.value)
        mainLabel.text = String(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(currentValue)
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            print("Text field is empty")
            showAlert(with: "Text field is empty", and: "Please enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            print("Wrong format")
            showAlert(with: "Wrong format", and: "Please enter your name")
            return
        }
        
        mainLabel.text = inputText
    }
    
    @IBAction func datePickerAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
}

// MARK: - Alert Controller
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
