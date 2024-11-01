*** Settings ***
Resource    ../locators/tgdd.robot
Resource    ../keywords/common.robot
Library     SeleniumLibrary
Library     Collections
Library     OperatingSystem
Library     ../../lib/csv_data.py


*** Keywords ***
GetTextOnElement
    [Arguments]    ${locator}
    ${text}=    get text    ${locator}
    RETURN    ${text}

Get_all_devices
    ${devices}=    Get WebElements    ${Hompage_device_name}
    ${prices}=    Get WebElements    ${Hompage_device_price}
    ${columnNames}=    Create List
    ${columnPrices}=    Create List
    FOR    ${device}    IN    @{devices}
        ${name}=    GetTextOnElement    ${device}
        Append To List    ${columnNames}    ${name}
    END
    FOR    ${price}    IN    @{prices}
        ${price_product}=    GetTextOnElement    ${price}
        Append To List    ${columnPrices}    ${price_product}
    END
    RETURN    ${columnNames}    ${columnPrices}

Output_device_and_price
    [Arguments]    ${devices}    ${prices}
    ${file}=    writecsvfile    ${devices}    ${prices}

get_all_iphone
    ${iphones}=    Get WebElements    ${Product_Iphone_device_list}
    FOR    ${index}    ${iphone}    IN ENUMERATE    @{iphones}
        ${locator}=    Set Variable    ${Product_Iphone_device_item.replace('%%d','${index+1}')}
        Go_to_Page_detail    ${locator}
        Go_back_after_get_data    ${locator}
    END
    RETURN    ${iphones}

Go_to_Page_detail
    [Arguments]    ${locator}
    Execute JavaScript
    ...    var element=document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; element.click();
    Get_info_detail_dttd

Go_back_after_get_data
    [Arguments]    ${locator}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s
    IF    '${status}'=='False'
        Go To    https://www.thegioididong.com/dtdd-apple-iphone
    END

Get_info_detail_dttd
    Wait Until Element Is Visible    ${Detail_Name_Iphone}    5s
    ${ram_devices}=    Get WebElements    ${Detail_RAM_list_Iphone}
    ${length_ram}=    Get Length    ${ram_devices}
    IF    ${length_ram} != 0
        FOR    ${index}    ${ram_device}    IN ENUMERATE    @{ram_devices}
            ${ram}=    Set Variable    ${Detail_RAM_Iphone.replace('%%d','${index+1}')}
            IF    ${index} == 0
                click element    ${Detail_RAM_Iphone.replace('%%d',"${index+1}")}
            END
            ${name_device}=    get text    ${Detail_Name_Iphone}
            ${ram_device}=    get text    ${ram}
            ${colors}=    Get_color_of_device
            writecsvfile    ${name_device}    ${ram_device}    ${colors}
            IF    ${index+1} == ${length_ram}    BREAK
            click element    ${Detail_RAM_Iphone.replace('%%d','${index+2}')}
        END
    ELSE
        ${ram_device}=    Set Variable    ${EMPTY}
        ${name_device}=    get text    ${Detail_Name_Iphone}
        ${colors}=    Get_color_of_device
        writecsvfile    ${name_device}    ${ram_device}    ${colors}
    END

Get_color_of_device
    ${colors}=    Create List
    ${colors_of_ram_devices}=    Get WebElements    ${Detail_Color_list_Iphone}
    ${length_colors}=    Get Length    ${colors_of_ram_devices}
    IF    ${length_colors} !=0
        FOR    ${index}    ${color_of_ram_device}    IN ENUMERATE    @{colors_of_ram_devices}
            ${color_locator}=    Set Variable    ${Detail_Color_Iphone.replace('%%d','${index+1}')}
            ${color_product}=    get text    ${color_locator}
            Append To List    ${colors}    ${color_product}
        END
    ELSE
        ${colors}=    Set Variable    ${EMPTY}
    END
    RETURN    ${colors}

writecsvfile
    [Arguments]    ${name_device}    ${ram_device}    ${colors}
    ${file_path}=    Set Variable    ${CURDIR}\iphone.csv
    ${columns}=    Create List    Name Device    Ram    Colors
    ${row}=    Create List    ${name_device}    ${ram_device}    ${colors}
    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${file_path}
    IF    '${file_exists}' == 'False'
        write_csv    ${file_path}    ${columns}    ${row}
    ELSE
        write_csv    ${file_path}    None    ${row}
    END
