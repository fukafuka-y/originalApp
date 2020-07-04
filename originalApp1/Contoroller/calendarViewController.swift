//
//  calendarViewController.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/06/29.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import YYCalendar

class calendarViewController: UIViewController {

    let View = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        View.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
//        view.addSubview(View)
//        View.backgroundColor = .blue
     
        let calendar = YYCalendar(normalCalendarLangType: .JPN, date: "07/01/2020", format: "MM/dd/yyyy") { date in
            print(date)
        }

        calendar.show()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
