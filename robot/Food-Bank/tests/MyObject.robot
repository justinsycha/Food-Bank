*** Settings ***
Resource  cumulusci/robotframework/Salesforce.robot
Library   cumulusci.robotframework.PageObjects
...  robot/Food-Bank/resources/MyObjectPages.py

Suite Setup     Run keywords
...  Create test data
...  AND  Open test browser
Suite Teardown  Delete records and close browser

*** Keywords ***
Create test data
    [Documentation]  Creates a MyObject record named "Leeroy Jenkins" if one doesn't exist

    ## Check to see if the record is already in the database,
    ## and do nothing if it already exists
    ${status}  ${result}=  Run keyword and ignore error  Salesforce get  MyObject__c  Name=Leeroy Jenkins
    Return from keyword if  '${status}'=='PASS'

    ## The record didn't exist, so create it
    Log  creating MyObject object with name 'Leeroy Jenkins'  DEBUG
    Salesforce Insert  MyObject__c  Name=Leeroy Jenkins

*** Test Cases ***
Test the MyObject listing page
    Go to page  Listing  MyObject__c
    Current page should be  Listing  MyObject__c

    Click on the row with name  Leeroy Jenkins
    Current page should be  Detail  MyObject__c