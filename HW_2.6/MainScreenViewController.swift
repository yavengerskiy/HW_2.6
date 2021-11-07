//
//  MainScreenViewController.swift
//  HW_2.6
//
//  Created by Beelab on 07/11/21.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = .white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsColorVC = segue.destination as! SettingsColorViewController
        settingsColorVC.mainVievBackgroudColor = backgroundView.backgroundColor
        settingsColorVC.delegate = self
        
    }
    
}

// MARK: - ViewBackgroundDeligate
extension MainScreenViewController: ViewBackgroundDeligate {
    func setColor(_ color: UIColor) {
        backgroundView.backgroundColor = color
    }
}
