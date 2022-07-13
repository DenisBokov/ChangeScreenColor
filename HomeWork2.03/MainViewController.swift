//
//  MainViewController.swift
//  HomeWork2.03
//
//  Created by Denis Bokov on 13.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(from color: UIColor)
}

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else { return }
        colorVC.colorOneController = view.backgroundColor
        colorVC.deligate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
   func setNewValues(from color: UIColor) {
       view.backgroundColor = color
   }
}


