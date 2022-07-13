//
//  ViewController.swift
//  HomeWork2.03
//
//  Created by Denis Bokov on 24.06.2022.
//

import UIKit

class ColorViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redValueTextField: UITextField!
    @IBOutlet var blueValueTextField: UITextField!
    @IBOutlet var greenValueTextField: UITextField!
    
    
    var colorOneController: UIColor!
    var deligate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redValueTextField.delegate = self
        blueValueTextField.delegate = self
        greenValueTextField.delegate = self
        colorView.layer.cornerRadius = 25
        colorView.backgroundColor = colorOneController
        setupSlider()
        setValue(for: redSliderValue, greenSliderValue, blueSliderValue)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func changeСolorView(_ sender: UISlider) {
        setupDefaultColor()
        switch sender {
        case redSlider:
            redSliderValue.text = shangeTextLabel(redSlider)
            redValueTextField.text = shangeTextLabel(redSlider)
        case greenSlider:
            greenSliderValue.text = shangeTextLabel(greenSlider)
            greenValueTextField.text = shangeTextLabel(greenSlider)
        default:
            blueSliderValue.text = shangeTextLabel(blueSlider)
            blueValueTextField.text = shangeTextLabel(blueSlider)
        }
    }
    
    @IBAction func applySettings() {
        view.endEditing(true)
        deligate.setNewValues(from: colorView.backgroundColor ?? UIColor.white)
        dismiss(animated: true)
    }
    
    private func setupDefaultColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func shangeTextLabel(_ colorSlider: UISlider) -> String {
        String(format: "%.2f", colorSlider.value)
    }
    
    private func setValue(for lables: UILabel...) {
        lables.forEach { label in
            switch label {
            case redSliderValue:
                redSliderValue.text = shangeTextLabel(redSlider)
                redValueTextField.text = shangeTextLabel(redSlider)
            case greenSliderValue:
                greenSliderValue.text = shangeTextLabel(greenSlider)
                greenValueTextField.text = shangeTextLabel(greenSlider)
            default:
                blueSliderValue.text = shangeTextLabel(blueSlider)
                blueValueTextField.text = shangeTextLabel(blueSlider)
            }
        }
    }
    
    private func setupSlider() {
        let ciColor = CIColor(color: colorOneController)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
}

// MARK: - UITextFieldDelegate
extension ColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let valueTextField = textField.text else { return }
        guard let numberValue = Float(valueTextField), Float(valueTextField) ?? 0 <= 1 else {
            showAlert(with: "Oops!", and: "Введите корректное число. От 0.0 до 1.0")
            return
        }
        
        if textField == redValueTextField {
            redSlider.value = numberValue
            setupDefaultColor()
        } else if textField == greenValueTextField {
            greenSlider.value = numberValue
            setupDefaultColor()
        } else {
            blueSlider.value = numberValue
            setupDefaultColor()
        }
    }
}

extension ColorViewController {
    private func showAlert(with title: String, and message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}





