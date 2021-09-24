//
//  SignUpViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/09/17.
//

import UIKit

class SignUpViewController: UIViewController, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputID: UITextField!
    @IBOutlet weak var inputPW: UITextField!
    @IBOutlet weak var inputCheckPW: UITextField!
    
    // 키보드 높이를 저장할 변수
    var keyHeight: CGFloat?

    // 이미지로 연결되는 이미지 피커
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @IBAction func touchUpSelectImageButton(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func prevButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        // 모든 텍스트필드가 공백이 아니고, 비밀번호가 일치할 경우
//        if inputName.text?.isEmpty == false &&
//            inputID.text?.isEmpty == false &&
//            inputPW.text?.isEmpty == false &&
//            inputCheckPW.text?.isEmpty == false &&
//            inputPW.text == inputCheckPW.text {
            
            let testStortboard = UIStoryboard(name: "BaseStoryboard", bundle: nil)
            if let nextVC = testStortboard.instantiateViewController(identifier: "BaseViewController") as? BaseViewController {
                nextVC.modalPresentationStyle = .overFullScreen
                self.present(nextVC, animated: true, completion: nil)
            }
//        }
    }
    
//    // 키보드가 나타날 때 생성할 메서드
//    @objc func keyboardWillShow(_ sender: Notification) {
//        let userInfo:NSDictionary = sender.userInfo! as NSDictionary
//        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
//        let keyboardRectangle = keyboardFrame.cgRectValue
//        let keyboardHeight = keyboardRectangle.height
//        keyHeight = keyboardHeight
//
//        self.view.frame.size.height -= keyboardHeight
//    }
//
//    // 키보드가 사라질 때 생성할 메서드
//    @objc func keyboardWillHide(_ sender: Notification) {
//
//        self.view.frame.size.height += keyHeight!
//    }
    
    // 이미지 피커가 표출되어있을 때, 취소를 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true, completion: nil)

    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        
        return true // false도 상관없음
    }
    
    
    

}