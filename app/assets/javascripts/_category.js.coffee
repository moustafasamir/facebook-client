@Category_local_business_place = ["Airport","Arts/Entertainment/Nightlife","Attractions/Things to Do","Automotive","Bank/Financial Services","Bar","Book Store","Business Services","Church/Religious Organization","Club","Community/Government","Concert Venue","Education","Event Planning/Event Services","Food/Grocery","Health/Medical/Pharmacy","Home Improvement","Hospital/Clinic","Hotel","Landmark","Library","Local Business","Movie Theater","Museum/Art Gallery","Outdoor Gear/Sporting Goods","Pet Services","Professional Services","Public Places","Real Estate","Restaurant/Cafe","School","Shopping/Retail","Spas/Beauty/Personal Care","Sports Venue","Sports/Recreation/Activities","Tours/Sightseeing","Transit Stop","Transportation","University"]

@Category_company_organization_institution = ["Aerospace/Defense","Automobiles and Parts","Bank/Financial Institution","Biotechnology","Cause","Chemicals","Church/Religious Organization","Community Organization","Company","Computers/Technology","Consulting/Business Services","Education","Energy/Utility","Engineering/Construction","Farming/Agriculture","Food/Beverages","Government Organization","Health/Beauty","Health/Medical/Pharmaceuticals","Industrials","Insurance Company","Internet/Software","Legal/Law","Media/News/Publishing","Mining/Materials","Non-Governmental Organization (NGO)","Non-Profit Organization","Organization","Political Organization","Political Party","Retail and Consumer Merchandise","School","Small Business","Telecommunication","Transport/Freight","Travel/Leisure","University"]

@Category_brand_product = ["App Page","Appliances","Baby Goods/Kids Goods","Bags/Luggage","Building Materials","Camera/Photo","Cars","Clothing","Commercial Equipment","Computers","Drugs","Electronics","Food/Beverages","Furniture","Games/Toys","Health/Beauty","Home Decor","Household Supplies","Jewelry/Watches","Kitchen/Cooking","Movies/Music","Musical Instrument","Office Supplies","Outdoor Gear/Sporting Goods","Patio/Garden","Pet Supplies","Product/Service","Software","Tools/Equipment","Vitamins/Supplements","Website","Wine/Spirits"]

@Category_artist_band_public_figure = ["Actor/Director","Artist","Athlete","Author","Business Person","Chef","Coach","Comedian","Dancer","Doctor","Editor","Entertainer","Fictional Character","Government Official","Journalist","Lawyer","Monarch","Musician/Band","News Personality","Politician","Producer","Public Figure","Teacher","Writer"]

@Category_entertainment = ["Album","Amateur Sports Team","Book","Book Store","Concert Tour","Concert Venue","Fictional Character","Library","Magazine","Movie","Movie Theater","Music Award","Music Chart","Music Video","Musical Instrument","Playlist","Professional Sports Team","Radio Station","Record Label","School Sports Team","Song","Sports League","Sports Venue","Studio","TV Channel","TV Network","TV Show","TV/Movie Award"]



# document.getElementsByClassName = function(className)
#   {
#     var hasClassName = new RegExp("(?:^|\\s)" + className + "(?:$|\\s)");
#     var allElements = document.getElementsByTagName("*");
#     var results = [];

#     var element;
#     for (var i = 0; (element = allElements[i]) != null; i++) {
#       var elementClass = element.className;
#       if (elementClass && elementClass.indexOf(className) != -1 && hasClassName.test(elementClass))
#         results.push(element);
#     }

#     return results;
#   }
# arr = document.getElementsByClassName("old_ui_selector")[4].options
# a = ""
# for(i=0; i< arr.length;i++){
# a = a + "\"" + arr[i].text + "\","
# }
# console.log(a)

