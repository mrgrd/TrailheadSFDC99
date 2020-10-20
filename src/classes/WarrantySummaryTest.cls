/**
 * Created by Marion on 16/10/2020.
 */
@isTest
public class WarrantySummaryTest {
    @isTest static void createCase(){
        Case caseWarranty                             = new Case();
        caseWarranty.Status                           = 'New';
        caseWarranty.Origin                           = 'Phone';
        caseWarranty.Product_Purchase_Date__c         = Date.today()-1;
        caseWarranty.Product_Total_Warranty_Days__c   = 30;
        caseWarranty.Product_Has_Extended_Warranty__c = true;
        insert caseWarranty;

    }


}