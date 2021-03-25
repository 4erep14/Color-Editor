//
//  ViewController.swift
//  Color Editor
//
//  Created by admin on 24.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var figure: UIView!
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    @IBOutlet var doneButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        figure.layer.cornerRadius = 10
        
        doneButton.isHidden = true
        
        // Setup red slider
        redSlider.minimumTrackTintColor = .red
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        // Setup green slider
        greenSlider.minimumTrackTintColor = .green
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        // Setup blue slider
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        
    }
    
    func figureColor() {
        figure.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func redSliderAction() {
        redColorValue.text = String(format: "%.2f", redSlider.value)
        figureColor()
    }
    
    @IBAction func greenSliderAction() {
        greenColorValue.text = String(format: "%.2f", greenSlider.value)
        figureColor()
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        blueColorValue.text = String(format: "%.2f", blueSlider.value)
        figureColor()
    }
    


    @IBAction func redTextFielderTouched() {
        doneButton.isHidden = false
    }
    
    @IBAction func greenTextFieldTouched() {
        doneButton.isHidden = false
    }
    
    @IBAction func blueTextFieldTouched() {
        doneButton.isHidden = false
    }
    
    @IBAction func doneButtonPressed() {
        UIApplication.shared.endEditing()
        doneButton.isHidden = true
        guard let inputRed = redTextField.text, !inputRed.isEmpty else { return }
        if (redTextField.text! as NSString).floatValue > 1 {
            redSlider.value = 1
            redTextField.text = "1.00"
            redColorValue.text = "1.00"
        } else {
            redSlider.value = (redTextField.text! as NSString).floatValue
            redColorValue.text = String(format: "%.2f", redSlider.value)

        }
        guard let inputGreen = greenTextField.text, !inputGreen.isEmpty else { return }
        if (greenTextField.text! as NSString).floatValue > 1 {
            greenSlider.value = 1
            greenTextField.text = "1.00"
            greenColorValue.text = "1.00"
        } else {
            greenSlider.value = (greenTextField.text! as NSString).floatValue
            greenColorValue.text = String(format: "%.2f", greenSlider.value)

        }
        guard let inputBlue = blueTextField.text, !inputBlue.isEmpty else { return }
        if (blueTextField.text! as NSString).floatValue > 1 {
            blueSlider.value = 1
            blueTextField.text = "1.00"
            blueColorValue.text = "1.00"
        } else {
            blueSlider.value = (blueTextField.text! as NSString).floatValue
            blueColorValue.text = String(format: "%.2f", blueSlider.value)

        }
        
    }
    
    @IBAction func screenTap(_ sender: Any) {
        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()
    }
    

}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
