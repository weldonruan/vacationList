//
//  VacationListTableViewController.swift
//  vacationList
//
//  Created by Weldon Ruan on 15/2/14.
//  Copyright (c) 2015年 Weldon Ruan. All rights reserved.
//

import UIKit

class VacationListTableViewController: UITableViewController {
    
    //定义空数组:度假地数组,vacationList;度假地状态数组,vacationStat
    var vacationList = [String]()
    var vacationStat = [Bool]()
    
    func loadInitData() {
        
        vacationList.append( "北京 Beijing" )
        vacationList.append( "上海 Shanghai" )
        vacationList.append( "广州 Guangzhou" )
        vacationList.append( "深圳 Shenzhen" )
        vacationList.append( "香港 Hongkong" )
        vacationList.append( "澳门 Macao" )
        
        vacationStat.append(false)
        vacationStat.append(false)
        vacationStat.append(false)
        vacationStat.append(false)
        vacationStat.append(false)
        vacationStat.append(false)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //将UI中左侧的编辑按钮和编辑动作做一个绑定
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        loadInitData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 返回表格有几个部分
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 返回表格有多少行
        return vacationList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PCell", forIndexPath: indexPath) as UITableViewCell
        let v1 = vacationList[indexPath.row]
        // 给回调的单元格指定内容,仅在初始化或重绘tableView时回调并绘制表格
        cell.textLabel?.text = v1
        //println("indexPath.row=\(indexPath.row)")
        if vacationStat[indexPath.row] {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 点击tableView中内容的回调事件
        //println("didSelectRowAtIndexPath=\(indexPath.row)")
        if vacationStat[indexPath.row] {
            vacationStat[indexPath.row] = false
        } else {
            vacationStat[indexPath.row] = true
        }
        //重绘控件tableView
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //commitEditStyle的回调函数，本次只接管删除动作
        if editingStyle == UITableViewCellEditingStyle.Delete {
            vacationList.removeAtIndex(indexPath.row)
            vacationStat.removeAtIndex(indexPath.row)
            //删除的动画效果是下面的单元格往上推
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        }
    }
    
    //反向回退
    @IBAction func unwindToList(segue : UIStoryboardSegue) {
        let source = segue.sourceViewController as AddVacationViewController
        let v1 = source.vacation_for_add
        if (v1 != "") {
            vacationStat.append(false)
            vacationList.append(v1)
        }
    }

}
