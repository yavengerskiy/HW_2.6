//
//  ViewController.swift
//  HW_2.6
//
//  Created by Beelab on 06/11/21.
//

import UIKit

class SettingsColorViewController: UIViewController {

    @IBOutlet weak var previewColor: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var redInputText: UITextField!
    @IBOutlet weak var greenInputText: UITextField!
    @IBOutlet weak var blueInputText: UITextField!
    
    var mainVievBackgroudColor: UIColor!
    var delegate: ViewBackgroundDeligate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewColor.layer.cornerRadius = 10
        previewColor.backgroundColor = mainVievBackgroudColor
    
        setValueForSliders()
        setValueForLabels()
        setValueForInputTexts()
        
    }
    
    @IBAction func doneButtodPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func changeSliderValue(_ sender: UISlider) {
        setColor()
        setValueForLabels()
        setValueForInputTexts()
    }
    
    func setColor() {
        let selectedColor = UIColor(red: CGFloat(redSlider.value),
                                    green: CGFloat(greenSlider.value),
                                    blue: CGFloat(blueSlider.value),
                                    alpha: 1)
        previewColor.backgroundColor = selectedColor
        delegate?.setColor(selectedColor)
    }
    
    private func setValueForLabels(){
        redLabel.text = formattedString(from: redSlider.value)
        greenLabel.text = formattedString(from: redSlider.value)
        blueLabel.text = formattedString(from: redSlider.value)
    }
    
    private func setValueForInputTexts(){
        redInputText.text = formattedString(from: redSlider.value)
        greenInputText.text = formattedString(from: redSlider.value)
        blueInputText.text = formattedString(from: redSlider.value)
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
