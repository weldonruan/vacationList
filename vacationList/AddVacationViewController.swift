//
//  AddVacationViewController.swift
//  vacationList
//
//  Created by Weldon Ruan on 15/2/14.
//  Copyright (c) 2015年 Weldon Ruan. All rights reserved.
//

import UIKit

class AddVacationViewController: UIViewController {
    //需要增加的度假地
    var vacation_for_add = ""

    //申明两个控件给内部使用,用鼠标从mainboard中拖进来的
    @IBOutlet weak var btnAddVacationDone: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //过渡前的准备
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as NSObject == btnAddVacationDone {
            if (!textField.text.isEmpty) {
                vacation_for_add = textField.text
            }
        }
    }

}
