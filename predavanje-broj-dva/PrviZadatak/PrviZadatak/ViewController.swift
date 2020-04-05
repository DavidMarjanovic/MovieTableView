//
//  ViewController.swift
//  PrviZadatak
//
//  Created by David Marjanović on 10/03/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate	 {
    
    //MARK: VIEW CONTROLLER
    
    
    
    let textField: UITextField = {
        let text = UITextField()
        text.text = "Upiši palindrom"
        text.textColor = UIColor.lightGray
        
        
        text.textAlignment = .left
        
        return text
    }()
    
    let dividerLine: UILabel = {
        let line = UILabel()
        line.backgroundColor = .lightGray
        return line
    }()
    
    let provjeriBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .init(red: 0.145, green: 0.4, blue: 0.51, alpha: 1)
        button.setTitle("Provjeri", for: .normal)
        return button
    }()
    
    
    //MARK: buton tapped
    @objc func buttonAction(sender: UIButton!) {
        textField.resignFirstResponder()
        print("Button tapped")
        var strReversed = ""
        for character in textField.text?.lowercased() ?? "" {
            strReversed.insert(character, at: strReversed.startIndex)
        }
        if textField.text?.matches("^[a-zA-Z ]{1,30}$") == true {
            if (textField.text?.count == 1) {
                netocnoAlert()
            }
            if (textField.text?.lowercased() == strReversed) {
                tocnoAlert()
            } else {
                netocnoAlert()
            }
        } else {
            nijeRijecAlert()
        }
        print(strReversed)
        
    }
    
    
    
    
//MARK: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Palindrom"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        view.addSubview(textField)
        view.addSubview(dividerLine)
        view.addSubview(provjeriBtn)
        textField.delegate = self
        textFieldDidBeginEditing(textField)
        textFieldDidEndEditing(textField)
        provjeriBtn.addTarget(self, action: #selector(buttonAction),for: .touchUpInside)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        
        setupLayout()
    }


//MARK: SETUP LAYOUT
    private func setupLayout() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 66).isActive = true
        
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        dividerLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        dividerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        dividerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        provjeriBtn.translatesAutoresizingMaskIntoConstraints = false
        provjeriBtn.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: 55).isActive = true
        provjeriBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        provjeriBtn.widthAnchor.constraint(equalToConstant: 265).isActive = true
        provjeriBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    
    func textFieldDidBeginEditing(_ textView: UITextField) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textFieldDidEndEditing(_ textView: UITextField) {
        if textView.text?.isEmpty ?? false {
            textView.text = "Upiši palindrom"
            textView.textColor = UIColor.lightGray
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //MARK: TOCNO ALERT
    func tocnoAlert() {
        
        let mutableString = NSMutableAttributedString()
        let message1 = "Riječ koju ste upisali je palindrom!\n"
        let message2 = "Znate li još koji palindrom?"
        let attribute1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.black]
        let attribute2 =  [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.236, green: 0.729, blue: 0.194, alpha: 1)]
        let atrStr1 = NSAttributedString(string: message1, attributes: attribute1)
        let atrStr2 = NSAttributedString(string: message2, attributes: attribute2)
        mutableString.append(atrStr1)
        mutableString.append(atrStr2)
        let alert = UIAlertController(title: "Točno!", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.setValue(mutableString, forKey: "AttributedMessage")
        
        alert.addAction(UIAlertAction(title: "Upiši drugi palindrom", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func netocnoAlert() {
        
        let mutableString = NSMutableAttributedString()
        let message1 = "Riječ koju ste upisali nije palindrom!\n"
        let message2 = "Pokušajte sa drugom riječi."
        let attribute1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.black]
        let attribute2 =  [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.961, green: 0.388, blue: 0.4, alpha: 1)]
        let atrStr1 = NSAttributedString(string: message1, attributes: attribute1)
        let atrStr2 = NSAttributedString(string: message2, attributes: attribute2)
        mutableString.append(atrStr1)
        mutableString.append(atrStr2)
        let alert = UIAlertController(title: "Netočno!", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.setValue(mutableString, forKey: "AttributedMessage")
        
        alert.addAction(UIAlertAction(title: "Upiši drugi palindrom", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func nijeRijecAlert() {
        
        let mutableString = NSMutableAttributedString()
        let message1 = "Unos nije riječ. Pokušajte unijeti pravu\n"
        let message2 = "riječ koja je ujedno i palindrom."
        let attribute1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.black]
        let attribute2 =  [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)]
        let atrStr1 = NSAttributedString(string: message1, attributes: attribute1)
        let atrStr2 = NSAttributedString(string: message2, attributes: attribute2)
        mutableString.append(atrStr1)
        mutableString.append(atrStr2)
        let alert = UIAlertController(title: "Netočno!", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.setValue(mutableString, forKey: "AttributedMessage")
        
        alert.addAction(UIAlertAction(title: "Upiši drugi palindrom", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
