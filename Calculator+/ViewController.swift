//
//  ViewController.swift
//  Calculator
//
//  Created by  on 9/23/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField1 = UITextField()
    var textField2 = UITextField()
    var sideMenuButton = UIButton()
    var sideMenuGesture = UISwipeGestureRecognizer()
    var add = UIButton()
    var subtract = UIButton()
    var multiply = UIButton()
    var sqrt = UIButton()
    var sqr = UIButton()
    var divide = UIButton()
    var calculate = UIButton()
    var resultLabel = UILabel()
    var stackView = UIStackView()
    var operationStack = UIStackView()
    var txtFld1Stack = UIStackView()
    var txtFld2Stack = UIStackView()
    var operation = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        view.backgroundColor = UIColor.lightGray
        textFieldSetup(arg: textField1)
        textFieldSetup(arg: textField2)
        
        sideMenuGesture.direction = .up
        sideMenuGesture.location(ofTouch: 6, in: view)
        sideMenuGesture.addTarget(self, action: #selector(viewSideMenu))
        view.addGestureRecognizer(sideMenuGesture)
        
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 10
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(operationStack)
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(calculate)
        stackView.addArrangedSubview(resultLabel)
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        operationStack.axis = .horizontal
        operationStack.distribution = UIStackView.Distribution.equalSpacing
        operationStack.addArrangedSubview(add)
        operationStack.addArrangedSubview(subtract)
        operationStack.addArrangedSubview(multiply)
        operationStack.addArrangedSubview(divide)
        operationStack.addArrangedSubview(sqrt)
        operationStack.addArrangedSubview(sqr)
        
        
        buttonSetup(arg: add, arg: "+")
        buttonSetup(arg: subtract, arg: "-")
        buttonSetup(arg: multiply, arg: "•")
        buttonSetup(arg: divide, arg: "÷")
        buttonSetup(arg: sqrt, arg: "√")
        buttonSetup(arg: sqr, arg: "^")
        buttonSetup(arg: calculate, arg: "Calculate")
        calculate.addTarget(self, action: #selector(self.calc), for: .touchUpInside)
        add.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        subtract.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        multiply.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        divide.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        sqrt.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        sqr.addTarget(self, action: #selector(self.operate), for: .touchUpInside)
        
        sideMenuButton.setTitle("Menu", for: .normal)
        sideMenuButton.setTitleColor(.black, for: .normal)
        sideMenuButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: .bold)
        sideMenuButton.addTarget(self, action: #selector(viewSideMenu), for: .touchUpInside)
        view.addSubview(sideMenuButton)
        sideMenuButton.translatesAutoresizingMaskIntoConstraints = false
        sideMenuButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        sideMenuButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -300).isActive = true
        sideMenuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        sideMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
    }
    @objc func viewSideMenu ()//brings up the side menu
    {
        performSegue(withIdentifier: "showSideMenu", sender: self)
    }
    @objc func calc (sender: UIButton!)//allows the user to calculate using a button
    {
        doMath()
        operationSelected(arg: add, arg: sqr, arg: subtract, arg: multiply, arg: divide, arg: sqrt, arg: false)
        operation = ""
    }
    @objc func operate (sender: UIButton!)
    {
        if (sender == add)
        {
            operation = "+"
            operationSelected(arg: add, arg: sqr, arg: subtract, arg: multiply, arg: divide, arg: sqrt, arg: true)
        }
        if (sender == subtract)
        {
            operation = "-"
            operationSelected(arg: subtract, arg: add, arg: sqr, arg: multiply, arg: divide, arg: sqrt, arg: true)
        }
        if (sender == multiply)
        {
            operation = "•"
            operationSelected(arg: multiply, arg: add, arg: subtract, arg: sqr, arg: divide, arg: sqrt, arg: true)
        }
        if (sender == divide)
        {
            operation = "÷"
            operationSelected(arg: divide, arg: add, arg: subtract, arg: multiply, arg: sqr, arg: sqrt, arg: true)
        }
        if (sender == sqrt)
        {
            operation = "√"
            operationSelected(arg: sqrt, arg: add, arg: subtract, arg: multiply, arg: divide, arg: sqr, arg: true)
        }
        if (sender == sqr)
        {
            operation = "^"
            operationSelected(arg: sqr, arg: add, arg: subtract, arg: multiply, arg: divide, arg: sqrt, arg: true)
        }
    }
    
    func operationSelected (arg button1: UIButton, arg button2: UIButton, arg button3: UIButton, arg button4: UIButton, arg button5: UIButton, arg button6: UIButton, arg emphasizeFirstButton: Bool)
    {
        if emphasizeFirstButton
        {
            button1.titleLabel?.font = UIFont.systemFont(ofSize: 28.0, weight: .bold)
        }
        else
        {
            button1.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        }
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        button5.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        button6.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
    }
    
    func buttonSetup (arg button: UIButton, arg title: String)
    {
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
    }
    func textFieldSetup (arg txtFld: UITextField)
    {
        txtFld.delegate = self
        txtFld.placeholder = "Enter a number"
        txtFld.font = UIFont.systemFont(ofSize: 20)
        txtFld.borderStyle = UITextField.BorderStyle.roundedRect
        txtFld.autocorrectionType = UITextAutocorrectionType.yes
        txtFld.keyboardType = UIKeyboardType.decimalPad
        txtFld.returnKeyType = UIReturnKeyType.done
        txtFld.clearButtonMode = UITextField.ViewMode.whileEditing;
        txtFld.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(txtFld)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        view.endEditing(true)
        operationSelected(arg: add, arg: sqr, arg: subtract, arg: multiply, arg: divide, arg: sqrt, arg: false)
        operation = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        calc(sender: calculate)
        
        return true
    }
    func doMath ()
    {
        
        if (operation == "")
        {
            resultLabel.text = "Choose an operation"
        }
        else if (operation == "√")
        {
            let result = (Double(textField1.text ?? "1.0" )!).squareRoot()
            let isInteger = floor(result)
            if  (isInteger == result)
            {
                resultLabel.text = "\(operation)\((textField1.text)!) \((textField2.text)!) = \(Int(result))"
            }
            else
            {
                resultLabel.text = "\(operation)\((textField1.text)!) \((textField2.text)!) = \(result)"
            }
        }
        else if (textField1.text == "" || textField2.text == "")
        {
            resultLabel.text = "Some of the required fields are filled with invalid entries."
        }
        
        else
        {
            let x = Double((textField1.text)!)
            let y = Double((textField2.text)!)
            var result = Double()
            if (operation == "+")
            {
                result = (x)! + (y)!
            }
            if (operation == "-")
            {
                result = (x)! - (y)!
            }
            if (operation == "•")
            {
                result = (x)! * (y)!
            }
            if (operation == "÷")
            {
                result = (x)! / (y)!
            }
            if (operation == "√")
            {
                result = (x)! / (y)!
            }
            if (operation == "^")
            {
                result = pow((x)!, (y)!)
            }
            let isInteger = floor(result)
            if  (isInteger == result)
            {
                resultLabel.text = "\((textField1.text)!) \(operation) \((textField2.text)!) = \(Int(result))"
            }
            else
            {
                resultLabel.text = "\((textField1.text)!) \(operation) \((textField2.text)!) = \(result)"
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    }
}
