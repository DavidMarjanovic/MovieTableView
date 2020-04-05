//
//  ViewController.swift
//  drugiZadatak
//
//  Created by David Marjanović on 12/03/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let label1: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:0,y:0,width:324,height:19)
        label.text = "Broj igrača koji će sudjelovati u igri"
        label.textColor = UIColor(red:0.875, green: 0.57, blue: 0.288, alpha: 1)
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:0,y:0,width:324,height:19)
        label.text = "Promjena smjera*"
        label.textColor = UIColor(red:0.875, green: 0.57, blue: 0.288, alpha: 1)
        return label
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:0,y:0,width:324,height:19)
        label.text = "Preskakanje igrača*"
        label.textColor = UIColor(red:0.875, green: 0.57, blue: 0.288, alpha: 1)
        return label
    }()
    
    let label4: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x:0,y:0,width:324,height:19)
        label.text = "*S kojim brojem trenutni broj mora biti djeljiv"
        label.textColor = UIColor(red:0.875, green: 0.57, blue: 0.288, alpha: 1)
        return label
    }()
    
    let txtField1: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922,alpha: 1)
        field.keyboardType = UIKeyboardType.numberPad
        return field
    }()
    
    let txtField2: UITextField = {
        let field = UITextField()
        field.keyboardType =  UIKeyboardType.numberPad
        field.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922,alpha: 1)
        return field
    }()
    
    let txtField3: UITextField = {
        let field = UITextField()
        field.keyboardType = UIKeyboardType.numberPad
        field.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922,alpha: 1)
        return field
    }()
    
    let rezultatBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Rezultat", for: .normal)
        button.backgroundColor = UIColor(red: 0.875, green: 0.57, blue: 0.288, alpha: 1)
        return button
    }()
    
    
    func textFieldDidBeginEditing(_ textView: UITextField) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textFieldDidEndEditing(_ textView: UITextField) {
        if textView.text?.isEmpty ?? false {
            textView.text = "Upiši broj"
            textView.textColor = UIColor.lightGray
        }
    }
    
    let rezultatView: UIView = {
        let newView = UIView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button Tapped")
        var broj = 0
        var igrac = 0
        let brojIgraca: Int? = Int(txtField1.text!)
        let reverseBroj: Int? = Int(txtField2.text!)
        let skipBroj: Int? = Int(txtField3.text!)
        var reverse = false
        var skip = false

        while broj < brojIgraca!*10 {
            broj += 1
            if reverse && skip {
                igrac -= 1
                if (igrac < 1) {
                    igrac = brojIgraca!
                }
                igrac -= 1
                if (igrac < 1) {
                    igrac = brojIgraca!
                }
                skip.toggle()
            }
            
            else if !reverse && skip {
                igrac += 1
                if (igrac > brojIgraca!) {
                    igrac = 1
                }
                igrac += 1
                if (igrac > brojIgraca!) {
                    igrac = 1
                }
                skip.toggle()
            }
            
            else if reverse && broj % skipBroj! == 0 {
                igrac -= 1
                if (igrac < 1) {
                    igrac = brojIgraca!
                }
                skip.toggle()
            }
            else if (!reverse && broj % skipBroj! == 0) {
                igrac += 1
                if (igrac > brojIgraca!) {
                    igrac = 1
                }
                skip.toggle()
            }
            else if (!reverse && broj % skipBroj! != 0) {
                igrac += 1
                if (igrac > brojIgraca!) {
                    igrac = 1
                }
            }
            
            else if (reverse && broj % skipBroj! != 0) {
                igrac -= 1
                if (igrac < 1) {
                    igrac = brojIgraca!
                }
            }
            print(igrac)
            if (broj == brojIgraca!*10) {
                print("igrac broj \(igrac) je izgovorio broj \(brojIgraca!*10)")
            }
            if broj % reverseBroj! == 0 {
                reverse.toggle()
            }
            
            
            
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Igra izgovaranja brojeva"
        view.backgroundColor = .white
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(txtField1)
        view.addSubview(txtField2)
        view.addSubview(txtField3)
        view.addSubview(rezultatBtn)
        setupLayout()
        rezultatBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        txtField1.delegate = self
        txtField2.delegate = self
        txtField3.delegate = self
        textFieldDidBeginEditing(txtField1)
        textFieldDidEndEditing(txtField1)
        textFieldDidBeginEditing(txtField2)
        textFieldDidEndEditing(txtField2)
        textFieldDidBeginEditing(txtField3)
        textFieldDidEndEditing(txtField3)
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    func setupLayout() {
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        label1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        label2.topAnchor.constraint(equalTo: txtField1.bottomAnchor, constant: 25).isActive = true
        
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        label3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        label3.topAnchor.constraint(equalTo: txtField2.bottomAnchor, constant: 25).isActive = true
        
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        label4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        label4.topAnchor.constraint(equalTo: txtField3.bottomAnchor, constant: 15).isActive = true
        
        txtField1.translatesAutoresizingMaskIntoConstraints = false
        txtField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:15).isActive = true
        txtField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        txtField1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 0).isActive = true
        txtField1.widthAnchor.constraint(equalToConstant: 345).isActive = true
        txtField1.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        txtField2.translatesAutoresizingMaskIntoConstraints = false
        txtField2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:15).isActive = true
        txtField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        txtField2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 0).isActive = true
        txtField2.widthAnchor.constraint(equalToConstant: 345).isActive = true
        txtField2.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        txtField3.translatesAutoresizingMaskIntoConstraints = false
        txtField3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:15).isActive = true
        txtField3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        txtField3.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 0).isActive = true
        txtField3.widthAnchor.constraint(equalToConstant: 345).isActive = true
        txtField3.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        rezultatBtn.translatesAutoresizingMaskIntoConstraints = false
        rezultatBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        rezultatBtn.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        rezultatBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
}

