//
//  TomorrowViewController.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/07/04.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie

class TomorrowViewController: UITableViewController, UITextFieldDelegate {

    
    let todoTextFiled = UITextField()
    
   var scheduleArray:[String] = ["明日の予定"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
//        todoTextFiled.frame = CGRect(x: 50, y: self.view.frame.height - 200, width:self.view.frame.width/2, height: self.view.frame.width/6)
//        todoTextFiled.attributedPlaceholder = NSAttributedString(string: "記入欄", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
//        self.view.addSubview(todoTextFiled)
//        todoTextFiled.delegate = self
        
        let plusbutton:UIButton = UIButton(frame: CGRect(x: 300, y:600, width: 80, height: 80))
         plusbutton.backgroundColor = .black
         plusbutton.layer.cornerRadius = 30
         plusbutton.setTitle("+", for: .normal)
        plusbutton.setTitleColor(.white, for: .normal)
        plusbutton.addTarget(self, action: #selector(pushPlusButton), for: .touchUpInside)
        self.view.addSubview(plusbutton)
        
        
        
        tableView.register(UINib(nibName: "TomorrowScheduleCell", bundle: nil), forCellReuseIdentifier: "TomorrowScheduleCell")
      
    
        
    }
    
   func pushAddButton() {
                  let alert = UIAlertController(title: "タスクを追加", message: nil, preferredStyle: .alert)
                  alert.addTextField { textField in
                       textField.placeholder = "タスク名を入力"
                   }
   

                  alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

                   if let text = alert.textFields?.first?.text{

                       self.scheduleArray.append(text)
                       self.tableView.reloadData()
                       }
                   }))

                   // キャンセルボタンを追加
                  alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

                   // アラートを表示する
                  present(alert, animated: true, completion: nil)
               }

       
    
    @objc func pushPlusButton(sender: UIButton){
     
        pushAddButton()
           
       }
    
    func showAnimation() {
             let animationView = AnimationView(name: "checkAnimation")
              animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width/2, height: view.bounds.height/2)
              animationView.center = self.view.center
              animationView.contentMode = .scaleAspectFit
              animationView.animationSpeed = 0.5
             

              view.addSubview(animationView)

              animationView.play()
          }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return scheduleArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TomorrowScheduleCell") as! TomorrowScheduleCell
        cell.todoTextLabel.text = scheduleArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/8
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        scheduleArray.remove(at: indexPath.row)
        showAnimation()
        tableView.reloadData()
        
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
