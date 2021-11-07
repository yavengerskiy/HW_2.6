//
//  ViewController.swift
//  HW_2.6
//
//  Created by Beelab on 06/11/21.
//

import UIKit

class SettingsColorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var previewColor: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var redInputText: UITextField!
    @IBOutlet weak var greenInputText: UITextField!
    @IBOutlet weak var blueInputText: UITextField!
    
    var mainVievBackgroudColor: UIColor!
    var delegate: ViewBackgroundDeligate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewColorStyle()
        
        setValueForSliders()
        setValueForLabels()
        setValueForInputTexts()
        
        addDoneButton(for: redInputText)
        addDoneButton(for: greenInputText)
        addDoneButton(for: blueInputText)
        
        redInputText.delegate = self
        greenInputText.delegate = self
        blueInputText.delegate = self
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(previewColor.backgroundColor!)
        dismiss(animated: true)
    }
    
    @IBAction func changeSliderValue(_ sender: UISlider) {
        setColorForPreview()
        setValueForLabels()
        setValueForInputTexts()
    }
    
    private func previewColorStyle(){
        previewColor.layer.cornerRadius = 10
        previewColor.backgroundColor = mainVievBackgroudColor
        previewColor.layer.borderWidth = 1
        previewColor.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
    }
    
    private func setColorForPreview() {
        let selectedColor = UIColor(red: CGFloat(redSlider.value),
                                    green: CGFloat(greenSlider.value),
                                    blue: CGFloat(blueSlider.value),
                                    alpha: 1)
        previewColor.backgroundColor = selectedColor
    }
    
    private func setValueForLabels(){
        redLabel.text = formattedString(from: redSlider.value)
        greenLabel.text = formattedString(from: greenSlider.value)
        blueLabel.text = formattedString(from: blueSlider.value)
    }
    
    private func setValueForInputTexts(){
        redInputText.text = formattedString(from: redSlider.value)
        greenInputText.text = formattedString(from: greenSlider.value)
        blueInputText.text = formattedString(from: blueSlider.value)
    }
    
    private func formattedString(from sliderValue: Float) -> String {
        String(format: "%.2f", sliderValue)
    }
    
    private func setValueForSliders() {
        redSlider.value = Float(CIColor(color: mainVievBackgroudColor).red)
        greenSlider.value = Float(CIColor(color: mainVievBackgroudColor).green)
        blueSlider.value = Float(CIColor(color: mainVievBackgroudColor).blue)
    }
}

// MARK: - showAlert
extension SettingsColorViewController {
    private func showAlert (title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present (alert , animated: true )
        
    }
}

// MARK: - textFieldDidEndEditing
extension SettingsColorViewController {
    
    func textFieldDidEndEditing(_ inputTextField: UITextField) {
        
        if let currentValue = Float(inputTextField.text!) {
            switch inputTextField.tag {
            case 1: redSlider.value = currentValue
            case 2: greenSlider.value = currentValue
            case 3: blueSlider.value = currentValue
            default: break
            }
            
            setColorForPreview()
            setValueForLabels()
            setValueForInputTexts()
            
        } else {
            showAlert(title: "Неправильный формат 😡",
                      message: "Пожалуйста введите корректное значение") }
    }
    
    func textFieldShouldReturn(_ inputTextField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - addDoneButton
extension SettingsColorViewController {
    private func addDoneButton(for inputTextField: UITextField) {
        
        let toolbarWithDoneButton = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(doneButtonPressedOnToolBar))

        toolbarWithDoneButton.items = [flexSpace, doneButton]
        toolbarWithDoneButton.sizeToFit()
        inputTextField.inputAccessoryView = toolbarWithDoneButton
        
    }
    
    @objc private func doneButtonPressedOnToolBar() {
        view.endEditing(true)
    }
}


