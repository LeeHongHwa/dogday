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
    var dogDayData: DogDay! {
        didSet {
            setEnableRightBarButtonItem()
        }
    }
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
            v.rightBarButtonItem.isEnabled = true
            v.rightBarButtonItem.customView?.alpha = 1
        } else {
            self.dogDayData = DogDay()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.clearBackgroundColor()
    }
    
    private func setEnableRightBarButtonItem() {
        switch dogDayData.possibleToSave {
        case .none://저장 가능
            v.rightBarButtonItem.isEnabled = true
            v.rightBarButtonItem.customView?.alpha = 1
        case .emptyValue://빈 값
            v.rightBarButtonItem.isEnabled = false
            v.rightBarButtonItem.customView?.alpha = 0.38
        case .exceedValue://위젯 초과
            let alert = UIAlertController(title: "위젯설정", message: "위젯설정은 3개까지 등록이 가능합니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인",
                                          style: .cancel, handler: {[weak self] _ in
                                            guard let `self` = self else { return }
                                            self.v.widgetSwitch.setOn(false, animated: true)
                                            self.dogDayData.widgetSetting = false
                                            alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
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
            DogDays.sharedInstance.editDogDayElement(at: dogDayDataIndex, newElement: dogDayData, isWidget: true)
        } else {
            DogDays.sharedInstance.addDogDay(element: dogDayData, isWidget: true)
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
    
    @objc func widgetSwitchDidTab(_ sender:Any) {
        guard let sender = sender as? UISwitch else { return }
        dogDayData.widgetSetting = sender.isOn
    }
    
    @objc func datePickerDoneButtonDidTab(_ sender:Any) {
        guard let datePicker = v.dateTextField.inputView as? UIDatePicker else {
            return
        }
        let date = DateFormatter.shortDateFormatter.string(from: datePicker.date)
        v.dateTextField.text = date
        v.dateTextField.endEditing(true)
        dogDayData.setEndDate(with: date)
    }
    
    @objc func timePickerDoneButtonDidTab(_ sender:Any) {
        guard let datePicker = v.timeTextField.inputView as? UIDatePicker else {
            return
        }
        let time = DateFormatter.shortTimeFormatter.string(from: datePicker.date)
        v.timeTextField.text = time
        v.timeTextField.endEditing(true)
        dogDayData.setEndTime(with: time)
    }
    
    @objc func titleTextFieldDidEditingChanged(_ sender:Any) {
        guard let titleTextField = sender as? UITextField  else { return }
        if titleTextField.text?.isWhiteSpacing() == false {
            dogDayData.title = titleTextField.text
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
