//
//  OneViewController.swift
//  changeСolorOfWindow
//
//  Created by Игорь Чумиков on 06.09.2021.
//

import UIKit

protocol MyViewControllerDelegate {
    func setNewValues(color: UIColor)
}

class OneViewController: UIViewController {
    
    @IBOutlet weak var windowView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let myNewVC = navigationVC.topViewController as? MyViewController else { return }
        
        myNewVC.viewColorVC = windowView.backgroundColor ?? UIColor(
            red: CGFloat(0.00),
            green: CGFloat(0.00),
            blue: CGFloat(0.00),
            alpha: 1
        )
        myNewVC.delegate = self
    }
}

extension OneViewController: MyViewControllerDelegate {
    func setNewValues(color: UIColor) {
        windowView.backgroundColor = color
        view.backgroundColor = color
    }
}
