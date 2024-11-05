*** Settings ***
Resource    ../locators/tgdd.robot
Resource    ../keywords/common.robot
Library     SeleniumLibrary
Library     Collections
Library     OperatingSystem
Library     ../../lib/csv_data.py


*** Keywords ***
# HOMEPAGE
Hompage_Get_all_devices
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

# Add location form

LocationForm_AddLocation
    [Arguments]    ${province}    ${district}    ${ward}    ${address}
    Click_On_Element    ${Homepage_header_address}
    Verify_Element    ${Locationform_current_pro}    ${province}
    Verify_Element_Enable    ${Locationform_lst_ward}
    LocationForm_AddPro    ${province}
    LocationForm_AddDis    ${province}    ${district}
    LocationForm_AddWard    ${province}    ${district}    ${ward}
    LocationForm_AddAdressAndConfirmLocation    ${province}    ${district}    ${ward}    ${address}

LocationForm_AddPro
    [Arguments]    ${province}
    click element    ${Locationform_choose_pro.replace('%%d','${province}')}

LocationForm_AddDis
    [Arguments]    ${province}    ${district}
    click element    ${Locationform_choose_dis.replace('%%d','${district}')}
    Verify_Element_Displayed    ${Locationform_lst_ward}
    Verify_Element    ${Locationform_current_pro}    ${district}, ${province}

LocationForm_AddWard
    [Arguments]    ${province}    ${district}    ${ward}
    click element    ${Locationform_choose_ward.replace('%%d','${ward}')}
    Verify_Element    ${Locationform_current_pro}    ${ward}, ${district}, ${province}

LocationForm_AddAdressAndConfirmLocation
    [Arguments]    ${province}    ${district}    ${ward}    ${address}
    Input_Text_Into_Element    ${Locationform_input_address}    ${address}
    Verify_Element    ${Locationform_current_pro}    ${address}, ${ward}, ${district}, ${province}
    click element    ${Locationform_confirm_location}
    Verify_Element    ${Homepage_header_address}    ${address}

# iPhonepage

iPhonepage_Get_all_iphone
    ${iphones}=    Get WebElements    ${Product_Iphone_device_list}
    FOR    ${index}    ${iphone}    IN ENUMERATE    @{iphones}
        ${locator}=    Set Variable    ${Product_Iphone_device_item.replace('%%d','${index+1}')}
        DetailInfoPage_Go_to_Page_detail    ${locator}
        DetailInfoPage_Go_back_previous_page    ${locator}
    END
    RETURN    ${iphones}

# detail_info_page

DetailInfoPage_Go_to_Page_detail
    [Arguments]    ${locator}
    Execute JavaScript
    ...    var element=document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; element.click();
    DetailInfoPage_Get_info_detail_dttd

DetailInfoPage_Go_back_previous_page
    [Arguments]    ${locator}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s
    IF    '${status}'=='False'
        Go To    https://www.thegioididong.com/dtdd-apple-iphone
    END

DetailInfoPage_Get_info_detail_dttd
    Wait Until Element Is Visible    ${DetailInfoPage_Name_Iphone}    5s
    ${ram_devices}=    Get WebElements    ${DetailInfoPage_RAM_list_Iphone}
    ${length_ram}=    Get Length    ${ram_devices}
    IF    ${length_ram} != 0
        FOR    ${index}    ${ram_device}    IN ENUMERATE    @{ram_devices}
            ${ram}=    Set Variable    ${DetailInfoPage_RAM_Iphone.replace('%%d','${index+1}')}
            IF    ${index} == 0
                click element    ${DetailInfoPage_RAM_Iphone.replace('%%d',"${index+1}")}
            END
            ${name_device}=    get text    ${DetailInfoPage_Name_Iphone}
            ${ram_device}=    get text    ${ram}
            ${colors}=    Get_color_of_device
            writecsvfile    ${name_device}    ${ram_device}    ${colors}
            IF    ${index+1} == ${length_ram}    BREAK
            click element    ${DetailInfoPage_RAM_Iphone.replace('%%d','${index+2}')}
        END
    ELSE
        ${ram_device}=    Set Variable    ${EMPTY}
        ${name_device}=    get text    ${DetailInfoPage_Name_Iphone}
        ${colors}=    Get_color_of_device
        writecsvfile    ${name_device}    ${ram_device}    ${colors}
    END

DetailInfoPage_Get_color_of_device
    ${colors}=    Create List
    ${colors_of_ram_devices}=    Get WebElements    ${DetailInfoPage_Color_list_Iphone}
    ${length_colors}=    Get Length    ${colors_of_ram_devices}
    IF    ${length_colors} !=0
        FOR    ${index}    ${color_of_ram_device}    IN ENUMERATE    @{colors_of_ram_devices}
            ${color_locator}=    Set Variable    ${DetailInfoPage_Color_Iphone.replace('%%d','${index+1}')}
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

# Add to cart
# Phonepage

Phonepage_ChangeToIphonePage
    Click_On_Element    ${Homepage_menu_phone}
    Verify_Element    ${Phonepage_short}    Điện thoại
    Click_On_Element    ${iPhonepage_sort}
    Verify_Element    ${Phonepage_short}    iPhone

DetailInfoPage_AddtoCart
    [Arguments]    @{device}
    FOR    ${index}    ${name}    IN ENUMERATE    @{device}
        ${locator}=    Set Variable    ${Product_Iphone_device_name_text.replace('%%d','${name}')}
        scroll element into view    ${locator}

        click element    ${locator}
        Verify_Element_Displayed    ${DetailInfoPage_Addtocart_button}
        click element    ${DetailInfoPage_Addtocart_button}
        Header_CheckItemtocart    ${index+1}
        DetailInfoPage_Go_back_previous_page    ${locator}
    END

Header_CheckItemtocart
    [Arguments]    ${count}
    ${str_count}=    Convert To String    ${count}
    Verify_Element    ${Homepage_header_count_cart}    ${str_count}
