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
    }

    @IBAction func sendButtonClicked(_ sender: Any) {
        do {
            let msg = Message(msg: inputTextField.text ?? "")
            let data = try JSONEncoder().encode(msg)
            MultipeerManager.shared.send(data)
        }catch { }
    }
    
    public func changeText(_ text: String) {
        DispatchQueue.main.async { [weak self] in
            self?.textView.text = text
        }
    }
    
}

