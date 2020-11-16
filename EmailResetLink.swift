//
//  ViewController.swift
//
//  EmailResetLink
//
//  Created by Jiaan Shi on 16/11/20.
//

Auth.auth().sendPasswordReset(withEmail: email) { (error) in
  if let error = error as? NSError {
    switch AuthErrorCode(rawValue: error.code) {
    case .userNotFound:
      // Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
    case .invalidEmail:
      // Error: The email address is badly formatted.
    case .invalidRecipientEmail:
      // Error: Indicates an invalid recipient email was sent in the request.
    case .invalidSender:
      // Error: Indicates an invalid sender email is set in the console for this action.
    case .invalidMessagePayload:
      // Error: Indicates an invalid email template for sending update email.
    default:
      printLog("Error message: \(error.localizedDescription)")
    }
  } else {
    printLog("Reset password email has been successfully sent")
  }
}