/**
    *  Description     :  This is Account trigger handler class.(The content of this class only work on Account Object).
    *
    *  Created By      :  Harendra Kumar
    *
    *  Created Date    :  20/07/2022
    *
    *  Revision Logs   :  V1.0 - Created by - Harendra Kumar
    *
**/
public with sharing class AccountTriggerHandler {
/* 
*    @Description    :      The content of this method is used for send email notification with a random account number on existing email id.
*
*    @args           :       
*
*    @return         :       void (Nothing)
*
*    @revision Log   :       V1.1  - Created  -  20/07/2022  - Harendra Kumar
*                                    
*/
    public static void sendEmailNotification(List<Account> accList) {
        List<Messaging.Email> emailList = new List<Messaging.Email>();
    
        for(Account acc : accList) {
            If(acc.Email__c != null) {
                Messaging.SingleEmailMessage emailMsg =  new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{acc.Email__c};
                emailMsg.setToAddresses(toAddress);
                String emailSubject = 'Congratulations ' + acc.Name;
                emailMsg.setSubject(emailSubject);
                String senderName = 'Harendra Kumar';
                emailMsg.setSenderDisplayName(senderName);
                String content = 'HELLO ' + acc.Name + ',<br/><br/>' + 'Your Account has been created Successfully <br> Have a great day ahead <br> AccountNumber: ' +acc.AccountNumber;
                emailMsg.setHtmlBody(content);
                emailList.add(emailMsg);
            }
        }
        Messaging.sendEmail(emailList);
    
    }

   
/* 
*    @Description    :      The content of this method is used for insert and update records.
*
*    @args           :       
*
*    @return         :       void (Nothing)
*
*    @revision Log   :       V1.1  - Created  -  21/07/2022  - Harendra Kumar
*
*/
    public static void insertAndUpdateRecord(List<Account> accList){
    
        for(Account acc : accList){
            If(Trigger.isInsert){
                acc.Phone = '9627333671';
                acc.Industry = 'Banking';
                System.debug('check insert list ::: Trigger.New'+ Trigger.New);
                System.debug('check insert list ::: Trigger.Old'+ Trigger.Old);
            }
            if(Trigger.isUpdate){
                acc.Phone = '6397366218';
                acc.Industry = 'Agriculture';
                system.debug('Check Update List ::: Trigger.New ' + Trigger.New);
                system.debug('Check Update List ::: Trigger.old ' + Trigger.old);     
            }
        }
    }
/* 
*    @Description    :      The content of this method is used for add Prefix.
*
*    @args           :       
*
*    @return         :       void (Nothing)
*
*    @revision Log   :       V1.1  - Created  -  21/07/2022  - Harendra Kumar
*
*/
    public static void addPrefixOnType(List<Account> accList, List<Account> acList){
        Integer randomNumber = Integer.valueOf(Math.random() * 10000); // Generate a random number for AccountNumber.
        for(Account acc : accList){
            If(acc.Type == 'Saving Account'){
                acc.AccountNumber = 'SB-' + randomNumber;
            }else If(acc.Type == 'FD Account'){
                acc.AccountNumber = 'FD-'+ randomNumber;    
            }
        }
    }
}