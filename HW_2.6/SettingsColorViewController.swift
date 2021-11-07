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
        
    }
    
    @IBAction func doneButtodPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func changeSliderValue(_ sender: UISlider) {
        setColor()
        
        
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
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(redSlider.value)
        blueLabel.text = String(redSlider.value)
    }
    
    private func setValueForInputText(){
        redInputText.text = String(redSlider.value)
        greenInputText.text = String(redSlider.value)
        blueInputText.text = String(redSlider.value)
    }


}
