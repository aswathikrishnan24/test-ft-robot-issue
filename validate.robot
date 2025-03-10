*** Settings ***
Documentation     This test suite checks all the commands that have to do with quality control
...               validate

Library    Process
Resource    ./keywords/keyword.resource
Test Setup        Initialize Folder
Test Teardown     Terminate All Processes

*** Test Cases ***
Validate Valid Resource
    Execute Command and Verify Result    fhir push ./resources/resource.xml    Pushed 1 resource(s) on the stack.
    Execute Command and Verify Result    fhir validate    Result: VALID
