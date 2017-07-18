//
//  Extensions.swift
//  IgniteGreenhouse
//
//  Created by Doruk Gezici on 12/07/2017.
//  Copyright © 2017 ARDIC. All rights reserved.
//

import UIKit
import ViewDeck
import IgniteAPI

extension UIViewController {
    
    func changeVC(withIdentifier: String) {
        if withIdentifier == "Login" {
            IgniteAPI.logout()
            let nc = storyboard!.instantiateViewController(withIdentifier: withIdentifier)
            UIApplication.shared.keyWindow?.rootViewController = nc
        } else {
            let vc = storyboard!.instantiateViewController(withIdentifier: withIdentifier)
            let button = UIBarButtonItem(image: UIImage(named: "menubutton"), style: .plain, target: nil, action: #selector(UIViewController.showMenu))
            vc.navigationItem.setLeftBarButton(button, animated: false)
            let nc = UINavigationController(rootViewController: vc)
            viewDeckController?.centerViewController = nc
            viewDeckController?.closeSide(true)
        }
    }
    
    func createMenu(withMainIdentifier: String) {
        guard let window = UIApplication.shared.keyWindow else { return }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = sb.instantiateViewController(withIdentifier: withMainIdentifier)
        let center = UINavigationController(rootViewController: mainVC)
        let menuVC = sb.instantiateViewController(withIdentifier: "MenuVC")
        let left = UINavigationController(rootViewController: menuVC)
        left.preferredContentSize = CGSize(width: window.bounds.width * 0.75, height: window.bounds.height)
        let viewDeckController = IIViewDeckController(center: center, leftViewController: left)
        window.rootViewController = viewDeckController
        window.makeKeyAndVisible()
    }
    
    func showMenu() {
        viewDeckController?.open(.left, animated: true)
    }
    
    func dismissKeyboardWhenTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UICollectionViewCell {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}

extension UIColor {
    
    static func flatBlue() -> UIColor {
        return UIColor(hue: 0.62, saturation: 0.5, brightness: 0.63, alpha: 1)
    }
    
    static func flatWhite() -> UIColor {
        return UIColor(hue: 0.53, saturation: 0.02, brightness: 0.95, alpha: 1)
    }
    
    static func flatRed() -> UIColor {
        return UIColor(hue: 0.02, saturation: 0.74, brightness: 0.91, alpha: 1)
    }
    
}
