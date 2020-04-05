//
//  ViewController.swift
//  prviProjekt
//
//  Created by David Marjanović on 09/03/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var coolBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func coolBtnPressed(_ sender: Any) {
        print("STISNUTO DUGME")
    }
    
}

