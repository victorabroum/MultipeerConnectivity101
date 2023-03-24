//
//  MenuViewController.swift
//  MultipeerConnectivity101
//
//  Created by Victor Vasconcelos on 24/03/23.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    private var isHost: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setStartEnable(false)
        MultipeerManager.shared.advertiser.delegate = self
        MultipeerManager.shared.browser.delegate = self
        MultipeerManager.shared.session.delegate = self
    }
    
    @IBAction func hostButtonClicked(_ sender: Any) {
        MultipeerManager.shared.startBrowser(self)
        isHost = true
    }
    
    
    @IBAction func joinButtonClicked(_ sender: Any) {
        MultipeerManager.shared.startAdvertiser()
    }
    
    
    public func setStartEnable(_ value: Bool) {
        startButton.isEnabled = value
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startSegue" && isHost {
            do {
                let msg = Message(msg: "Start")
                let data = try JSONEncoder().encode(msg)
                MultipeerManager.shared.send(data)
            } catch { }
        }
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
