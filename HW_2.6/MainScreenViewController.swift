//
//  MainScreenViewController.swift
//  HW_2.6
//
//  Created by Beelab on 07/11/21.
//

import UIKit

class MainScreenViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsColorVC = segue.destination as! SettingsColorViewController
        settingsColorVC.mainVievBackgroudColor = view.backgroundColor
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let settingsColorVC = segue.source as! SettingsColorViewController
        settingsColorVC.delegate = self
        settingsColorVC.setColor()
    }
}

// MARK: - ViewBackgroundDeligate
extension MainScreenViewController: ViewBackgroundDeligate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
