//
//  QuestionsViewController.swift
//  Thoughtful
//
//  Created by Stephanie Pang on 11/9/18.
//  Copyright © 2018 Stephanie Pang. All rights reserved.
//

import UIKit

class QuestionsController: UITableViewController, AddQuestionControllerDelegate {
  
  // MARK: - Properties
//  var questions = [Question]()
  var questionsVM = QuestionViewModel()

  // MARK: - General
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.leftBarButtonItem = self.editButtonItem
    
    questionsVM.loadQuestions(tableViewController: self)
    print("question: \(String(describing: questionsVM.questions))")
    let cellNib = UINib(nibName: "QuestionTableCell", bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier: "cell")
  }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return questionsVM.questions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuestionTableCell
    
      let question = questionsVM.questions[indexPath.row]
      // Configure the cell...
      cell.question?.text = question.question
      cell.answer?.text = question.answer

      return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      self.performSegue(withIdentifier: "showDetail", sender: tableView)
    }
  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if (segue.identifier == "showDetail") {
        let qdvc = segue.destination as! QuestionDetailViewController
        if let indexPath = self.tableView.indexPathForSelectedRow {
          let question = questionsVM.questions[indexPath.row]
          qdvc.detailItem = question
        }
      }
    }
  
  // MARK: - Delegate protocols
  func addQuestionControllerDidCancel(controller: AddQuestionController) {
    dismiss(animated: true, completion: nil)
  }
  
  func addQuestionController(controller: AddQuestionController, didFinishAddingQuestion question: Question) {
    let newRowIndex = questionsVM.questions.count
    
    questionsVM.saveQuestion(question: question)
    
    let indexPath = NSIndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths as [IndexPath], with: .automatic)
    
    dismiss(animated: true, completion: nil)
  }
 

}
