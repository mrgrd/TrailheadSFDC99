/**
 * Created by Marion on 16/10/2020.
 */

trigger WarrantySummary on Case (before insert) {
    // Set up variables to use in the summary field
    for (Case myCase : Trigger.new){
        String purchaseDate         = myCase.Product_Purchase_Date__c.format();
        String createdDate          = Datetime.now().format();
        Integer warrantyDays        = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage  = (100*(myCase.Product_Purchase_Date__c.daysBetween(Date.today())
                                      / myCase.Product_Total_Warranty_Days__c)).setScale(2);
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;

        //Populate summary field
        myCase.Warranty_Summary__c = 'Product purchased on ' + purchaseDate + ' '
                                   + 'and case created on ' + createdDate + '.\n'
                                   + 'Warranty is for ' + warrantyDays + ' '
                                   + 'days and is ' + warrantyPercentage + '% through its warranty period.\n'
                                   + 'Extended warranty: ' + hasExtendedWarranty + '\n'
                                   + 'Have a nice day!';

    }

}
