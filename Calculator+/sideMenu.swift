//
//  sideMenu.swift
//  Calculator+
//
//  Created by Omar Eldoronki on 10/31/19.
//  Copyright © 2019 Omar Eldoronki. All rights reserved.
//

import Foundation
import UIKit

class sideMenu: UIViewController {
    var backToVC = UISwipeGestureRecognizer()
    var chooseConverter = UITableView()
    var converterButtons = UIStackView()
    var speed = UIButton()
    var lengthAndDistance = UIButton()
    var temperature = UIButton()
    var mass = UIButton()
    override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .black
        
        buttonSetup(arg: speed, arg: "Speed")
        buttonSetup(arg: lengthAndDistance, arg: "Length and Distance")
        buttonSetup(arg: temperature, arg: "Temperature")
        buttonSetup(arg: mass, arg: "Mass")
//        chooseConverter.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        chooseConverter.backgroundColor = .blue
//        chooseConverter.numberOfRows(inSection: 3)
//        view.addSubview(chooseConverter)
        converterButtons.alignment = .center
        converterButtons.axis = .vertical
        converterButtons.distribution = .equalSpacing
        converterButtons.spacing = 0
        view.addSubview(converterButtons)
        converterButtons.translatesAutoresizingMaskIntoConstraints = false
        converterButtons.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        converterButtons.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        converterButtons.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        backToVC.direction = .down
        backToVC.addTarget(self, action: #selector(returnToVC))
        
        
    }
    func buttonSetup (arg button: UIButton, arg title: String)
    {
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        button.addTarget(self, action: #selector(goToConverter), for: .touchUpInside)
        converterButtons.addArrangedSubview(button)
    }
    @objc func goToConverter (sender: UIButton)
    {
        if (sender == speed)
        {
            performSegue(withIdentifier: "toSpeedVC", sender: self)
        }
    }
    @objc func returnToVC ()
    {
        performSegue(withIdentifier: "showSideMenu", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    }
}
