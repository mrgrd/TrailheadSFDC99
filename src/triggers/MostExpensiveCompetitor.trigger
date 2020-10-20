/**
 * Created by Marion on 20/10/2020.
 */

trigger MostExpensiveCompetitor on Opportunity (before insert, before update) {
    for (Opportunity opp : Trigger.new){
        // Add all our prices in a list in order of competitor
        List<Decimal> competitorPrices = new List<Decimal>();
        competitorPrices.add(opp.Competitor_1_Price__c);
        competitorPrices.add(opp.Competitor_2_Price__c);
        competitorPrices.add(opp.Competitor_3_Price__c);

        // Add all our competitors in a list in order
        List<String> competitors = new List<String>();
        competitors.add(opp.Competitor_1__c);
        competitors.add(opp.Competitor_2__c);
        competitors.add(opp.Competitor_3__c);

        // Loop through all competitors to find the position of the lowest price
        Decimal highestPrice;          // Left as null, left outside of loop because we want overall lowest price,
        Integer highestPricePosition;  // If it was inside the loop, it scope would be limited to only one iteration

        for(Integer i = 0; i< competitorPrices.size(); +i++){
            Decimal currentPrice = competitorPrices.get(i);
            if (highestPrice == null || currentPrice > highestPrice){
                highestPrice = currentPrice;
                highestPricePosition = i;
            }
        }

        // Populate the leading competitor field with the competitor matching the lowest price position
        opp.Most_Expensive_Competitor__c = competitors.get(highestPricePosition);
        opp.Most_Expensive_Competitor_Price__c = competitorPrices.get(highestPricePosition);
    }

}