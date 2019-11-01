//
//  speedVC.swift
//  Calculator+
//
//  Created by Omar Eldoronki on 10/31/19.
//  Copyright © 2019 Omar Eldoronki. All rights reserved.
//

import Foundation
import UIKit

class speedVC: UIViewController, UITextFieldDelegate {
    var backToVC = UISwipeGestureRecognizer()
    var allStacked = UIStackView()
    var speed1 = UITextField()
    override func viewDidLoad() {
           super.viewDidLoad()
        self.becomeFirstResponder()
        view.backgroundColor = .blue
        backToVC.direction = .down
        backToVC.addTarget(self, action: #selector(returnToVC))
        
        allStacked.alignment = .center
        allStacked.axis = .vertical
        allStacked.distribution = .equalSpacing
        allStacked.spacing = 0
        view.addSubview(allStacked)
        allStacked.translatesAutoresizingMaskIntoConstraints = false
        allStacked.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        allStacked.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        allStacked.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    @objc func returnToVC ()
    {
        performSegue(withIdentifier: "showSideMenu", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    }
}
