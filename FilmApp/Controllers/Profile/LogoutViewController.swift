//
//  LogoutViewController.swift
//  FilmApp
//
//  Created by Акбала Тлеугалиева on 5/13/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit

class LogoutViewController:  UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var logoutButton: UIButton!
    var viewTranslation = CGPoint(x: 0, y: 0)
        
        override func viewDidLoad() {
            super.viewDidLoad()
// Do any additional setup after loading the view.
            configureView()
            
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
            tap.delegate = self
            view.addGestureRecognizer(tap)
            
            view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
        }
        
        func configureView() {
            backgroundView.layer.cornerRadius = 32
            backgroundView.clipsToBounds = true
            backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            logoutButton.layer.cornerRadius = 12.0
        }
        
        @objc func handleDismiss(sender: UIPanGestureRecognizer) {
            switch sender.state {
                case .changed:
                    viewTranslation = sender.translation(in: view)
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                        self.backgroundView.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                    })
                case .ended:
                    if viewTranslation.y < 100 {
                        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                            self.backgroundView.transform = .identity
                        })
                    } else {
                        dismiss(animated: true, completion: nil)
                    }
                default:
                    break
            }
        }
        
        @objc func dismissView() {
            self.dismiss(animated: true, completion: nil)
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
            if (touch.view?.isDescendant(of: backgroundView))! {
                return false
            }
            return true
        }

        @IBAction func logout(_ sender: Any) {
            UserDefaults.standard.removeObject(forKey: "token")
            
            let rootVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInSignUpViewController") as! UINavigationController
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
            appDelegate.window?.makeKeyAndVisible()
        }
        
        @IBAction func cancel(_ sender: Any) {
            dismissView()
        }
        
    }
