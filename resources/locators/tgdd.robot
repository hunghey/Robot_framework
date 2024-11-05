*** Variables ***
# Homepage
${Homepage_menu_phone}                  xpath=//a//span[contains(text(),'Điện thoại')]
${Homepage_header_address}              xpath=//header//a[contains(@class,'address')]//span
${Homepage_header_count_cart}           xpath=//span[contains(@class,'has-cart')]

# Locationform
${Locationform_current_pro}             xpath=//span[@class='choose-text']//following-sibling::span
${Locationform_lst_dis}                 xpath=//a[@data-list='#lst-dis']
${Locationform_lst_ward}                xpath=//a[@data-list='#lst-ward']
${Locationform_choose_pro}              xpath=//div[@id='lst-prov']//a[contains(text(),'%%d')]
${Locationform_choose_dis}              xpath=//div[@id='lst-dis']//a[contains(text(),'%%d')]
${Locationform_choose_ward}             xpath=//div[@id='lst-ward']//a[contains(text(),'%%d')]
${Locationform_input_address}           xpath=//input[@id='hdLocationAddress']
${Locationform_confirm_location}        xpath=//div[@class='location-confirm']

# Phonepage
${Phonepage_short}                      xpath=//ul[@class='breadcrumb']//p

# iPhonepage
${iPhonepage_sort}                      xpath=//div[contains(@class,'lst-quicklink')]/a[contains(@href,'iphone')]
${iPhonepage_device_name}               xpath=//a[contains(@href,'/dtdd/')]//h3
${iPhonepage_device_price}              xpath=//a[contains(@href,'/dtdd/')]//strong[@class='price']# product

# Detail iphone
${Product_Iphone_device_title}          xpath=//div[@class='filter-total ']//span[text()='iPhone (Apple)'][1]
${Product_Iphone_device_list}           xpath=//ul[@class='listproduct']/li
${Product_Iphone_device_item}           xpath=//ul[@class='listproduct']/li[%%d]/a
${Product_Iphone_device_name}           xpath=//ul[@class='listproduct']/li[%%d]//h3
${Product_Iphone_device_name_text}      xpath=//ul[@class='listproduct']//h3[contains(text(),'%%d')]

# detail_info
${DetailInfoPage_Name_Iphone}           xpath=//div[@class='product-name']/h1
${DetailInfoPage_RAM_list_Iphone}       xpath=//div[@class='scrolling_inner']//a[contains(text(),'GB') or contains(text(),'TB')]
${DetailInfoPage_RAM_Iphone}            xpath=//div[@class='scrolling_inner'][1]/div[1]/a[%%d]
${DetailInfoPage_Color_list_Iphone}     xpath=//div[@class='scrolling_inner'][2]/div[1]/a
${DetailInfoPage_Color_Iphone}          xpath=//div[@class='scrolling_inner'][2]/div[1]/a[%%d]
${DetailInfoPage_Addtocart_button}      xpath=//i[contains(@class,'addtocart')]/parent::a
