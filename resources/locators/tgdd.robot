*** Variables ***
# Home_page
${Hompage_device_name}              xpath=//a[contains(@href,'/dtdd/')]//h3
${Hompage_device_price}             xpath=//a[contains(@href,'/dtdd/')]//strong[@class='price']# product
${Product_Iphone_device_title}      xpath=//div[@class='filter-total ']//span[text()='iPhone (Apple)'][1]
${Product_Iphone_device_list}       xpath=//ul[@class='listproduct']/li
${Product_Iphone_device_item}       //ul[@class='listproduct']/li[%%d]/a
${Product_Iphone_device_name}       xpath=//ul[@class='listproduct']/li[%%d]//h3# detail_info
${Detail_Name_Iphone}               xpath=//div[@class='product-name']/h1
${Detail_RAM_list_Iphone}           xpath=//div[@class='scrolling_inner']//a[contains(text(),'GB') or contains(text(),'TB')]
${Detail_RAM_Iphone}                xpath=//div[@class='scrolling_inner'][1]/div[1]/a[%%d]
${Detail_Color_list_Iphone}         xpath=//div[@class='scrolling_inner'][2]/div[1]/a
${Detail_Color_Iphone}              xpath=//div[@class='scrolling_inner'][2]/div[1]/a[%%d]
