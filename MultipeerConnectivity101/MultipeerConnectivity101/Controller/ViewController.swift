//
//  ViewController.swift
//  MultipeerConnectivity101
//
//  Created by Victor Vasconcelos on 23/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MultipeerManager.shared.session.delegate = self
        textView.text = ""
    }

    @IBAction func sendButtonClicked(_ sender: Any) {
        do {
            let msg = Message(message: inputTextField.text ?? "")
            addText("\(MultipeerManager.shared.myPeerID.displayName): \(msg.message)\n")
            let data = try JSONEncoder().encode(msg)
            MultipeerManager.shared.send(data: data)
        } catch { }
    }
    
    public func addText(_ value: String) {
        
        DispatchQueue.main.async { [weak self] in
            self?.textView.text = value + (self?.textView.text ?? "")
        }
        
    }
}

