/**
    *  Purpose         :  This trigger is to handle all the pre and post processing operations for Account objects.
    *
    *  Created By      :  Harendra Kumar
    *
    *  Created Date    :  20/07/2022
    *
    *  Revision Logs   :  V1.0 - Created by - Harendra Kumar 
    *
**/
trigger TriggerAccount on Account (before insert, before update, after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        AccountTriggerHandler.sendEmailNotification(Trigger.New); 
    }

    if(Trigger.isInsert && Trigger.isBefore || Trigger.isUpdate && Trigger.isBefore){
       AccountTriggerHandler.insertAndUpdateRecord(Trigger.New);
    }

    if(Trigger.isInsert && Trigger.isBefore || Trigger.isUpdate && Trigger.isBefore){
       AccountTriggerHandler.addPrefixOnType(Trigger.New, Trigger.Old);
    }
}