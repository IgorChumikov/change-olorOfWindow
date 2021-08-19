//
//  ViewController.swift
//  changeСolorOfWindow
//
//  Created by Игорь Чумиков on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = 1
        redLineCounterLabel.text = "1.00"
        
        greenSlider.value = 1
        greenLineCounterLabel.text = "1.00"
        
        blueSlider.value = 1
        blueLineCounterLabel.text = "1.00"
    }
    
    override func viewDidLayoutSubviews() {
        paintWindowView.layer.cornerRadius = 10
    }

    @IBAction func changeСolorWithSlider() {
        
        redLineCounterLabel.text = String(format: "%.2f", redSlider.value)
        greenLineCounterLabel.text = String(format: "%.2f", greenSlider.value)
        blueLineCounterLabel.text = String(format: "%.2f", blueSlider.value)
        
        paintWindowView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
