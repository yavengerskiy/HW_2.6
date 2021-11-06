//
//  ViewController.swift
//  HW_2.6
//
//  Created by Beelab on 06/11/21.
//

import UIKit

class ViewController: UIViewController {

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewColor.layer.cornerRadius = 10
        
    }


}

