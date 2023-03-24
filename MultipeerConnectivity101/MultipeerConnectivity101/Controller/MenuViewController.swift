//
//  MenuViewController.swift
//  MultipeerConnectivity101
//
//  Created by Victor Vasconcelos on 24/03/23.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setStartEnable(false)
    }
    
    @IBAction func hostButtonClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func joinButtonClicked(_ sender: Any) {
        
    }
    
    
    public func setStartEnable(_ value: Bool) {
        startButton.isEnabled = value
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
