//
//  Daaman_TableViewController.swift
//  Daaman_Blue_TicTacToe
//
//  Created by Daaman Kaushal on 2019-05-28.
//  Copyright © 2019 Daaman Kaushal. All rights reserved.
//

import UIKit

class Daaman_TableViewController: UITableViewController {
    var numGames = 0
    var cellDataArray : Array<CellData> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        tableView.reloadData()
    }
    func loadData() {
        cellDataArray = Array<CellData>()
        numGames = UserDefaults.standard.integer(forKey: Constants.NUMBER_OF_GAMES_PLAYED)
        
        for i in  (1..<numGames + 1).reversed(){
            let game_whoWon = UserDefaults.standard.string(forKey: Constants.WHO_WON + String(i))!
            let game_timeStamp = UserDefaults.standard.double( forKey: Constants.GAME_TIMESTAMP + String(i))
            let  newCellData = CellData(whoWon: game_whoWon, timeStamp: game_timeStamp)
            
            cellDataArray.append(newCellData)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numGames
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "daaman_table_cell", for: indexPath) as!
        Daaman_TableViewCell
        

        // Configure the cell...
        
        // provide right info
        
        let cellNumber = indexPath.row
        
        let thisCellData = cellDataArray[cellNumber]
        if(thisCellData.whoWon == "X") {
            cell.win_loss_image.image = UIImage(named: "Blue_win")
            cell.who_won.text = "X WON!"
        } else if (thisCellData.whoWon == "0"){
            cell.win_loss_image.image = UIImage(named: "Blue_loss")
            cell.who_won.text = "O WON!"
        } else {
    cell.win_loss_image.image = UIImage(named: "Blue_loss")
    cell.who_won.text = "Draw"
    }
       let gameTimeStamp = thisCellData.timeStamp
        
        let gameDate = Date(timeIntervalSince1970: gameTimeStamp)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        
        cell.date_played.text = dateFormatter.string(from: gameDate)

        return cell
    }


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

struct CellData {
    var whoWon : String
    var timeStamp : Double
}
