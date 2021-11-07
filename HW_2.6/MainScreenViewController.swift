//
//  MainScreenViewController.swift
//  HW_2.6
//
//  Created by Beelab on 07/11/21.
//

import UIKit

protocol ViewBackgroundDeligate {
    func setColor(_ color: UIColor)
}

class MainScreenViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsColorVC = segue.destination as! SettingsColorViewController
        settingsColorVC.mainVievBackgroudColor = view.backgroundColor
        settingsColorVC.delegate = self
    }
}

// MARK: - ViewBackgroundDeligate
extension MainScreenViewController: ViewBackgroundDeligate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
