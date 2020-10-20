/**
 * Created by Marion on 20/10/2020.
 */

trigger CheckSecretInformation on Case (after insert, before update) {

    // Step 1: Create a collection containing each of our secret keywords
    Set<String> secretKeyWords = new Set<String>();
    secretKeyWords.add('Credit Card');
    secretKeyWords.add('SSN');
    secretKeyWords.add('Social Security Number');
    secretKeyWords.add('Passport');

    // Step 2: Check to see if our case contains any of the secret keywords
    List<Case> casesWithSecretInfo = new List<Case>();
    for (Case myCase : Trigger.new){
        for (String keyword : secretKeywords) {
            if(myCase.Description != null && myCase.Description.containsIgnoreCase(keyword)){
                casesWithSecretInfo.add(myCase);
                System.debug('Case ' + myCase.Id + ' Include secret keyword ' + keyword);
                break;
            }
        }
    }
    // Step 3: If our case contains a secret keyword, create a child case
    for (Case caseWithSecretInfo : casesWithSecretInfo){
        Case childCase        = new Case();
        childCase.Subject     = 'Warning: Parent case may contain secret info';
        childCase.ParentId    = caseWithSecretInfo.Id;
        childCase.IsEscalated = true;
        childCase.Priority    = 'High';
        childCase.Description = 'At least one of the following keywords were found ' + secretKeywords;
        insert childCase;
    }


}