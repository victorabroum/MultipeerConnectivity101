//
//  MenuViewController+BrowserDelegate.swift
//  MultipeerConnectivity101
//
//  Created by Victor Vasconcelos on 24/03/23.
//

import Foundation
import MultipeerConnectivity

extension MenuViewController: MCBrowserViewControllerDelegate {
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        self.setStartEnable(true)
        MultipeerManager.shared.browser.browser?.stopBrowsingForPeers()
        self.dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        self.dismiss(animated: true)
    }
}
