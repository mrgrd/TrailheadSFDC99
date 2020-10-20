@isTest
public class HelloWorldTest {
    
    @isTest static void updateLead(){
 		Lead myLead      = new Lead();
        myLead.FirstName = 'Marion';
        myLead.LastName  = 'Last Name';
        myLead.Company   = 'Google';
        insert myLead;
        
        myLead.Company = 'Pluralsight';
        update myLead;
    }

}