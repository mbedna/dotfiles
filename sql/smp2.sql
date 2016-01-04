
Select pi.ACCOUNTSUGGESTEDPRODUCTID,pi.ACCOUNTID, pi.ACCOUNTAPPLICATIONCODE,pi.PRODUCTOFFERSERVICESDETAILID, pi.DATEOBTAINED,pi.ACTIVITYTYPEID,pi.LOCINCREASE,pi.NLOC, pi.BASEVALUE,pi.FICOSCORERANGE,pi.PRIMARYDISCLOSUREGROUP,pi.ALTERNATEDISCLOSUREGROUP, pi.VALUESOURCECODE,pi.SOURCEVALUE,pi.CITCODE,pi.RANK, pi.RTID,
posd.ProductCode, posd.ProductApplicationCode, posd.CampaignCode,posd.SolicitationCode, posd.OfferRate, posd.OfferRateExpirationDate,posd.FeeRate, posd.FeeMin, posd.FeeMax,posd.RollRate, posd.OfferExpirationDate, posd.RollType,posd.StartDate, posd.EndDate, posd.AcquisitionStrategyCode,posd.SpecialTerms,posd.OfferTypeID,posd.IncentiveBonus, posd.Duration, posd.Amount, posd.NoPurchase, posd.Combo, posd.TriggerTermsInfo, prd.Description, prd.MarketingText, axc.Portfolio, pi.PRSTRAT PIPRSTRAT 
FROM Product prd, PaymentIncentives pi, ProductOfferServicesDetail posd, acct_xref_combined axc 
WHERE axc.accountnumber = 5049940131870650 AND pi.AccountID = axc.AccountId AND pi.ProductOfferServicesDetailID = posd.ProductOfferServicesDetailID AND prd.Applicationcode = posd.ProductApplicationCode AND prd.ProductCode = posd.ProductCode ORDER BY  pi.Rank DESC
;
