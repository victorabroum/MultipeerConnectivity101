//
//  MenuViewController+SessionDelegate.swift
//  MultipeerConnectivity101
//
//  Created by Victor Vasconcelos on 24/03/23.
//

import Foundation
import MultipeerConnectivity

extension MenuViewController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        // Quando recebo um novo Dado
        
        do {
            let msg = try JSONDecoder().decode(Message.self, from: data)
            if (msg.msg == "Start") {
                // Go to next view
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "startSegue", sender: nil)
                }
            }
        } catch {
             
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    
}
