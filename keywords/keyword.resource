*** Settings ***
Library    Process
Library    OperatingSystem

Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this keywords.resource in loaded.

*** Keywords ***
Execute Command and Verify Result
    [Arguments]    ${command}    ${result}=${null}
    ${output}=    Run Process    ${command}    shell=True    stdout=ON    stderr=ON
    Sleep    10s
    Should Contain    ${output.stdout}    ${result}    collapse_spaces=True    strip_spaces=True
    Log    ${output.stdout}

Remove Package Files
    Remove File    path=package.json
    Remove File    path=fhirpkg.lock.json

Initialize Folder
    Remove Package Files
    Execute Command and Verify Result    fhir spec r4    Now using FHIR specfication R4
    Execute Command and Verify Result    fhir init    Restore completed.
    Execute Command and Verify Result    fhir restore    Restore completed.
    Execute Command and Verify Result    fhir clear    Stack is now empty.