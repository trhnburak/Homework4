//
//  PageYViewController.swift
//  Homework4
//
//  Created by Burak Turhan on 19.02.2023.
//

import UIKit

class PageYViewController: UIViewController {
    var backButton = UIButton()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let backButton = self.navigationItem.leftBarButtonItem?.customView as? UIButton {
            backButton.titleLabel?.alpha = 0
            let translationX: CGFloat = -(backButton.titleLabel?.bounds.width ?? 0) - 60
            let titleTransform = CGAffineTransform(translationX: translationX, y: 0)

            UIView.animate(withDuration: 0.36) {
                backButton.titleLabel?.alpha = 1
                backButton.titleLabel?.transform = titleTransform
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if let backButton = self.navigationItem.leftBarButtonItem?.customView as? UIButton {
            backButton.titleLabel?.alpha = 0
            let translationX: CGFloat = -(backButton.titleLabel?.bounds.width ?? 0) - 90
            let titleTransform = CGAffineTransform(translationX: translationX, y: 0)

            UIView.animate(withDuration: 0.1) {
                backButton.titleLabel?.alpha = 1
                backButton.titleLabel?.transform = titleTransform
            }
        }
    }






    override func viewDidLoad() {
        super.viewDidLoad()

        backButton = UIButton()
        backButton.setTitle("Home", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        let backImage = UIImage(systemName: "chevron.left")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 22, weight: .medium))
        backButton.setImage(backImage, for: .normal)
        backButton.setTitleColor(.systemBlue, for: .normal)

        // Set the image and title padding
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        backButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)

        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)

        // Move the back button off-screen initially
        backBarButtonItem.customView?.transform = CGAffineTransform(translationX: -100, y: 0)

        navigationItem.leftBarButtonItem = backBarButtonItem
    }

    @objc func backAction() {
        // Handle back button tap
        navigationController?.popViewController(animated: true)
    }

}
