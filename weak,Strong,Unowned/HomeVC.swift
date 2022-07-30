//
//  ViewController.swift
//  weak,Strong,Unowned
//
//  Created by yeshwanth srinivas rao bandaru on 04/06/22.
//

import UIKit

class HomeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func buttonToSecondVC(){
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
present(vc, animated: true, completion: nil)
        
    }
}

