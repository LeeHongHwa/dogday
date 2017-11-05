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
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    @objc func popButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func registerButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func previousButtonDidTab(_ sender:Any) {
        v.scrollView.previousPaging()
    }
    
    @objc func nextButtonDidTab(_ sender:Any) {
        v.scrollView.nextPaging()
    }
    
    @objc func datePickerDoneButtonDidTab(_ sender:Any) {
        guard let datePicker = v.dateTextField.inputView as? UIDatePicker else {
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        v.dateTextField.text = dateFormatter.string(from: datePicker.date)
        v.dateTextField.endEditing(true)
    }
    
    @objc func timePickerDoneButtonDidTab(_ sender:Any) {
        guard let datePicker = v.timeTextField.inputView as? UIDatePicker else {
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh:mm"
        v.timeTextField.text = dateFormatter.string(from: datePicker.date)
        v.timeTextField.endEditing(true)
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

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
