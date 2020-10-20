trigger DedupeAccount on Account (after insert) {
    for (Account acc : Trigger.New){
        Case c    = new Case();
        c.OwnerId = acc.ownerId;
        c.Subject = 'Dedupe this account';
        c.AccountId  = acc.Id;
        insert c;
    }
    

}