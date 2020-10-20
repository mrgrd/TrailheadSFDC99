@isTest
public class AppleWatchTest {
    
    @isTest static void CreateOpportunity(){
        Opportunity opp = new Opportunity();
        opp.Name        = 'Swift Deal';
        opp.StageName   = 'Prospecting';
        opp.CloseDate   = Date.today();
        insert opp;
    }

}