//
//  ViewController.swift
//  TestFieldProject
//
//  Created by 차유민 on 2023/02/08.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self // self는 뷰컨트롤러라는 의미 (텍스트필드의 대리자를 뷰컨트롤러로 설정해주는 코드
        
        setup()
    }

    

    
    func setup() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        textField.becomeFirstResponder() // 키보드 자동으로 올라옴
    }
    
    // 화면을 터치했을 때 뷰를 끝내겠다..(화면터치했을 때 키보드 내리는 법), 뷰컨드롤러에 있는 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    // 텍스트필드의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
   // 시점을 의미
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    // 내용 지우기,,
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 글자 내용이(한글자 한글자) 입력되거나 지워질때 호출 (허락여부까지 판단)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function)
//        print(string)
       
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    //텍스트필드에 엔터가 눌러지면 다음 동작을 허락할 것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    // 실제로 텍스트필드의 입력이 끝날 때 호출 (끝날지 말지 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //실제로 텍스트필드의 입력이 실제 끝났을 때 호출 (정확한 시점을 알기 위해 구현)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드 입력을 끝냈다")
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder() // 키보드 내려감
        
    }
    
    
}

