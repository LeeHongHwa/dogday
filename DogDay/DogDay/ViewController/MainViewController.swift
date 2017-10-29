//
//  MainViewController.swift
//  DogDay
//
//  Created by david on 2017. 10. 14..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    var dogDayDatas = DogDays.decode()
    lazy var v = EmptyMainView(controlBy: self)
    
    override func loadView() {
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//    @objc func addDayButtonDidTap(_ sender:Any) {
//        self.v.dateTextField.becomeFirstResponder()
//    }
//
//    @objc func datePickerDidChange(_ sender:Any) {
////        guard let sender = sender as? UIDatePicker else { return }
////        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "yyyy-MM-dd"
////        self.v.dateTextField.text = dateFormatter.string(from: sender.date)
////        self.v.dateTextField.resignFirstResponder()
//    }
//
//    @objc func doneButtonDidTab(_ sender:Any) {
//        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "yyyy-MM-dd"
//        dateFormatter.dateFormat = "a hh:mm"
//        self.v.dateTextField.text = dateFormatter.string(from: self.v.datePicker.date)
//        self.v.dateTextField.resignFirstResponder()
//    }
//    @objc func cnacelButtonDidTab(_ sender:Any) {
//        self.v.dateTextField.resignFirstResponder()
//    }
    @objc func addDayButtonDidTab(_ sender:Any) {
    
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let moreRowAction = UITableViewRowAction(style: .default, title: "편집") { (rowAction, indexPath) in
            
        }
        moreRowAction.backgroundColor = UIColor.green
        let deleteRowAction = UITableViewRowAction(style: .default, title: "삭제") { (rowAction, indexPath) in
            
        }
        
        return [deleteRowAction, moreRowAction];
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogDayTableViewCell.identifier, for: indexPath)
        return cell
    }
}
