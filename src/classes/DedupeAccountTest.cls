@isTest
public class DedupeAccountTest {
    
    @isTest static void CreateAccount(){
        Account acc = new Account();
        acc.Name = 'This Account';
        insert acc;
    }

}