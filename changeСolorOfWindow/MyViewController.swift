//
//  ViewController.swift
//  changeСolorOfWindow
//
//  Created by Игорь Чумиков on 20.08.2021.
//

import UIKit

class MyViewController: UIViewController {
    
    //UIView
    @IBOutlet weak var paintWindowView: UIView!
    
    //UILabel
    @IBOutlet weak var redLineCounterLabel: UILabel!
    @IBOutlet weak var greenLineCounterLabel: UILabel!
    @IBOutlet weak var blueLineCounterLabel: UILabel!
    
    //UISlider
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    //UITextField
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var viewColorVC: UIColor!
    var delegate: MyViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upDate()
    }
    
    override func viewDidLayoutSubviews() {
        paintWindowView.layer.cornerRadius = 10
    }
    
    private func upDate() {
        
        redSlider.value = 1
        redLineCounterLabel.text = "1.00"
        redTextField.text = "1.00"
        
        greenSlider.value = 1
        greenLineCounterLabel.text = "1.00"
        greenTextField.text = "1.00"
        
        blueSlider.value = 1
        blueLineCounterLabel.text = "1.00"
        blueTextField.text = "1.00"
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
    
    @IBAction func changeСolorWithSlider(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            redTextField.text = String(format: "%.2f", redSlider.value)
            redLineCounterLabel.text = redTextField.text
        case greenSlider:
            greenTextField.text = String(format: "%.2f", greenSlider.value)
            greenLineCounterLabel.text = greenTextField.text
        default:
            blueTextField.text = String(format: "%.2f", blueSlider.value)
            blueLineCounterLabel.text = blueTextField.text
        }
        
            paintWindowView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
    }
    
    @IBAction func doneButton() {
        
        view.endEditing(true)
        let newColor = UIColor(red: CGFloat(redSlider.value),
                               green: CGFloat(greenSlider.value),
                               blue: CGFloat(blueSlider.value),
                               alpha: 1
        )
        paintWindowView.backgroundColor = newColor
        delegate?.setNewValues(color: newColor)
        dismiss(animated: true)
    }
}

extension MyViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        if textField == redTextField {
            redTextField.text = newValue
            redLineCounterLabel.text = newValue
            redSlider.value = numberValue
            
        } else if textField == greenTextField {
            greenTextField.text = newValue
            greenLineCounterLabel.text = newValue
            greenSlider.value = numberValue
            
        } else if textField == blueTextField{
            blueTextField.text = newValue
            blueLineCounterLabel.text = newValue
            blueSlider.value = numberValue
        }
    }
}
