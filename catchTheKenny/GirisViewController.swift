//
//  GirisViewController.swift
//  catchTheKenny
//
//  Created by Mevlüt Akküyün on 2.11.2024.
//

import UIKit

class GirisViewController: UIViewController {
    var num = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
    }
    @IBAction func kolayClicked(_ sender: Any) {
        num=1.5
        toSecondVC()
        
    }
    @IBAction func ortaClicked(_ sender: Any) {
        num = 0.85
        toSecondVC()
       
    }
    
    @IBAction func zorClicked(_ sender: Any) {
        num = 0.40
        toSecondVC()
        
    }
    func toSecondVC(){
        performSegue(withIdentifier: "toGameVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toGameVC" {
            var destinationVC=segue.destination as? ViewController
            destinationVC?.number=num
        }
    }
}
