//
//  ViewController.swift
//  sestizdatak
//
//  Created by David Marjanović on 14/03/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    /*let appName: UILabel = {
        let label = UILabel()
        label.text = "Banka"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.961, green: 0.388, blue: 0.4, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()*/
    
    
    let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let brojRacuna: UITextField = {
        let brojRacuna = UITextField()
        brojRacuna.translatesAutoresizingMaskIntoConstraints = false
        brojRacuna.placeholder = "Broj Racuna"
        brojRacuna.keyboardType = UIKeyboardType.numberPad
        return brojRacuna
    }()
    
    let line1: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let view2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tipRacuna: UITextField = {
        let brojRacuna = UITextField()
        brojRacuna.translatesAutoresizingMaskIntoConstraints = false
        brojRacuna.placeholder = "Tip Racuna (Tekući, žiro, ili devizni)"
        return brojRacuna
    }()
    
    let line2: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let view3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tipKlijenta: UITextField = {
        let brojRacuna = UITextField()
        brojRacuna.translatesAutoresizingMaskIntoConstraints = false
        brojRacuna.placeholder = "Tip klijenta (Fizički ili privatni)"
        return brojRacuna
    }()
    
    let line3: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let view4: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let kriviUnos: UILabel = {
        let unos = UILabel()
        unos.translatesAutoresizingMaskIntoConstraints = false
        unos.text = "Neki od unosa nisu ispravni. Provjeri unose."
        unos.adjustsFontSizeToFitWidth = true
        unos.textColor = .white
        return unos
    }()
    
    
    let iskusajSrecu: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.961, green: 0.388, blue: 0.4, alpha: 1)
        button.setTitle("Iskušaj sreću", for: .normal)
        button.layer.cornerRadius = 23
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        guard var brojRacunaa = Int(brojRacuna.text ?? "") else { return  }
        var count = 0
        var arrayInt = [Int]()
        arrayInt.append(brojRacunaa%10)
        while count < 9 {
          brojRacunaa = brojRacunaa/10
          arrayInt.insert(brojRacunaa%10, at: 0)
          count+=1
        }
        var djeljivSaSest = 0
        var a = 10000000
        for number in 2...9 {
            djeljivSaSest += arrayInt[number]*a
            a/=10
        }
        var zadnjeTri = 0
        var b = 100
        for number in 7...9 {
            zadnjeTri += arrayInt[number]*b
            b /= 10
        }
        if ((arrayInt[0] == 0 && arrayInt[1] == 4) && (tipRacuna.text?.lowercased() == "tekući" || tipRacuna.text?.lowercased() == "žiro" || tipRacuna.text?.lowercased() == "devizni") && (tipKlijenta.text?.lowercased() == "privatni" || tipKlijenta.text?.lowercased() == "fizički")) {
         if (djeljivSaSest % 6 == 0) {
            djeljivSaSestAlert()
            print("Vas racun je trajno blokiran.")
         } else if (tipRacuna.text?.lowercased() == "žiro" && tipKlijenta.text?.lowercased() == "privatni") {
            print("Cestitamo! Banka vam daruje milijun kuna!")
         } else if (tipKlijenta.text?.lowercased() == "fizički") && (zadnjeTri % 3 == 0) {
             print("Cestitamo! banka vam daje poticaj od milijun eura!")
        }
        } else {
            if (!(arrayInt[0] == 0 && arrayInt[1] == 4)) {
                print("Nepostojeci broj racuna.")
                kriviUnos.textColor = .red
            }
            else if (!(tipRacuna.text?.lowercased() == "tekući" || tipRacuna.text?.lowercased() == "devizni" || tipRacuna.text?.lowercased() == "žiro")) {
                kriviUnos.textColor = .red
                print("Nepostojeci tip bankovnog racuna.")
            } else {
                kriviUnos.textColor = .red
                print("Nepostojeci tip klijenta.")
            }
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //self.navigationController?.navigationBar.addSubview(appName)
        view.addSubview(view1)
        view1.addSubview(brojRacuna)
        view1.addSubview(line1)
        view.addSubview(view2)
        view2.addSubview(tipRacuna)
        view2.addSubview(line2)
        view.addSubview(view3)
        view3.addSubview(tipKlijenta)
        view3.addSubview(line3)
        view.addSubview(view4)
        view4.addSubview(kriviUnos)
        view.addSubview(iskusajSrecu)
        self.title = "Banka"

        
        iskusajSrecu.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        setupLayout()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
        
        /*appName.widthAnchor.constraint(equalToConstant: 222),
            appName.heightAnchor.constraint(equalToConstant: 22),
            appName.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor ?? view.topAnchor), constant: 16),
        appName.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor ?? view.leadingAnchor), constant: 77),
        appName.trailingAnchor.constraint(equalTo: (navigationController?.navigationBar.trailingAnchor ?? view.leadingAnchor), constant: -76),*/
        
    
        
        view1.topAnchor.constraint(equalTo: view.topAnchor, constant: 123),
        view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
        view1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
        view1.widthAnchor.constraint(equalToConstant: 360),
        view1.heightAnchor.constraint(equalToConstant: 44),
        
        brojRacuna.topAnchor.constraint(equalTo: view1.topAnchor, constant: 12),
        brojRacuna.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -12),
        brojRacuna.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 12),
        brojRacuna.widthAnchor.constraint(equalToConstant: 348),
        brojRacuna.heightAnchor.constraint(equalToConstant: 21),
        
        line1.topAnchor.constraint(equalTo: view1.bottomAnchor),
        line1.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -12),
        line1.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 12),
        line1.widthAnchor.constraint(equalToConstant: 348),
        line1.heightAnchor.constraint(equalToConstant: 1),
        
        view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 16),
        view2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
        view2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
        view2.widthAnchor.constraint(equalToConstant: 360),
        view2.heightAnchor.constraint(equalToConstant: 44),
        
        tipRacuna.topAnchor.constraint(equalTo: view2.topAnchor, constant: 12),
        tipRacuna.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: -12),
        tipRacuna.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 12),
        tipRacuna.widthAnchor.constraint(equalToConstant: 348),
        tipRacuna.heightAnchor.constraint(equalToConstant: 21),
        
        line2.topAnchor.constraint(equalTo: view2.bottomAnchor),
        line2.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: -12),
        line2.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 12),
        line2.widthAnchor.constraint(equalToConstant: 348),
        line2.heightAnchor.constraint(equalToConstant: 1),
        
        view3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 16),
        view3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
        view3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
        view3.widthAnchor.constraint(equalToConstant: 360),
        view3.heightAnchor.constraint(equalToConstant: 44),
        
        tipKlijenta.topAnchor.constraint(equalTo: view3.topAnchor, constant: 12),
        tipKlijenta.trailingAnchor.constraint(equalTo: view3.trailingAnchor, constant: -12),
        tipKlijenta.leadingAnchor.constraint(equalTo: view3.leadingAnchor, constant: 12),
        tipKlijenta.widthAnchor.constraint(equalToConstant: 348),
        tipKlijenta.heightAnchor.constraint(equalToConstant: 21),
        
        line3.topAnchor.constraint(equalTo: view3.bottomAnchor),
        line3.trailingAnchor.constraint(equalTo: view3.trailingAnchor, constant: -12),
        line3.leadingAnchor.constraint(equalTo: view3.leadingAnchor, constant: 12),
        line3.widthAnchor.constraint(equalToConstant: 348),
        line3.heightAnchor.constraint(equalToConstant: 1),
            
        iskusajSrecu.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        iskusajSrecu.widthAnchor.constraint(equalToConstant: 345),
        iskusajSrecu.heightAnchor.constraint(equalToConstant: 45),
        iskusajSrecu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        iskusajSrecu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        
        view4.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 16),
        view4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
        view4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
        view4.widthAnchor.constraint(equalToConstant: 257),
        view4.heightAnchor.constraint(equalToConstant: 16),
        
        kriviUnos.topAnchor.constraint(equalTo: view4.topAnchor),
        kriviUnos.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
        kriviUnos.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -95),
        kriviUnos.widthAnchor.constraint(equalToConstant: 257),
        kriviUnos.heightAnchor.constraint(equalToConstant: 16)
        
        
        ])
        
    }
    
    func djeljivSaSestAlert() {
        /*let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Broj računa djeljiv je sa šest.", attributes: [NSAttributedString.Key.font: UIFont(name: "SFProText-Regular", size: 13) as Any])
        attributedText.append(NSAttributedString(string: "Bravo!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.green]))
        textView.attributedText = attributedText*/
        
        
        
        let mutableString = NSMutableAttributedString()
        /*let message1 = "Riječ koju ste upisali je palindrom!\n"
        let message2 = "Znate li još koji palindrom?"
        let attribute1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.black]
        let attribute2 =  [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.236, green: 0.729, blue: 0.194, alpha: 1)]*/
        let atrStr1 = NSAttributedString(string: "Broj računa djeljiv je sa šest.", attributes: [NSAttributedString.Key.font: UIFont(name: "SFProText-Regular", size: 13) as Any])
        let atrStr2 = NSAttributedString(string: "Bravo!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.green])
        mutableString.append(atrStr1)
        mutableString.append(atrStr2)
        let alert = UIAlertController(title: "Djeljiv broj", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.setValue(mutableString, forKey: "AttributedMessage")
        
        alert.addAction(UIAlertAction(title: "Sad sam pravi iOS dev", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


}

extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.topLeft , .topRight],
            cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
