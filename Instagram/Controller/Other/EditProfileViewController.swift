//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by intern on 7/2/23.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
    }

    @objc private func didTapSave() {
        
    }
    
   @objc private func didTapCancel() {
        
    }
    
    @objc private func didChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take photo", style: .default, handler: {_ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from library", style: .default, handler: {_ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        self.present(actionSheet, animated: true)
     }
}
