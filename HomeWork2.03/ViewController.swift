//
//  ViewController.swift
//  HomeWork2.03
//
//  Created by Denis Bokov on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    private let maxValueSlider: Float = 1
    private let minValueSlider: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider()
        
        shangeView()
        
    }

    @IBAction func changeСolorView() {
        
        shangeView()
    }
    
    
    private func shangeView() {
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        shangeTextLabel(redSlider, redSliderValue)
        shangeTextLabel(greenSlider, greenSliderValue)
        shangeTextLabel(blueSlider, blueSliderValue)
    }
    
    private func shangeTextLabel(_ colorSlider: UISlider, _ colorSliderLabel: UILabel) {
        colorSliderLabel.text = String((colorSlider.value * 100).rounded() / 100)
    }
    
    private func setupSlider() {
        
        redSlider.maximumValue = maxValueSlider
        redSlider.minimumValue = minValueSlider
        
        greenSlider.maximumValue = maxValueSlider
        greenSlider.minimumValue = minValueSlider
        
        blueSlider.maximumValue = maxValueSlider
        blueSlider.minimumValue = minValueSlider
        
        redSlider.value = 0.25
        greenSlider.value = 0.35
        blueSlider.value = 0.45
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
    }
    
}

