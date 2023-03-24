//
//  MenuViewController+AdvertiserDelegate.swift
//  MultipeerConnectivity101
//
//  Created by Victor Vasconcelos on 24/03/23.
//

import Foundation
import MultipeerConnectivity

extension MenuViewController: MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
        let alert = UIAlertController(title: "Solicitação de conexão", message: "\(peerID.displayName) quer se conectar com você. Aceita a solicitação?", preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Aceitar", style: .default) { (action) in
            invitationHandler(true, MultipeerManager.shared.session)
        }
        let declineAction = UIAlertAction(title: "Recusar", style: .cancel) { (action) in
            invitationHandler(false, nil)
        }

        alert.addAction(acceptAction)
        alert.addAction(declineAction)
        
        self.present(alert, animated: true)
    }
    
    
    
    
}
