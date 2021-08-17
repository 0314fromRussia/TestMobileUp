//
//  ViewController.swift
//  TestMobileUp
//
//  Created by Никита Дмитриев on 17.08.2021.
//

import UIKit


class StartViewController: UIViewController {
    
    
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLogin.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        
        
    }
    
    @objc func tapAction() {
        performSegue(withIdentifier: "Login", sender: nil)
    }
}
