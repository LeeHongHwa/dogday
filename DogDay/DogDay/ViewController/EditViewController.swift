//
//  EditViewController.swift
//  DogDay
//
//  Created by david on 2017. 11. 5..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class EditViewController: BaseViewController {
    lazy var v = EditView(controlBy: self)
    
    override func loadView() {
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func popButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func registerButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func previousButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func datePickerDoneButtonDidTab(_ sender:Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    @objc func timePickerDoneButtonDidTab(_ sender:Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh:mm"
    }

    @objc func cancelButtonDidTab(_ sender:Any) {
        v.dateTextField.endEditing(true)
        v.timeTextField.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension EditViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let scrollView = scrollView as? GradientScrollView else { return }
        scrollView.gradientBackground()
    }
}
