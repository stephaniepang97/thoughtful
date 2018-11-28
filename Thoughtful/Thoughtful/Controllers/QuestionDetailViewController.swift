//
//  QuestionDetailViewController.swift
//  Thoughtful
//
//  Created by Stephanie Pang on 11/9/18.
//  Copyright © 2018 Stephanie Pang. All rights reserved.
//

import UIKit

class QuestionDetailViewController: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerLabel: UILabel!
  @IBOutlet weak var createdByLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  var detailItem: Question? {
    didSet {
      // Update the view.
      self.configureView()
    }
  }
  
  func configureView() {
    // Update the user interface for the detail item.
    if let detail: Question = self.detailItem {
      if let question = self.questionLabel {
        question.text = detail.question
      }
      if let answer = self.answerLabel {
        answer.text = detail.answer
      }
      if let createdBy = self.createdByLabel {
        createdBy.text = "\(detail.created_by!)"
      }
      if let imageView = self.imageView {
        print("adding image to view")
        print(detail.attachment!)
        imageView.image = detail.attachment
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.configureView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
