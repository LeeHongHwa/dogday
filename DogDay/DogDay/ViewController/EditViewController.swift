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
    var dogDayData: DogDay!
    var dogDayDataIndex: Int?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.setNeedsStatusBarAppearanceUpdate()
        if let dogDayData = dogDayData {
            v.configure(dogDayType: dogDayData.dogDayType!,
                        title: dogDayData.title!,
                        endDate: dogDayData.endDateString,
                        endTime: dogDayData.endTimeString,
                        widgetSetting: dogDayData.widgetSetting)
        } else {
            self.dogDayData = DogDay()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.clearBackgroundColor()
    }
    
    private func setEnableRightBarButtonItem() {
        if dogDayData.possibleToSave == true {
            v.rightBarButtonItem.isEnabled = true
            v.rightBarButtonItem.customView?.alpha = 1
        } else {
            v.rightBarButtonItem.isEnabled = false
            v.rightBarButtonItem.customView?.alpha = 0.38
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//Action
extension EditViewController {
    
    @objc func popButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func registerButtonDidTab(_ sender:Any) {
        dogDayData.setDogDayType(with: v.scrollView.currentIndex())
        if let dogDayDataIndex = dogDayDataIndex {
            DogDays.sharedInstance.editDogDayElement(at: dogDayDataIndex, newElement: dogDayData)
        } else {
            DogDays.sharedInstance.addDogDay(element: dogDayData)
        }
        
        if self.presentingViewController == nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
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
        let date = dateFormatter.string(from: datePicker.date)
        v.dateTextField.text = date
        v.dateTextField.endEditing(true)
        dogDayData.setEndDate(with: date)
        setEnableRightBarButtonItem()
    }
    
    @objc func timePickerDoneButtonDidTab(_ sender:Any) {
        guard let datePicker = v.timeTextField.inputView as? UIDatePicker else {
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh:mm"
        let time = dateFormatter.string(from: datePicker.date)
        v.timeTextField.text = time
        v.timeTextField.endEditing(true)
        dogDayData.setEndTime(with: time)
        setEnableRightBarButtonItem()
    }
    
    @objc func titleTextFieldDidEditingChanged(_ sender:Any) {
        guard let titleTextField = sender as? UITextField  else { return }
        if titleTextField.text?.isWhiteSpacing() == false {
            dogDayData.title = titleTextField.text
            setEnableRightBarButtonItem()
        }
    }
    
    @objc func cancelButtonDidTab(_ sender:Any) {
        v.dateTextField.endEditing(true)
        v.timeTextField.endEditing(true)
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
