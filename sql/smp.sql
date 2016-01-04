set serveroutput off
set termout on 
set feedback off


select to_char(sysdate, 'YYYYMMDD HH24:MI:SS') from dual;

set serveroutput on
set termout on
set feedback on

alter session set events '10046 trace name context forever, level 12';

SELECT a.* from (SELECT asp.AccountSuggestedProductID, asp.AccountID, asp.AccountApplicationCode,asp.ProductOfferServicesDetailID, asp.DateObtained, asp.ActivityTypeID,asp.LOCIncrease, asp.NLOC,asp.BaseValue, asp.FICOScoreRange, asp.PrimaryDisclosureGroup,asp.AlternateDisclosureGroup, asp.ValueSourceCode, asp.SourceValue, asp.CITCode,asp.Rank, asp.RTID,
posd.ProductCode, posd.ProductApplicationCode, posd.CampaignCode,posd.SolicitationCode, posd.OfferRate, posd.OfferRateExpirationDate,posd.FeeRate, posd.FeeMin, posd.FeeMax,posd.RollRate, posd.OfferExpirationDate, posd.RollType,posd.StartDate, posd.EndDate, posd.AcquisitionStrategyCode,posd.SpecialTerms,posd.OfferTypeID,posd.IncentiveBonus, posd.Duration, posd.Amount, posd.NoPurchase, posd.Combo, posd.TriggerTermsInfo, prd.Description, prd.MarketingText
FROM Product prd, AccountSuggestedProduct_active asp, ProductOfferServicesDetail posd WHERE asp.AccountApplicationCode = 'TSYS' AND asp.AccountID=(select axr.AccountID from SRS_XREF axr
where axr.accountnumber = 5121071765817931 ) AND asp.ProductOfferServicesDetailID = posd.ProductOfferServicesDetailID AND prd.Applicationcode = posd.ProductApplicationCode AND prd.ProductCode = posd.ProductCode AND (posd.OfferTypeID = 100 OR posd.OfferTypeID = 102 OR posd.OfferTypeID = 200 OR posd.OfferTypeID = 400 OR posd.OfferTypeID = 500 OR posd.OfferTypeID = 600 OR posd.OfferTypeID = 800 OR posd.OfferTypeID = 801 OR posd.OfferTypeID = 802 OR posd.OfferTypeID = 803
OR posd.OfferTypeID = 804 OR posd.OfferTypeID = 805 OR posd.OfferTypeID = 806 OR posd.OfferTypeID = 807 OR posd.OfferTypeID = 808 OR posd.OfferTypeID = 809 OR posd.OfferTypeID = 810 OR posd.OfferTypeID = 811 OR posd.OfferTypeID = 812 OR posd.OfferTypeID = 813 OR posd.OfferTypeID = 814 OR posd.OfferTypeID = 815 ) ORDER BY  asp.Rank DESC ) a, ASP_SUPPRESSION b
WHERE a.accountid = b.accountid(+) AND( b.accountid is null or a.offertypeid not in ('300', '302', '303', '304', '306', '307', '308'))
;

SELECT a.* from (SELECT asp.AccountSuggestedProductID, asp.AccountID, asp.AccountApplicationCode,asp.ProductOfferServicesDetailID, asp.DateObtained, asp.ActivityTypeID,asp.LOCIncrease, asp.NLOC,asp.BaseValue, asp.FICOScoreRange, asp.PrimaryDisclosureGroup,asp.AlternateDisclosureGroup, asp.ValueSourceCode, asp.SourceValue, asp.CITCode,asp.Rank, asp.RTID,
posd.ProductCode, posd.ProductApplicationCode, posd.CampaignCode,posd.SolicitationCode, posd.OfferRate, posd.OfferRateExpirationDate,posd.FeeRate, posd.FeeMin, posd.FeeMax,posd.RollRate, posd.OfferExpirationDate, posd.RollType,posd.StartDate, posd.EndDate, posd.AcquisitionStrategyCode,posd.SpecialTerms,posd.OfferTypeID,posd.IncentiveBonus, posd.Duration, posd.Amount, posd.NoPurchase, posd.Combo, posd.TriggerTermsInfo, prd.Description, prd.MarketingText
FROM Product prd, AccountSuggestedProduct_active asp, ProductOfferServicesDetail posd WHERE asp.AccountApplicationCode = 'TSYS' AND asp.AccountID=(select axr.AccountID from SRS_XREF axr
where axr.accountnumber = 5121071984977771 ) AND asp.ProductOfferServicesDetailID = posd.ProductOfferServicesDetailID AND prd.Applicationcode = posd.ProductApplicationCode AND prd.ProductCode = posd.ProductCode AND (posd.OfferTypeID = 100 OR posd.OfferTypeID = 102 OR posd.OfferTypeID = 200 OR posd.OfferTypeID = 400 OR posd.OfferTypeID = 500 OR posd.OfferTypeID = 600 OR posd.OfferTypeID = 800 OR posd.OfferTypeID = 801 OR posd.OfferTypeID = 802 OR posd.OfferTypeID = 803
OR posd.OfferTypeID = 804 OR posd.OfferTypeID = 805 OR posd.OfferTypeID = 806 OR posd.OfferTypeID = 807 OR posd.OfferTypeID = 808 OR posd.OfferTypeID = 809 OR posd.OfferTypeID = 810 OR posd.OfferTypeID = 811 OR posd.OfferTypeID = 812 OR posd.OfferTypeID = 813 OR posd.OfferTypeID = 814 OR posd.OfferTypeID = 815 ) ORDER BY  asp.Rank DESC ) a, ASP_SUPPRESSION b
WHERE a.accountid = b.accountid(+) AND( b.accountid is null or a.offertypeid not in ('300', '302', '303', '304', '306', '307', '308'))
;


SELECT a.* from (SELECT asp.AccountSuggestedProductID, asp.AccountID, asp.AccountApplicationCode,asp.ProductOfferServicesDetailID, asp.DateObtained, asp.ActivityTypeID,asp.LOCIncrease, asp.NLOC,asp.BaseValue, asp.FICOScoreRange, asp.PrimaryDisclosureGroup,asp.AlternateDisclosureGroup, asp.ValueSourceCode, asp.SourceValue, asp.CITCode,asp.Rank, asp.RTID,
posd.ProductCode, posd.ProductApplicationCode, posd.CampaignCode,posd.SolicitationCode, posd.OfferRate, posd.OfferRateExpirationDate,posd.FeeRate, posd.FeeMin, posd.FeeMax,posd.RollRate, posd.OfferExpirationDate, posd.RollType,posd.StartDate, posd.EndDate, posd.AcquisitionStrategyCode,posd.SpecialTerms,posd.OfferTypeID,posd.IncentiveBonus, posd.Duration, posd.Amount, posd.NoPurchase, posd.Combo, posd.TriggerTermsInfo, prd.Description, prd.MarketingText
FROM Product prd, AccountSuggestedProduct_active asp, ProductOfferServicesDetail posd WHERE asp.AccountApplicationCode = 'TSYS' AND asp.AccountID=(select axr.AccountID from SRS_XREF axr
where axr.accountnumber = 6035320212158461 ) AND asp.ProductOfferServicesDetailID = posd.ProductOfferServicesDetailID AND prd.Applicationcode = posd.ProductApplicationCode AND prd.ProductCode = posd.ProductCode AND (posd.OfferTypeID = 100 OR posd.OfferTypeID = 102 OR posd.OfferTypeID = 200 OR posd.OfferTypeID = 400 OR posd.OfferTypeID = 500 OR posd.OfferTypeID = 600 OR posd.OfferTypeID = 800 OR posd.OfferTypeID = 801 OR posd.OfferTypeID = 802 OR posd.OfferTypeID = 803
OR posd.OfferTypeID = 804 OR posd.OfferTypeID = 805 OR posd.OfferTypeID = 806 OR posd.OfferTypeID = 807 OR posd.OfferTypeID = 808 OR posd.OfferTypeID = 809 OR posd.OfferTypeID = 810 OR posd.OfferTypeID = 811 OR posd.OfferTypeID = 812 OR posd.OfferTypeID = 813 OR posd.OfferTypeID = 814 OR posd.OfferTypeID = 815 ) ORDER BY  asp.Rank DESC ) a, ASP_SUPPRESSION b
WHERE a.accountid = b.accountid(+) AND( b.accountid is null or a.offertypeid not in ('300', '302', '303', '304', '306', '307', '308'))
;

Select pi.ACCOUNTSUGGESTEDPRODUCTID,pi.ACCOUNTID, pi.ACCOUNTAPPLICATIONCODE,pi.PRODUCTOFFERSERVICESDETAILID, pi.DATEOBTAINED,pi.ACTIVITYTYPEID,pi.LOCINCREASE,pi.NLOC, pi.BASEVALUE,pi.FICOSCORERANGE,pi.PRIMARYDISCLOSUREGROUP,pi.ALTERNATEDISCLOSUREGROUP, pi.VALUESOURCECODE,pi.SOURCEVALUE,pi.CITCODE,pi.RANK, pi.RTID,
posd.ProductCode, posd.ProductApplicationCode, posd.CampaignCode,posd.SolicitationCode, posd.OfferRate, posd.OfferRateExpirationDate,posd.FeeRate, posd.FeeMin, posd.FeeMax,posd.RollRate, posd.OfferExpirationDate, posd.RollType,posd.StartDate, posd.EndDate, posd.AcquisitionStrategyCode,posd.SpecialTerms,posd.OfferTypeID,posd.IncentiveBonus, posd.Duration, posd.Amount, posd.NoPurchase, posd.Combo, posd.TriggerTermsInfo, prd.Description, prd.MarketingText, axc.Portfolio, pi.PRSTRAT PIPRSTRAT 
FROM Product prd, PaymentIncentives pi, ProductOfferServicesDetail posd, acct_xref_combined axc 
WHERE axc.accountnumber = 5049940131870650 AND pi.AccountID = axc.AccountId AND pi.ProductOfferServicesDetailID = posd.ProductOfferServicesDetailID AND prd.Applicationcode = posd.ProductApplicationCode AND prd.ProductCode = posd.ProductCode ORDER BY  pi.Rank DESC
;
SELECT a.* from (SELECT asp.AccountSuggestedProductID, asp.AccountID, asp.AccountApplicationCode,asp.ProductOfferServicesDetailID, asp.DateObtained, asp.ActivityTypeID,asp.LOCIncrease, asp.NLOC,asp.BaseValue, asp.FICOScoreRange, asp.PrimaryDisclosureGroup,asp.AlternateDisclosureGroup, asp.ValueSourceCode, asp.SourceValue, asp.CITCode,asp.Rank, asp.RTID,
posd.ProductCode, posd.ProductApplicationCode, posd.CampaignCode,posd.SolicitationCode, posd.OfferRate, posd.OfferRateExpirationDate,posd.FeeRate, posd.FeeMin, posd.FeeMax,posd.RollRate, posd.OfferExpirationDate, posd.RollType,posd.StartDate, posd.EndDate, posd.AcquisitionStrategyCode,posd.SpecialTerms,posd.OfferTypeID,posd.IncentiveBonus, posd.Duration, posd.Amount, posd.NoPurchase, posd.Combo, posd.TriggerTermsInfo, prd.Description, prd.MarketingText 
FROM Product prd, AccountSuggestedProduct_active asp, ProductOfferServicesDetail posd WHERE asp.AccountApplicationCode = 'TSYS' AND asp.AccountID=(select axr.AccountID 
from SRS_XREF axr where axr.accountnumber = 6035320165413400 ) AND asp.ProductOfferServicesDetailID = posd.ProductOfferServicesDetailID AND prd.Applicationcode = posd.ProductApplicationCode AND prd.ProductCode = posd.ProductCode AND (posd.OfferTypeID = 100 OR posd.OfferTypeID = 102 OR posd.OfferTypeID = 200 OR posd.OfferTypeID = 400 OR posd.OfferTypeID = 500 OR posd.OfferTypeID = 600 OR posd.OfferTypeID = 800 OR posd.OfferTypeID = 801 OR posd.OfferTypeID = 802 OR posd.OfferTypeID = 803 OR posd.OfferTypeID = 804 OR posd.OfferTypeID = 805 OR posd.OfferTypeID = 806 OR posd.OfferTypeID = 807 OR posd.OfferTypeID = 808 OR posd.OfferTypeID = 809 OR posd.OfferTypeID = 810 OR posd.OfferTypeID = 811 OR posd.OfferTypeID = 812 OR posd.OfferTypeID = 813 OR posd.OfferTypeID = 814 OR posd.OfferTypeID = 815 ) 
ORDER BY  asp.Rank DESC ) a, ASP_SUPPRESSION b WHERE a.accountid = b.accountid(+) AND( b.accountid is null or a.offertypeid not in ('300', '302', '303', '304', '306', '307', '308'))
;
SELECT a.* from (SELECT asp.AccountSuggestedProductID, asp.AccountID, asp.AccountApplicationCode,asp.ProductOfferServicesDetailID, asp.DateObtained, asp.ActivityTypeID,asp.LOCIncrease, asp.NLOC,asp.BaseValue, asp.FICOScoreRange, asp.PrimaryDisclosureGroup,asp.AlternateDisclosureGroup, asp.ValueSourceCode, asp.SourceValue, asp.CITCode,asp.Rank, asp.RTID,
posd.ProductCode, posd.ProductApplicationCode, posd.CampaignCode,posd.SolicitationCode, posd.OfferRate, posd.OfferRateExpirationDate,posd.FeeRate, posd.FeeMin, posd.FeeMax,posd.RollRate, posd.OfferExpirationDate, posd.RollType,posd.StartDate, posd.EndDate, posd.AcquisitionStrategyCode,posd.SpecialTerms,posd.OfferTypeID,posd.IncentiveBonus, posd.Duration, posd.Amount, posd.NoPurchase, posd.Combo, posd.TriggerTermsInfo, prd.Description, prd.MarketingText 
FROM Product prd, AccountSuggestedProduct_active asp, ProductOfferServicesDetail posd WHERE asp.AccountApplicationCode = 'TSYS' AND asp.AccountID=(select axr.AccountID from SRS_XREF axr where axr.accountnumber = 5121070103211500 ) AND asp.ProductOfferServicesDetailID = posd.ProductOfferServicesDetailID AND prd.Applicationcode = posd.ProductApplicationCode AND prd.ProductCode = posd.ProductCode AND (posd.OfferTypeID = 100 OR posd.OfferTypeID = 102 ) 
ORDER BY  asp.Rank DESC ) a, ASP_SUPPRESSION b WHERE a.accountid = b.accountid(+) AND( b.accountid is null or a.offertypeid not in ('300', '302', '303', '304', '306', '307', '308'))
;

alter session set events '10046 trace name context off';
